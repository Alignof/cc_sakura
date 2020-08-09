#include "cc_sakura.h"

int label_begin;
int label_end;
int label_else;

void gen_gvar(Node *node){
	printf("	lea rax,  _%.*s[rip]\n",node->val,node->str);
	printf("	push rax\n",rsp++);
}

void gen_lvar(Node *node){
	if(node->kind != ND_LVAR && node->kind != ND_CALL_FUNC)
		error_at(token->str,"not a variable");

	printf("	mov rax,rbp\n");
	printf("	sub rax,%d\n",node->offset);
	printf("	push rax\n",rsp++);
}

void gen_arg(int arg_num,Node *tmp){
	char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};

	gen(tmp);
	printf("	pop rax\n",rsp++);
	printf("	mov %s,rax\n",reg[arg_num]);
}

void gen(Node *node){
	Node *tmp;
	int arg=0;
	int lbegin=label_begin;
	int lend=label_end;
	int lelse=label_else;

	switch(node->kind){
		case ND_RETURN:
			gen(node->rhs);
			printf("	pop rax\n",rsp++);
			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n",rsp++);
			printf("	ret\n");
			return;
		case ND_NUM:
			printf("	push %d\n",node->val,rsp++);
			return;
		case ND_GVAR:
			gen_gvar(node);

			if(node->type.ty != ARRAY){
				printf("	pop rax\n",rsp++);
				printf("	mov rax,[rax]\n");
				printf("	push rax\n",rsp++);
			}

			return;
		case ND_LVAR:
			gen_lvar(node);

			if(node->type.ty != ARRAY){
				printf("	pop rax\n",rsp++);
				if(node->type.ty==CHAR){
					printf("	movzx ecx,BYTE PTR [rax]\n");
					printf("	push rcx\n",rsp++);
				}else{
					printf("	mov rax,[rax]\n");
					printf("	push rax\n",rsp++);
				}
			}

			return;
		case ND_STR:
			printf("	lea rax, .LC%d[rip]\n",node->val);
			printf("	push rax\n",rsp++);
			return;
		case ND_ASSIGN:
			// gen_lvar(variable) = gen(expr)

			if(node->lhs->kind==ND_DEREF) gen(node->lhs->rhs);
			else if(node->lhs->kind==ND_LVAR) gen_lvar(node->lhs);
			else if(node->lhs->kind==ND_GVAR) gen_gvar(node->lhs);

			gen(node->rhs);

			if(node->lhs->type.ty==CHAR){
				printf("	pop rcx\n",rsp++);
				printf("	pop rax\n",rsp++);
				printf("	mov [rax],cl\n");
				printf("	push rcx\n",rsp++);
			}else{
				printf("	pop rdi\n",rsp++);
				printf("	pop rax\n",rsp++);
				printf("	mov [rax],rdi\n");
				printf("	push rdi\n",rsp++);
			}

			return;
		case ND_IF:
			printf("	push rax\n",rsp++);
			gen(node->lhs);

			printf("	pop rax\n",rsp++);
			printf("	cmp rax,0\n");
			printf("	je .Lend%03d\n",lend);
			printf("	pop rax\n",rsp++);
			label_end++;
			gen(node->rhs);

			printf(".Lend%03d:\n",lend);
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
			printf("	pop rax\n",rsp++);
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n",lelse);
			label_else++;

			// expr in if
			gen(node->rhs->lhs);
			printf("	jmp .Lend%03d\n",lend);
			printf(".Lelse%03d:\n",lelse);
			label_end++;

			// expr in else
			gen(node->rhs->rhs);
			printf(".Lend%03d:\n",lend);

			return;
		case ND_FOR:
			// adjust rsp
			printf("	push rax\n",rsp++);

			gen(node->lhs);
			// condition
			printf(".Lbegin%03d:\n",lbegin);
			gen(node->lhs->vector);
			printf("	pop rax\n",rsp++);
			printf("	cmp rax,0\n");
			// if cond true then loop end.
			printf("	je .Lend%03d\n",lend);
			label_end++;

			// else expression
			gen(node->rhs);
			gen(node->lhs->vector->vector);
			printf("	pop rax\n",rsp++);

			// continue
			printf("	jmp .Lbegin%03d\n",lend);
			printf(".Lend%03d:\n",lbegin);
			label_begin++;

			return;
		case ND_WHILE:
			// adjust rsp
			printf("	push rax\n",rsp++);

			// condition
			printf(".Lbegin%03d:\n",lbegin);
			gen(node->lhs);
			printf("	pop rax\n",rsp++);
			printf("	cmp rax,0\n");
			// if cond true then loop end.
			printf("	je .Lend%03d\n",lend);
			label_end++;

			// else expression
			gen(node->rhs);
			printf("	pop rax\n",rsp++);

			// continue
			printf("	jmp .Lbegin%03d\n",lend);
			printf(".Lend%03d:\n",lbegin);
			label_begin++;

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

			if(rsp%2) printf("	sub rsp,8\n");
			//if(rsp%2) printf("	push rax\n");
			printf("	call %s\n",node->str);
			//if(rsp%2) printf("	pop rax\n");
			if(rsp%2) printf("	add rsp,8\n");

			printf("	push rax\n",rsp++);
			return;
		case ND_ARG:
			tmp=node;
			while(tmp){
				// generate arg as lvar
				gen(tmp->vector);
				printf("	pop rax\n",rsp++);
				gen_lvar(tmp->vector);
				printf("	pop rax\n",rsp++);
				printf("	pop rdi\n",rsp++);
				printf("	mov [rax],rdi\n");
				printf("	push rdi\n",rsp++);
				tmp=tmp->rhs;
				// pop stack top
				printf("	pop rax\n",rsp++);
			}

			return;
		case ND_ADDRESS:
			gen_lvar(node->rhs);
			return;
		case ND_DEREF:
			gen(node->rhs);
			printf("	pop rax\n",rsp++);
			printf("	mov rax,[rax]\n");
			printf("	push rax\n",rsp++);
			return;
	}


	//check left hand side
	gen(node->lhs);
	//check right hand side
	gen(node->rhs);

	printf("	pop rdi\n",rsp++);
	printf("	pop rax\n",rsp++);

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

	printf("	push rax\n",rsp++);
}

