#include "cc_sakura.h"

int label_begin=0;
int label_end=0;
int label_else=0;

void gen_lval(Node *node){
	if(node->kind != ND_LVAR)
		error(token->str,"not a variable");

	printf("	mov rax,rbp\n");
	printf("	sub rax, %d\n",node->offset);
	printf("	push rax\n");
}

void gen(Node *node){
	Node *tmp;
	switch(node->kind){
		case ND_RETURN:
			gen(node->rhs);
			printf("	pop rax\n");
			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n");
			printf("	ret\n");
			return;
		case ND_NUM:
			printf("	push %d\n",node->val);
			return;
		case ND_LVAR:
			gen_lval(node);
			printf("	pop rax\n");
			printf("	mov rax,[rax]\n");
			printf("	push rax\n");
			return;
		case ND_ASSIGN:
			// gen_lval(variable) = gen(expr)
			gen_lval(node->lhs);
			gen(node->rhs);

			printf("	pop rdi\n");
			printf("	pop rax\n");
			printf("	mov [rax],rdi\n");
			printf("	push rdi\n");
			return;
		case ND_IF:
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lend%03d\n",label_end);
			gen(node->rhs);
			printf(".Lend%03d:\n",label_end);
			label_end++;
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n",label_else);
			// expr in if
			gen(node->rhs->lhs);
			printf("	jmp .Lend%03d\n",label_end);
			printf(".Lelse%03d:\n",label_else);
			// expr in else
			gen(node->rhs->rhs);
			printf(".Lend%03d:\n",label_end);
		
			label_end++;
			label_else++;
			return;
		case ND_WHILE:
			// condition
			printf(".Lbegin%03d:\n",label_begin);
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			// if cond true then loop end.
			printf("	je .Lend%03d\n",label_end);
			
			// else expression
			gen(node->rhs);
			// continue
			printf("	jmp .Lbegin%03d\n",label_end);
			printf(".Lend%03d:\n",label_begin);
		
			label_begin++;
			label_end++;
			return;
		case ND_BLOCK:
			tmp=node->vector;
			while(tmp->vector){
				gen(tmp->vector);
				tmp=tmp->vector;
			}
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

