#include "cc_sakura.h"
//                         void _Bool  char   enum  int   ptr  array struct
const char reg_ax[8][4] = {"al", "al", "al", "eax","eax","rax","rax","rax"};
const char reg_dx[8][4] = {"dl", "dl", "dl", "edx","edx","rdx","rdx","rdx"};
const char reg_di[8][4] = {"dil","dil","dil","edi","edi","rdi","rdi","rdi"};
const char reg[6][4]    = {"rdi","rsi","rdx","rcx","r8","r9"};


void expand_next(Node *node){
	while(node){
		gen(node);
		node = node->next;
	}
	printf("	push rax\n");
}

void expand_block_code(Node *node){
	while(node){
		gen(node);
		node = node->block_code;
	}
}


void gen_gvar_label(GVar *gvar, Node *init){
	Type *type = get_pointer_type(gvar->type);
	if(init->kind == ND_STR){
		if(gvar->type->ty == PTR){
			printf("	.quad	.LC%d\n", init->val);
		}else if(gvar->type->ty == ARRAY){
			printf("	.string \"%.*s\"\n", init->len, init->str);
			if(init->offset) printf("        .zero	%d\n", init->offset);
		}
	}else{
		if(type->ty < INT){
			printf("	.byte	%d\n", init->val);
		}else{
			printf("	.long	%d\n", init->val);
		}
	}
}

void gen_gvar(Node *node){
	if(node->type->is_thread_local){
		printf("	mov rax, fs:0\n");
		printf("	add rax, fs:%.*s@tpoff\n", node->len, node->str);
	}else{
		printf("	lea rax,%.*s[rip]\n", node->len, node->str);
	}
	printf("	push rax\n");
}

