#include "cc_sakura.h"

void expand_next(Node *node){
	while(node){
		gen(node);
		printf("\n	pop rax\n");
		node=node->block_code;
	}
	printf("	push rax\n");
}

void expand_block_code(Node *node){
	while(node){
		gen(node);
		printf("\n	pop rax\n");
		node=node->block_code;
	}
	printf("	push rax\n");
}


void gen_gvar(Node *node){
	if(node->type->is_thread_local){
		printf("	mov rax, fs:0\n");
		printf("	add rax, fs:%.*s@tpoff\n", node->val, node->str);
	}else{
		printf("	lea rax,  %.*s[rip]\n", node->val, node->str);
	}
	printf("	push rax\n");
}

void gen_lvar(Node *node){
	if(node->kind != ND_LVAR && node->kind != ND_LARRAY && node->kind != ND_CALL_FUNC){
		error_at(token->str,"not a variable");
	}

	printf("	mov rax,rbp\n");
	printf("	sub rax,%d\n", node->offset);
	printf("	push rax\n");
}

void gen_struc(Node *node){
	if(node->kind != ND_DOT && node->kind != ND_ARROW){
		error_at(token->str, "not a struct");
	}

	gen(node->lhs);
	gen(node->rhs);

	printf("	pop rdi\n");
	printf("	pop rax\n");
	printf("	add rax,rdi\n");
	printf("	push rax\n");
}

void gen_args(Node *args){
	int reg_num;
	int arg_count = 0;
	const char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};


	while(args){
		gen(args);
		arg_count++;
		args=args->next;
	}

	for(reg_num=arg_count;reg_num > 0;reg_num--){
		printf("	pop rax\n");
		printf("	mov %s,rax\n", reg[reg_num-1]);
	}
	printf("	mov rax,%d\n", arg_count);

}

void gen_address(Node *node){
	/**/ if(node->kind == ND_DEREF)   gen(node->rhs);
	else if(node->kind == ND_DOT)     gen_struc(node);
	else if(node->kind == ND_ARROW)   gen_struc(node);
	else if(node->kind == ND_GVAR)    gen_gvar(node);
	else if(node->kind == ND_GARRAY)  gen_gvar(node);
	else if(node->kind == ND_LVAR)    gen_lvar(node);
	else if(node->kind == ND_LARRAY)  gen_lvar(node);
	else error_at(token->str, "can not assign");
}

