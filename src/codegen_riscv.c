#include "cc_sakura.h"
//                         void _Bool  char   enum  int   ptr  array struct
const char reg_size[8]  = {'b',  'b',  'b',  'w',  'w',  'w',  'w',  'w'};
const char reg_ax[8][4] = {"al", "al", "al", "eax","eax","rax","rax","rax"};
const char reg_dx[8][4] = {"dl", "dl", "dl", "edx","edx","rdx","rdx","rdx"};
const char reg_di[8][4] = {"dil","dil","dil","edi","edi","rdi","rdi","rdi"};
const char reg[8][3]    = {"a0","a1","a2","a3","a4","a5","a6","a7"};

void push(const char *reg){
	printf("		addi sp,sp,-4\n");
	printf("		sw  %s,0(sp)\n", reg);
}

void pop(const char *reg){
	printf("		lw  %s,0(sp)\n", reg);
	printf("		addi sp,sp,4\n");
}


void expand_next(Node *node){
	while(node){
		gen(node);
		node = node->next;
	}
	push("a5");
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
			printf("	.word	%d\n", init->val);
		}
	}
}


void gen_gvar(Node *node){
	if(node->type->is_thread_local){
		printf("	mov rax, fs:0\n");
		printf("	add rax, fs:%.*s@tpoff\n", node->len, node->str);
	}else{
		printf("	lui a5,%%hi(%.*s)\n", node->len, node->str);
		printf("	addi a5,a5,%%lo(%.*s)\n", node->len, node->str);
	}
	push("a5");
}

void gen_lvar(Node *node){
	if(node->kind != ND_LVAR && node->kind != ND_CALL_FUNC){
		error_at(token->str,"not a variable");
	}

	printf("	addi a5,s0,-%d\n", node->offset + 8);
	push("a5");
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
		pop("t0");
		printf("	mv %s,t0\n", reg[reg_num-1]);
	}

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
			printf("	add a5,a5,a4\n");
			break;
		case ND_SUB:
			printf("	sub a5,a5,a4\n");
			break;
		case ND_MUL:
			printf("	mul a5,a5,a4\n");
			break;
		case ND_DIV:
			printf("	div a5,a5,a4\n");
			break;
		case ND_MOD:
			printf("	rem a5,a5,a4\n");
			break;
		case ND_GT:
			printf("	sgt a5,a5,a4\n");
			printf("	andi a5,a5,0xff\n");
			break;
		case ND_GE:
			printf("	slt a5,a5,a4\n");
			printf("	xori a5,a5,1\n");
			printf("	andi a5,a5,0xff\n");
			break;
		case ND_LT:
			printf("	slt a5,a5,a4\n");
			printf("	andi a5,a5,0xff\n");
			break;
		case ND_LE:
			printf("	sgt a5,a5,a4\n");
			printf("	xori a5,a5,1\n");
			printf("	andi a5,a5,0xff\n");
			break;
		case ND_EQ:
			printf("	sub a5,a5,a4\n");
			printf("	seqz a5,a5\n");
			printf("	andi a5,a5,0xff\n");
			break;
		case ND_NE:
			printf("	sub a5,a5,a4\n");
			printf("	snez a5,a5\n");
			printf("	andi a5,a5,0xff\n");
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
			printf("	seqz a5,a5\n");
			printf("	andi a5,a5,0xff\n");
			break;
		default:
			error_at(token->str, "cannot code gen");
	}
}