void gen_lvar(Node *node){
	if(node->kind != ND_LVAR && node->kind != ND_CALL_FUNC){
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

	gen_expr(node->lhs);
	gen_expr(node->rhs);

	printf("	pop rdi\n");
	printf("	pop rax\n");
	printf("	add rax,rdi\n");
	printf("	push rax\n");
}

void gen_args(Node *args){
	int reg_num;
	int arg_count = 0;

	while(args){
		gen_expr(args);
		arg_count++;
		args=args->block_code;
	}

	for(reg_num = arg_count;reg_num > 0;reg_num--){
		printf("	pop rax\n");
		printf("	mov %s,rax\n", reg[reg_num-1]);
	}
	printf("	mov rax,%d\n", arg_count);

}

void gen_address(Node *node){
	/**/ if(node->kind == ND_DEREF)   gen_expr(node->rhs);
	else if(node->kind == ND_DOT)     gen_struc(node);
	else if(node->kind == ND_ARROW)   gen_struc(node);
	else if(node->kind == ND_GVAR)    gen_gvar(node);
	else if(node->kind == ND_LVAR)    gen_lvar(node);
	else error_at(token->str, "can not assign");
}

void gen_calc(Node *node){
	int reg_ty = (int)node->type->ty;

	switch(node->kind){
		case ND_ADD:
			printf("	add %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_SUB:
			printf("	sub %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			break;
		case ND_MUL:
			if(node->type->ty == CHAR){
				printf("	movsx eax,al\n");
				printf("	movsx edi,dil\n");
				printf("	imul eax,edi\n");
			}else{
				printf("	imul %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			}
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
		case ND_BIT_AND:
			printf("	and %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	movzb rax,al\n");
			break;
		case ND_BIT_OR:
			printf("	or %s,%s\n", reg_ax[reg_ty], reg_di[reg_ty]);
			printf("	movzb rax,al\n");
			break;
		case ND_NOT:
			printf("	cmp %s,0\n", reg_ax[node->rhs->type->ty]);
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			break;
		default:
			error_at(token->str, "cannot code gen");
	}
}

void gen_expr(Node *node){
	int reg_ty; 
	int reg_lty;
	int reg_rty;

	if(node && node->type) reg_ty = (int)node->type->ty;
	if(node->lhs && node->lhs->type) reg_lty = (int)node->lhs->type->ty;
	if(node->rhs && node->rhs->type) reg_rty = (int)node->rhs->type->ty;

	switch(node->kind){
		case ND_NUM:
			printf("	push %d\n", node->val);
			return;
		case ND_CAST:
			gen_expr(node->rhs);
			printf("	pop rax\n");
			if(reg_ty > reg_rty){
				if(reg_rty == BOOL){
					printf("        movzx eax,al\n");
				}else if(reg_rty == CHAR){
					printf("        movsx eax,al\n");
				}else if(reg_rty == INT){
					printf("        cdqe\n");
				}
			}
			printf("	push rax\n");
			return;
		case ND_GVAR:
			gen_gvar(node);

			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				printf("	pop rax\n");
				if(node->type->ty <= CHAR){
					printf("        mov al,BYTE PTR [rax]\n");
				}else{
					printf("	mov %s,[rax]\n", reg_ax[reg_ty]);
				}
				printf("	push rax\n");
			}
			return;
		case ND_LVAR:
			gen_lvar(node);

			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				printf("	pop rax\n");
				if(node->type->ty <= CHAR){
					printf("        mov al,BYTE PTR [rax]\n");
				}else{
					printf("	mov %s,[rax]\n", reg_ax[reg_ty]);
				}
				printf("	push rax\n");
			}
			return;
		case ND_PREID:
			// ++p -> p += 1
			gen(node->lhs);
			printf("	push rax\n");
			return;
		case ND_POSTID:
			// push
			gen_address(node->lhs); // push lhs
			gen_expr(node->rhs->rhs->rhs);// push rhs
			
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
			if(node->lhs->type->ty == BOOL){
				printf("	mov R8B,dil\n");
				printf("	cmp R8B,0\n");
				printf("	setne dl\n");
				printf("	movzb rdi,dl\n");
			}
			printf("	mov [rax],%s\n", reg_di[reg_lty]);

			// already evacuated
			//printf("	push rax\n");
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
			printf("	mov [rax],%s\n", reg_di[reg_ty]);

			printf("	push rdi\n");
			return;
		case ND_COMPOUND:
			// push
			gen_address(node->lhs);  // push lhs
			gen_expr(node->rhs->rhs);// push rhs

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
			printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
			printf("	je .Lelse%03d\n", node->val);

			// true
			gen(node->rhs);
			printf("	jmp .LifEnd%03d\n", node->val);
			printf(".Lelse%03d:\n", node->val);

			// false
			gen(node->next);
			printf(".LifEnd%03d:\n", node->val);
			printf("	push rax\n");
			return;
		case ND_AND:
			gen_expr(node->lhs);
			printf("	je .LlogicEnd%03d\n", node->val);
			gen_expr(node->rhs);

			printf("	pop rax\n");
			printf("	pop rdx\n");
			printf("	and al,dl\n");
			printf("	movzb rax,al\n");
			printf("	push rax\n");
			printf(".LlogicEnd%03d:\n", node->val);
			return;
		case ND_OR:
			gen_expr(node->lhs);
			printf("	jne .LlogicEnd%03d\n", node->val);
			gen_expr(node->rhs);

			printf("	pop rax\n");
			printf("	pop rdx\n");
			printf("	or al,dl\n");
			printf("	movzb rax,al\n");
			printf("	push rax\n");
			printf(".LlogicEnd%03d:\n", node->val);
			return;
		case ND_NOT:
			gen_expr(node->rhs);
			printf("	pop rax\n");
			gen_calc(node);
			printf("	push rax\n");
			return;
		case ND_ADDRESS:
			gen_address(node->rhs);// printf("	push rax\n");
			return;
		case ND_DEREF:
			gen(node->rhs);
			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				if(node->type->ty <= CHAR){
					printf("        mov al,BYTE PTR [rax]\n");
				}else{
					printf("	mov %s,[rax]\n", reg_ax[reg_ty]);
				}
			}
			printf("	push rax\n");
			return;
		case ND_CALL_FUNC:
			gen_args(node->rhs);

			printf("	push rbp\n");
			printf("	mov rbp,rsp\n");
			printf("	and rsp,-16\n");

			printf("	call %.*s\n", node->len, node->str);

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
	int reg_rty;
	if(node->rhs && node->rhs->type) reg_rty = (int)node->rhs->type->ty;

	// generate assembly
	switch(node->kind){
		case ND_NULL_STMT:
			// NULL statement
			return;
		case ND_IF:
			gen(node->lhs);
			printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
			printf("	je .LifEnd%03d\n", node->val);
			gen(node->rhs);

			printf(".LifEnd%03d:\n", node->val);
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
			printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
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

				printf("	cmp %s,0\n", reg_ax[cases->type->ty]);
				printf("	jne .LcaseBegin%03d\n", cases->val);
				cases = cases->next;
			}

			// gen default condtion
			if(node->lhs){
				printf("	jmp .LcaseBegin%03d\n", node->lhs->val);
			}
			printf("	jmp .LloopEnd%03d\n", node->val);

			// gen code block
			gen(node->rhs);

			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_FOR:
			// init
			gen(node->lhs);

			// condition
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->lhs->next);
			if(node->lhs->next->kind != ND_NULL_STMT){
				printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
				printf("	je .LloopEnd%03d\n", node->val);
			}

			// gen block
			gen(node->rhs);

			// gen update expression
			printf(".LloopCont%03d:\n", node->val);
			gen(node->lhs->next->next);

			// continue
			printf("	jmp .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_WHILE:
			// condition
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->lhs);
			printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
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

			// continue
			printf(".LloopCont%03d:\n", node->val);

			// condition
			gen(node->lhs);
			printf("	cmp %s,0\n", reg_ax[node->lhs->type->ty]);
			// break loop
			printf("	je .LloopEnd%03d\n", node->val);

			printf("	jmp .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_CONTINUE:
			printf("	jmp .LloopCont%03d\n", node->val);
			return;
		case ND_BREAK:
			printf("	jmp .LloopEnd%03d\n", node->val);
			return;
		case ND_CASE:
			printf(".LcaseBegin%03d:\n", node->val);
			gen(node->rhs);
			return;
		case ND_ARG:
			while(node){
				if(node->rhs && node->rhs->type) reg_rty = (int)node->rhs->type->ty;
				// push register argument saved
				printf("        push %s\n", reg[node->val]);
				gen_lvar(node->rhs);
				printf("	pop rax\n");
				printf("	pop rdi\n");
				printf("	mov [rax],%s\n", reg_di[reg_rty]);
				node=node->next;
			}
			return;
		case ND_BLOCK:
			expand_block_code(node->rhs);
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
			printf("	pop rax\n\n");
			return;
	}
}

void gen_main(void){
	int i;
	int j;


	printf("// x86-64\n");
	printf(".intel_syntax noprefix\n");

	// set global variable
	printf(".data\n");
	GVar *start = globals;
	for (GVar *var = start;var;var = var->next){
		set_gvar(var);
	}

	// set string
	for (Str *var = strings;var;var = var->next){
		printf(".LC%d:\n", var->label_num);
		printf("	.string \"%.*s\"\n", var->len, var->str);
	}

	llid           = 0;
	label_num      = 0;
	label_loop_end = 0;
	labels_head    = NULL;
	labels_tail    = NULL;

	//generate assembly at first expr
	printf(".text\n");
	for(i = 0;func_list[i];i++){
		if(func_list[i]->code[0] == NULL) continue;
		printf(".globl %s\n", func_list[i]->name);
		printf("%s:\n", func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n", func_list[i]->stack_size);

		if(func_list[i]->args){
			// set local variable
			gen(func_list[i]->args);
		}

		for(j = 0;func_list[i]->code[j] != NULL;j++){
			// gen code
			gen(func_list[i]->code[j]);
		}

		// epiroge
		// rax = return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}
}
