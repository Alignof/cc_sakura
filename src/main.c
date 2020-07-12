#include "cc_sakura.h"

int main(int argc,char **argv){
	int i,j;
	int t_size;

	char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};

	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	// get source code
	user_input=argv[1];
	// tokenize
	token=tokenize(argv[1]);
	// make syntax tree
	program();

	if(func_list==NULL)
		fprintf(stderr,"function is not found.");


	// generate code
	printf(".intel_syntax noprefix\n");
	printf(".globl main\n");

	// set global variable
	GVar *start=globals;
	for (GVar *var=start;var;var=var->next){
		t_size=type_size(var->type.ty);
		printf(".comm	_%.*s,%ld,%d\n",var->len,var->name,var->type.alloc_size,t_size);
	}

	//generate assembly at first expr
	for(i=0;func_list[i];i++){
		label_begin=0;
		label_end=0;
		label_else=0;

		printf("%s:\n",func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n",func_list[i]->lvarc*8);

		if(func_list[i]->args){
			// push argument stack
			for(j=func_list[i]->args->val;j>=0;j--) printf("	push %s\n",reg[j]);

			// set local variable
			gen(func_list[i]->args);
		}

		for(j=0;func_list[i]->code[j]!=NULL;j++){
			gen(func_list[i]->code[j]);
			printf("\n	pop rax\n");
		}

		// epiroge
		// rax=return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}

