#include "cc_sakura.h"

//int label_if;
//int label_loop;
//int label_if_num;
//int label_loop_num;

void expand_next(Node *node){
	while(node){
		gen(node);
		printf("	pop rax\n");
		node=node->next;
	}
	printf("	push rax\n");
}

void expand_block_code(Node *node){
	while(node){
		gen(node);
		printf("	pop rax\n");
		node=node->block_code;
	}
	printf("	push rax\n");
}


void gen_gvar(Node *node){
	printf("	lea rax,  _%.*s[rip]\n", node->val, node->str);
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

void gen_arg(int arg_num, Node *tmp){
	const char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};

	gen(tmp);
	printf("	pop rax\n");
	printf("	mov %s,rax\n", reg[arg_num]);
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
	}
}

void gen(Node *node){
	Node *args;
	Node *cases;
	int  arg_num    = 0;
	int  label_if   = label_if_num;
	int  label_loop = label_loop_num;

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
			gen(node->lhs);
			return;
		case ND_POSTID:
			// push
			gen_address(node->lhs); // push lhs
			gen(node->rhs->rhs->rhs);          // push rhs
			
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
				printf("	mov [rax],dil\n");
			}else if(node->lhs->type->ty == INT){
				printf("	mov [rax],edi\n");
			}else{
				printf("	mov [rax],rdi\n");
			}

			return;
		case ND_STR:
			printf("	lea rax, .LC%d[rip]\n", node->val);
			printf("	push rax\n");
			return;
		case ND_ASSIGN:
			gen_address(node->lhs);
			gen(node->rhs);

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
			gen(node->rhs->rhs);  // push rhs

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
			label_if_num++;

			// condition
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n", label_if);

			// true
			gen(node->rhs);
			printf("	jmp .LifEnd%03d\n", label_if);
			printf(".Lelse%03d:\n", label_if);

			// false
			gen(node->next);
			printf(".LifEnd%03d:\n", label_if);

			return;
		case ND_IF:
			label_if_num++;

			printf("	push rax\n");
			gen(node->lhs);

			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .LifEnd%03d\n", label_if);
			printf("	pop rax\n");
			gen(node->rhs);

			printf(".LifEnd%03d:\n", label_if);
			return;
		case ND_IFELSE:
			label_if_num++;

			// condition
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	je .Lelse%03d\n", label_if);

			// expr in if
			gen(node->rhs->lhs);
			printf("	jmp .LifEnd%03d\n", label_if);
			printf(".Lelse%03d:\n", label_if);

			// expr in else
			gen(node->rhs->rhs);
			printf(".LifEnd%03d:\n", label_if);

			return;
		case ND_SWITCH:
			label_if_num++;
			label_loop_num++;

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

			printf(".LloopEnd%03d:\n", label_loop);
			printf("	push rax\n");
			return;
		case ND_CASE:
			printf(".LcaseBegin%03d:\n", node->val);
			gen(node->rhs);
			return;
		case ND_FOR:
			// adjust rsp
			printf("	push rax\n");

			// init
			gen(node->lhs);


			label_loop_num++;

			// condition
			printf(".LloopBegin%03d:\n", label_loop);
			gen(node->lhs->next);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			// if cond true then jump to  loop end.
			printf("	je .LloopEnd%03d\n", label_loop);

			// gen block
			gen(node->rhs);

			// gen update expression
			printf(".LloopCont%03d:\n", label_loop);
			gen(node->lhs->next->next);
			printf("	pop rax\n");

			// continue
			printf("	jmp .LloopBegin%03d\n", label_loop);
			printf(".LloopEnd%03d:\n", label_loop);
			printf("	push rax\n");

			return;
		case ND_WHILE:
			label_loop = label_loop_num++;

			// adjust rsp
			printf("	push rax\n");

			// condition
			printf(".LloopBegin%03d:\n", label_loop);
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			// if cond true then loop end.
			printf("	je .LloopEnd%03d\n", label_loop);

			// else expression
			gen(node->rhs);

			// continue
			printf(".LloopCont%03d:\n", label_loop);
			printf("	jmp .LloopBegin%03d\n", label_loop);
			printf(".LloopEnd%03d:\n", label_loop);
			printf("	push rax\n");

			return;
		case ND_DOWHILE:
			label_loop_num++;

			// adjust rsp
			printf("	push rax\n");

			// codeblock
			printf(".LloopBegin%03d:\n", label_loop);
			gen(node->rhs);

			// condition
			gen(node->lhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			// break loop
			printf("	je .LloopEnd%03d\n", label_loop);

			// continue
			printf(".LloopCont%03d:\n", label_loop);
			printf("	jmp .LloopBegin%03d\n", label_loop);
			printf(".LloopEnd%03d:\n", label_loop);
			printf("	push rax\n");

			return;
		case ND_CONTINUE:
			printf("	jmp .LloopCont%03d\n", label_loop-1);
			return;
		case ND_BREAK:
			printf("	jmp .LloopEnd%03d\n", label_loop-1);
			return;
		case ND_BLOCK:
			expand_block_code(node->block_code);
			return;
		case ND_CALL_FUNC:
			args    = node->next;
			arg_num = 0;

			while(args){
				gen_arg(arg_num, args);
				arg_num++;
				args=args->next;
			}

			printf("	push rbp\n");
			printf("	mov rbp,rsp\n");
			printf("	and rsp,-16\n");

			printf("	call %.*s\n", node->val, node->str);

			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n");

			printf("	push rax\n");
			return;
		case ND_ARG:
			args = node;
			while(args){
				// generate arg as lvar
				gen(args->next);
				printf("	pop rax\n");
				gen_lvar(args->next);
				printf("	pop rax\n");
				printf("	pop rdi\n");
				printf("	mov [rax],rdi\n");
				printf("	push rdi\n");
				args=args->rhs;
				// pop stack top
				printf("	pop rax\n");
			}

			return;
		case ND_NOT:
			gen(node->rhs);
			printf("	pop rax\n");
			printf("	cmp rax,0\n");
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			printf("	push rax\n");
			return;
		case ND_ADDRESS:
			gen_address(node->rhs);
			return;
		case ND_DEREF:
			gen(node->rhs);
			printf("	pop rax\n");
			if(node->type->ty <= CHAR){
				printf("	movzx eax,BYTE PTR [rax]\n");
				printf("	movsx eax,al\n");
			}else{
				printf("	mov rax,[rax]\n");
			}
			printf("	push rax\n");

			return;
		case ND_RETURN:
			if(node->rhs){
				gen(node->rhs);
			}
			printf("	pop rax\n");
			printf("	mov rsp,rbp\n");
			printf("	pop rbp\n");
			printf("	ret\n");
			return;
	}


	// check left hand side
	gen(node->lhs);
	// check right hand side
	gen(node->rhs);

	// pop two value
	printf("	pop rdi\n");
	printf("	pop rax\n");
	// calculation lhs and rhs
	gen_calc(node);
	// push result
	printf("	push rax\n");
}

