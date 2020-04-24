#include "cc_sakura.h"

int main(int argc,char **argv){
	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	user_input=argv[1];
	//tokenize
	token=tokenize(argv[1]);
	//make syntax tree
	Node *node=expr();

	printf(".intel_syntax noprefix\n");
	printf(".global main\n");
	printf("main:\n");

	//generate assembly
	gen(node);

	printf("	pop rax\n");
	printf("	ret\n");

	return 0;
}