void gen_expr(Node *node){
	int reg_ty; 
	int reg_rty;

	if(node && node->type) reg_ty = (int)node->type->ty;
	if(node->rhs && node->rhs->type) reg_rty = (int)node->rhs->type->ty;

	switch(node->kind){
		case ND_NUM:
			printf("	li a5,%d\n", node->val);
			push("a5");
			return;
		case ND_CAST:
			gen_expr(node->rhs);
			pop("a5");
			if(reg_ty > reg_rty){
				if(reg_rty == BOOL){
					printf("        movzx eax,al\n");
				}else if(reg_rty == CHAR){
					printf("        movsx eax,al\n");
				}else if(reg_rty == INT){
					printf("        cdqe\n");
				}
			}
			push("a5");
			return;
		case ND_GVAR:
			gen_gvar(node);

			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				pop("a5");
				printf("	l%c a5,0(a5)\n", reg_size[reg_ty]);
				push("a5");
			}
			return;
		case ND_LVAR:
			gen_lvar(node);

			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				pop("a5");
				printf("	l%c a5,0(a5)\n", reg_size[reg_ty]);
				push("a5");
			}
			return;
		case ND_PREID:
			// ++p -> p += 1
			gen(node->lhs);
            push("a5");
			return;
		case ND_POSTID:
			// push
			gen_address(node->lhs); // push lhs
			gen_expr(node->rhs->rhs->rhs);// push rhs
			
			// calc
			pop("a4"); // rhs
			pop("a5"); // lhs

			printf("	lw t0, 0(a5)\n"); // Evacuation lhs data to temporary register
			push("t0");// push temporary register
			push("a5");// Evacuation lhs address
			printf("	lw a5, 0(a5)\n"); // deref lhs

			gen_calc(node->rhs->rhs);
			push("a5"); // rhs op lhs

			// assign
			pop("a4"); // src
			pop("a5"); // dst
			if(node->lhs->type->ty == BOOL){
				printf("	mov R8B,dil\n");
				printf("	cmp R8B,0\n");
				printf("	setne dl\n");
				printf("	movzb rdi,dl\n");
			}
			printf("	sw a4, 0(a5)\n"); // deref lhs

			// already evacuated
			//printf("	push rax\n");
			return;
		case ND_STR:
			printf("	lui a5,%%hi(.LC%d)\n", node->val);
			printf("	addi a5,a5,%%lo(.LC%d)\n", node->val);
			push("a5");
			return;
		case ND_ASSIGN:
			gen_address(node->lhs);
			gen_expr(node->rhs);

			pop("a4");
			pop("a5");
			printf("	s%c a4,0(a5)\n", reg_size[reg_ty]);

			push("a4");
			return;
		case ND_COMPOUND:
			// push
			gen_address(node->lhs);  // push lhs
			gen_expr(node->rhs->rhs);// push rhs

			// calc
			pop("a4"); // rhs
			pop("a5"); // lhs
			push("a5"); // Evacuation lhs
			printf("	lw a5, 0(a5)\n"); // deref lhs

			gen_calc(node->rhs);
			push("a5"); // rhs op lhs

			// assign
			pop("a4"); // src
			pop("a5"); // dst
			if(node->lhs->type->ty <= CHAR){
				if(node->lhs->type->ty == BOOL){
					printf("	mov R8B,dil\n");
					printf("	cmp R8B,0\n");
					printf("	setne dl\n");
					printf("	movzb rdi,dl\n");
				}
				printf("	sb a4,0(a5)\n");
			}else{
				printf("	sw a4,0(a5)\n");
			}

			push("a4");
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
			pop("a5");
			printf("	li a4,0\n");
			printf("	beq a5,a4,.Lelse%03d\n", node->val);

			// true
			gen(node->rhs);
			printf("	j .LifEnd%03d\n", node->val);
			printf(".Lelse%03d:\n", node->val);

			// false
			gen(node->next);
			printf(".LifEnd%03d:\n", node->val);
			push("a5");
			return;
		case ND_AND:
			gen_expr(node->lhs);
			printf("	lw a5,0(sp)\n");
			printf("	beqz a5,.LlogicEnd%03d\n", node->val);
			gen_expr(node->rhs);

			pop("a5");
			pop("a4");
			printf("	and a5,a5,a4\n");
			push("a5");
			printf(".LlogicEnd%03d:\n", node->val);
			return;
		case ND_OR:
			gen_expr(node->lhs);
			printf("	lw a5,0(sp)\n");
			printf("	bnez a5,.LlogicEnd%03d\n", node->val);
			gen_expr(node->rhs);

			pop("a5");
			pop("a4");
			printf("	or a5,a5,a4\n");
			push("a5");
			printf(".LlogicEnd%03d:\n", node->val);
			return;
		case ND_NOT:
			gen_expr(node->rhs);
			pop("a5");
			gen_calc(node);
			push("a5");
			return;
		case ND_ADDRESS:
			gen_address(node->rhs);// printf("	push rax\n");
			return;
		case ND_DEREF:
			gen(node->rhs);
			if(node->type->ty != ARRAY && node->type->ty != STRUCT){
				printf("	l%c a5,0(a5)\n", reg_size[reg_ty]);
			}
			push("a5");
			return;
		case ND_CALL_FUNC:
			gen_args(node->rhs);

			printf("	call %.*s\n", node->len, node->str);
			push("a0");
			return;
		default:
			// check left hand side
			gen_expr(node->lhs);
			// check right hand side
			gen_expr(node->rhs);

			// pop two value
			pop("a4");
			pop("a5");

			// calculation lhs and rhs
			gen_calc(node);

			// push result
			push("a5");
	}
}

