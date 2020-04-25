#include "cc_sakura.h"

void gen(Node *node){
	if(node->kind==ND_NUM){
		printf("push %d\n",node->val);
		return;
	}

	//check left hand side
	gen(node->lhs);
	//check right hand side
	gen(node->rhs);

	printf("	pop rdi\n");
	printf("	pop rax\n");

	switch(node->kind){
		case ND_ADD:
			printf("	add rax,rdi\n");
			break;
		case ND_SUB:
			printf("	sub rax,rdi\n");
			break;
		case ND_MUL:
			printf("	imul rax,rdi\n");
			break;
		case ND_DIV:
			printf("	cqo\n");
			printf("	idiv rax,rdi\n");
			break;
		case ND_GT:
			printf("	cmp rdi,rax\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_GE:
			printf("	cmp rdi,rax\n");
			printf("	setge al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LT:
			printf("	cmp rax,rdi\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LE:
			printf("	cmp rax,rdi\n");
			printf("	setle al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_EQ:
			printf("	cmp rax,rdi\n");
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_NE:
			printf("	cmp rax,rdi\n");
			printf("	setne al\n");
			printf("	movzb rax,al\n");
			break;
	}

	printf("	push rax\n");
}

