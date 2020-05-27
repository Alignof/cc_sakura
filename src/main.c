#include "cc_sakura.h"

int main(int argc,char **argv){
	int i,j;
	Node *tmp;

	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	/*
	printf("ND_ADD:%d\n",	ND_ADD);
	printf("ND_SUB:%d\n",	ND_SUB);
	printf("ND_MUL:%d\n",	ND_MUL);
	printf("ND_DIV:%d\n",	ND_DIV);
	printf("ND_GT:%d\n",	ND_GT);
	printf("ND_GE:%d\n",	ND_GE);
	printf("ND_LT:%d\n",	ND_LT);
	printf("ND_LE:%d\n",	ND_LE);
	printf("ND_EQ:%d\n",	ND_EQ);
	printf("ND_NE:%d\n",	ND_NE);
	printf("ND_ASSIGN%d\n",	ND_ASSIGN);
	printf("ND_LVAR:%d\n",	ND_LVAR);
	printf("ND_NUM:%d\n",	ND_NUM);
	printf("ND_IF:%d\n",	ND_IF);
	printf("ND_ELSE:%d\n",	ND_ELSE);
	printf("ND_IFELSE:%d\n",ND_IFELSE);
	printf("ND_WHILE:%d\n",	ND_WHILE);
	printf("ND_FOR:%d\n",	ND_FOR);
	printf("ND_BLOCK:%d\n",	ND_BLOCK);
	printf("ND_ARG:%d\n",	ND_ARG);
	printf("ND_CALL_FUNC:%d\n",ND_CALL_FUNC);
	printf("ND_RETURN:%d\n",ND_RETURN);
	*/


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

	//generate assembly at first expr
	for(i=0;func_list[i];i++){
		label_begin=0;
		label_end=0;
		label_else=0;

		printf("%s:\n",func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n",func_list[i]->lvarc*8);

		// set local variable
		if(func_list[i]->args)
			gen(func_list[i]->args);

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

