#include "cc_sakura.h"

int label_begin=0;
int label_end=0;
int label_else=0;

void gen_lvar(Node *node){
	if(node->kind != ND_LVAR && node->kind != ND_CALL_FUNC)
		error(token->str,"not a variable");

	printf("	mov rax,rbp\n");
	printf("	sub rax,%d\n",node->offset);
	printf("	push rax\n");
}

void gen_arg(int arg_num,Node *tmp){
	char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};

	gen(tmp);
	printf("	pop rax\n");
	printf("	mov %s,rax\n",reg[arg_num]);
}

void gen(Node *node){
	int arg=0;
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
			gen_lvar(node);

			if(node->type.ty != ARRAY){
				printf("	pop rax\n");
				printf("	mov rax,[rax]\n");
				printf("	push rax\n");
			}

			return;
		case ND_ASSIGN:
			// gen_lvar(variable) = gen(expr)

			if(node->lhs->kind==ND_DEREF) gen(node->lhs->rhs);
			else gen_lvar(node->lhs);

			gen(node->rhs);

			printf("	pop rdi\n");
			printf("	pop rax\n");
			printf("	mov [rax],rdi\n");
			printf("	push rdi\n");
			return;
		case ND_IF:
			// adjust rsp
			printf("	push rax\n");
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lend%03d\n",label_end);
			// adjust rsp
			printf("	pop rax\n");
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
			// adjust rsp
			printf("	push rax\n");
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
		case ND_CALL_FUNC:
			tmp=node->vector;

			if(tmp!=NULL){
				while(tmp->vector!=NULL){
					gen_arg(arg,tmp);
					tmp=tmp->vector;
					arg++;
				}
				gen_arg(arg,tmp);
			}

			printf("	call %s\n",node->str);
			printf("	push rax\n");
			return;
		case ND_ARG:
			tmp=node;
			while(tmp){
				// generate arg as lvar
				gen(tmp->vector);
				printf("	pop rax\n");
				gen_lvar(tmp->vector);
				printf("	pop rax\n");
				printf("	pop rdi\n");
				printf("	mov [rax],rdi\n");
				printf("	push rdi\n");
				tmp=tmp->rhs;
				// pop stack top
				printf("	pop rax\n");
			}

			return;
		case ND_ADDRESS:
			gen_lvar(node->rhs);
			return;
		case ND_DEREF:
			gen(node->rhs);
			printf("	pop rax\n");
			printf("	mov rax,[rax]\n");
			printf("	push rax\n");
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

