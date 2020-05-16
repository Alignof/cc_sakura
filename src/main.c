#include "cc_sakura.h"

int main(int argc,char **argv){
	int i;
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

	printf(".intel_syntax noprefix\n");
	printf(".global main\n");
	printf("main:\n");

	printf("	push rbp\n");
	printf("	mov rbp, rsp\n");
	//allocate 208bit=1byte(8bit)*26(a-z)
	printf("	sub rsp,208\n");


	//generate assembly at first expr
	for(i=0;code[i];i++){
		gen(code[i]);
		//printf("	pop rax\n\n");
		printf("\n");
	}

	//rax=return value
	printf("	pop rax\n");
	printf("	mov rsp,rbp\n");
	printf("	pop rbx\n");
	printf("	ret\n");

	return 0;
}

