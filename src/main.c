#include "cc_sakura.h"

int main(int argc,char **argv){
	int i,j;
	locals=NULL;

	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	user_input=argv[1];
	//tokenize
	token=tokenize(argv[1]);
	//make syntax tree
	program();

	if(func_list==NULL)
		fprintf(stderr,"function is not found.");


	// generate code
	printf(".intel_syntax noprefix\n");
	printf(".globl main\n");

	//generate assembly at first expr
	for(i=0;func_list[i];i++){
		printf("%s:\n",func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n",func_list[i]->lvarc*8);

		for(j=0;func_list[i]->code[j]!=NULL;j++){
			gen(func_list[i]->code[j]);
			printf("	pop rax\n\n");
		}

		// epiroge
		// rax=return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}