void gen_calc(Node *node){
	//                        void _Bool  char  int   ptr  array
	const char reg_ax[6][4]={"eax","eax","eax","eax","rax","rax"};
	const char reg_dx[6][4]={"edx","edx","edx","edx","rdx","rdx"};
	const char reg_di[6][4]={"edi","edi","edi","edi","rdi","rdi"};
	int reg_ty = (node->type->ty == ENUM) ? 1 : (int)node->type->ty;

	switch(node->kind){
		case ND_ADD:
			printf("	add %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_SUB:
			printf("	sub %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_MUL:
			printf("	imul %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_DIV:
			printf("	cqo\n");
			printf("	idiv %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_MOD:
			printf("	cqo\n");
			printf("	idiv %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	mov %s,%s\n", reg_ax[reg_ty], reg_dx[reg_ty]);
			break;
		case ND_GT:
			printf("	cmp %s,%s\n", reg_di[reg_ty], reg_ax[reg_ty]);
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_GE:
			printf("	cmp %s,%s\n", reg_di[reg_ty], reg_ax[reg_ty]);
			printf("	setle al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LT:
			printf("	cmp %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LE:
			printf("	cmp %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	setle al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_EQ:
			printf("	cmp %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_NE:
			printf("	cmp %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	setne al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_AND:
			printf("	and %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	movzb rax,al\n");
			break;
		case ND_OR:
			printf("	or %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	movzb rax,al\n");
			break;
		default:
			error_at(token->str, "cannot code gen");
	}
}

void gen_expr(Node *node){
	switch(node->kind){
		case ND_NUM:
			printf("	push %d\n", node->val);
			return;
		case ND_GVAR:
			gen_gvar(node);

			printf("	pop rax\n");
			printf("	mov rax,[rax]\n");
			printf("	push rax\n");

			return;
		case ND_LVAR:
			gen_lvar(node);

			printf("	pop rax\n");
			if(node->type->ty <= CHAR){
				printf("	movzx eax,BYTE PTR [rax]\n");
				printf("	movsx eax,al\n");
			}else{
				printf("	mov rax,[rax]\n");
			}
			printf("	push rax\n");

			// init formula
			if(node->block_code != NULL) gen(node->block_code);
			return;
		case ND_GARRAY:
			gen_gvar(node);

			// init formula
			if(node->block_code != NULL) expand_next(node->block_code);
			return;
		case ND_LARRAY:
			gen_lvar(node);

			// init formula
			if(node->block_code != NULL) expand_next(node->block_code);
			return;
		case ND_PREID:
			// ++p -> p += 1
			gen_expr(node->lhs);
			printf("	push rax\n");
			return;
		case ND_POSTID:
			// push
			gen_address(node->lhs); // push lhs
			gen_expr(node->rhs->rhs->rhs);          // push rhs
			
			// calc
			printf("	pop rdi\n");    // rhs
			printf("	pop rax\n");    // lhs
			printf("	push [rax]\n"); // Evacuation lhs data
			printf("	push rax\n");   // Evacuation lhs address
			printf("	mov rax,[rax]\n"); // deref lhs

			gen_calc(node->rhs->rhs);
			printf("	push rax\n"); // rhs op lhs

			// assign
			printf("	pop rdi\n"); // src
			printf("	pop rax\n"); // dst
			if(node->lhs->type->ty <= CHAR){
				if(node->lhs->type->ty == BOOL){
					printf("	mov R8B,dil\n");
					printf("	cmp R8B,0\n");
					printf("	setne dl\n");
					printf("	movzb rdi,dl\n");
				}
				printf("	mov [rax],dil\n");
			}else if(node->lhs->type->ty == INT){
				printf("	mov [rax],edi\n");
			}else{
				printf("	mov [rax],rdi\n");
			}

			printf("	push rax\n");
			return;
		case ND_STR:
			printf("	lea rax, .LC%d[rip]\n", node->val);
			printf("	push rax\n");
			return;
		case ND_ASSIGN:
			gen_address(node->lhs);
			gen_expr(node->rhs);

			printf("	pop rdi\n");
			printf("	pop rax\n");
			if(node->lhs->type->ty <= CHAR){
				printf("	mov [rax],dil\n");
			}else if(node->lhs->type->ty == INT){
				printf("	mov [rax],edi\n");
			}else{
				printf("	mov [rax],rdi\n");
			}

			printf("	push rdi\n");
			return;
		case ND_COMPOUND:
			// push
			gen_address(node->lhs); // push lhs
			gen_expr(node->rhs->rhs);  // push rhs

			// calc
			printf("	pop rdi\n");  // rhs
			printf("	pop rax\n");  // lhs
			printf("	push rax\n"); // Evacuation lhs
			printf("	mov rax,[rax]\n"); // deref lhs

			gen_calc(node->rhs);
			printf("	push rax\n"); // rhs op lhs

			// assign
			printf("	pop rdi\n"); // src
			printf("	pop rax\n"); // dst
			if(node->lhs->type->ty <= CHAR){
				if(node->lhs->type->ty == BOOL){
					printf("	mov R8B,dil\n");
					printf("	cmp R8B,0\n");
					printf("	setne dl\n");
					printf("	movzb rdi,dl\n");
				}
				printf("	mov [rax],dil\n");
			}else if(node->lhs->type->ty == INT){
				printf("	mov [rax],edi\n");
			}else{
				printf("	mov [rax],rdi\n");
			}

			printf("	push rdi\n");
			return;
		case ND_DOT:
		case ND_ARROW:
			gen_struc(node);
			// if it's an array or struct, ignore the deref
			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				printf("	pop rax\n");
				printf("	push [rax]\n");
			}
			return;
		case ND_TERNARY:
			// condition
			gen_expr(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n", node->val);

			// true
			gen_expr(node->rhs);
			printf("	jmp .LifEnd%03d\n", node->val);
			printf(".Lelse%03d:\n", node->val);

			// false
			gen_expr(node->next);
			printf(".LifEnd%03d:\n", node->val);
			printf("	push rax\n");
			return;
		case ND_NOT:
			gen_expr(node->rhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			printf("	push rax\n");
			return;
		case ND_ADDRESS:
			gen_address(node->rhs);
			printf("	push rax\n");
			return;
		case ND_DEREF:
			gen_expr(node->rhs);
			printf("	pop rax\n");
			if(node->type->ty <= CHAR){
				printf("	movzx eax,BYTE PTR [rax]\n");
				printf("	movsx eax,al\n");
			}else{
				printf("	mov rax,[rax]\n");
			}
			printf("	push rax\n");
			return;
		case ND_CALL_FUNC:
			gen_args(node->rhs);

			printf("	push rbp\n");
			printf("	mov rbp,rsp\n");
			printf("	and rsp,-16\n");

			printf("	call %.*s\n", node->val, node->str);

			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n");

			printf("	push rax\n");
			return;
		default:
			// check left hand side
			gen_expr(node->lhs);
			// check right hand side
			gen_expr(node->rhs);

			// pop two value
			printf("	pop rdi\n");
			printf("	pop rax\n");
			// calculation lhs and rhs
			gen_calc(node);
			// push result
			printf("	push rax\n");
	}
}

void gen(Node *node){
	Node *cases;
	char reg[6][4]  = {"rdi","rsi","rdx","rcx","r8","r9"};

	// generate assembly
	switch(node->kind){
		case ND_NULL_STMT:
			// NULL statement
			printf("	push rax\n");
			return;
		case ND_IF:
			gen(node->lhs);

			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .LifEnd%03d\n", node->val);
			gen(node->rhs);

			printf(".LifEnd%03d:\n", node->val);
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n", node->val);

			// expr in if
			gen(node->rhs->lhs);
			printf("	jmp .LifEnd%03d\n", node->val);
			printf(".Lelse%03d:\n", node->val);

			// expr in else
			gen(node->rhs->rhs);
			printf(".LifEnd%03d:\n", node->val);
			return;
		case ND_SWITCH:
			// gen cases condtion
			cases = node->next;
			while(cases){
				gen(cases);

				printf("	pop rax\n");
				printf("	cmp rax,0\n");
				printf("	jne .LcaseBegin%03d\n", cases->val);
				cases = cases->next;
			}

			// gen default condtion
			if(node->lhs){
				printf("	jmp .LcaseBegin%03d\n", node->lhs->val);
			}

			// gen code block
			gen(node->rhs);

			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_CASE:
			printf(".LcaseBegin%03d:\n", node->val);
			gen(node->rhs);
			return;
		case ND_FOR:
			// init
			gen_expr(node->lhs);

			// condition
			printf(".LloopBegin%03d:\n", node->val);
			if(node->lhs->next->kind != ND_NULL_STMT){
				gen(node->lhs->next);
				printf("	pop rax\n");
				printf("	cmp rax,0\n");
				// if cond true then jump to  loop end.
				printf("	je .LloopEnd%03d\n", node->val);
			}

			// gen block
			gen(node->rhs);

			// gen update expression
			printf(".LloopCont%03d:\n", node->val);
			if(node->lhs->next->next->kind != ND_NULL_STMT){
				gen(node->lhs->next->next);
				printf("	pop rax\n");
			}

			// continue
			printf("	jmp .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_WHILE:
			// condition
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .LloopEnd%03d\n", node->val);

			// else expression
			gen(node->rhs);

			// continue
			printf(".LloopCont%03d:\n", node->val);
			printf("	jmp .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_DOWHILE:
			// codeblock
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->rhs);

			// condition
			gen(node->lhs);
			//printf("	pop rax\n");
			printf("	cmp rax,0\n");
			// break loop
			printf("	je .LloopEnd%03d\n", node->val);

			// continue
			printf(".LloopCont%03d:\n", node->val);
			printf("	jmp .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_CONTINUE:
			printf("	jmp .LloopCont%03d\n", node->val);
			return;
		case ND_BREAK:
			printf("	jmp .LloopEnd%03d\n", node->val);
			return;
		case ND_BLOCK:
			expand_block_code(node->block_code);
			return;
		case ND_ARG:
			while(node){
				// push register argument saved
				printf("	push %s\n", reg[node->val]);
				gen_lvar(node->rhs);
				printf("	pop rax\n");
				printf("	pop rdi\n");
				printf("	mov [rax],rdi\n");
				printf("	push rdi\n");
				// pop stack top
				printf("	pop rax\n");
				node=node->next;
			}

			return;
		case ND_RETURN:
			if(node->rhs){
				gen_expr(node->rhs);
			}
			printf("	pop rax\n");
			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n");
			printf("	ret\n");
			return;
		default:
			gen_expr(node);
			printf("	pop rax\n");
	}
}