void gen(Node *node){
	Node *cases;

	// generate assembly
	switch(node->kind){
		case ND_NULL_STMT:
			// NULL statement
			return;
		case ND_IF:
			gen(node->lhs);
			printf("	li a4,1\n");
			printf("	bne a5,a4,.LifEnd%03d\n", node->val);
			gen(node->rhs);

			printf(".LifEnd%03d:\n", node->val);
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
			printf("	li a4,1\n");
			printf("	bne a5,a4,.Lelse%03d\n", node->val);

			// expr in if
			gen(node->rhs->lhs);
			printf("	j .LifEnd%03d\n", node->val);
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

				printf("	li a4,1\n");
				printf("	beq a5,a4,.LcaseBegin%03d\n", cases->val);
				cases = cases->next;
			}

			// gen default condtion
			if(node->lhs){
				printf("	j .LcaseBegin%03d\n", node->lhs->val);
			}
			printf("	j .LloopEnd%03d\n", node->val);

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
				printf("	li a4,1\n");
				printf("	bne a5,a4,.LloopEnd%03d\n", node->val);
			}

			// gen block
			gen(node->rhs);

			// gen update expression
			printf(".LloopCont%03d:\n", node->val);
			gen(node->lhs->next->next);

			// continue
			printf("	j .LloopBegin%03d\n", node->val);
			printf(".LloopEnd%03d:\n", node->val);
			return;
		case ND_WHILE:
			// condition
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->lhs);
			printf("	li a4,1\n");
			printf("	bne a5,a4,.LloopEnd%03d\n", node->val);

			// else expression
			gen(node->rhs);

			// continue
			printf(".LloopCont%03d:\n", node->val);
			printf("	j .LloopBegin%03d\n", node->val);
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
			printf("	j .LloopCont%03d\n", node->val);
			return;
		case ND_BREAK:
			printf("	j .LloopEnd%03d\n", node->val);
			return;
		case ND_CASE:
			printf(".LcaseBegin%03d:\n", node->val);
			gen(node->rhs);
			return;
		case ND_ARG:
			while(node){
				// push register argument saved
				push(reg[node->val]);
				gen_lvar(node->rhs);
				pop("a5");
				pop("a4");
				printf("	sw a4,0(a5)\n");
				node=node->next;
			}
			return;
		case ND_BLOCK:
			expand_block_code(node->rhs);
			return;
		case ND_RETURN:
			if(node->rhs){
				gen(node->rhs);
			}

			printf("	mv a0,a5\n");
			printf("	lw ra,%d(sp)\n", aligned_stack_size - 4);
			printf("	lw s0,%d(sp)\n", aligned_stack_size - 8);
			printf("	addi sp,sp,%d\n", aligned_stack_size);
			printf("	jr ra\n\n");
			return;
		default:
			gen_expr(node);
			pop("a5");
			return;
	}
}

void gen_main(void){
	int i;
	int j;


	//printf("// risc-v\n");
	printf(".option nopic\n");

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

		aligned_stack_size = 16 + ((func_list[i]->stack_size + 11) / 16 * 16);
		printf(".globl %s\n", func_list[i]->name);
		printf("%s:\n", func_list[i]->name);
		printf("	addi sp,sp,-%d\n", aligned_stack_size);
		printf("	sw ra,%d(sp)\n", aligned_stack_size - 4);
		printf("	sw s0,%d(sp)\n", aligned_stack_size - 8);
		printf("	addi s0,sp,%d\n\n", aligned_stack_size);

		if(func_list[i]->args){
			// set local variable
			gen(func_list[i]->args);
		}

		for(j = 0;func_list[i]->code[j] != NULL;j++){
			// gen code
			gen(func_list[i]->code[j]);
			printf("\n");
		}

		// epiroge
		printf("	mv a0,a5\n");
		printf("	lw ra,%d(sp)\n", aligned_stack_size - 4);
		printf("	lw s0,%d(sp)\n", aligned_stack_size - 8);
		printf("	addi sp,sp,%d\n", aligned_stack_size);
		printf("	jr ra\n\n");
	}
}
