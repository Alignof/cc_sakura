typedef enum{
	TK_TYPE,
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_IF,
	TK_ELSE,
	TK_SWITCH,
	TK_CASE,
	TK_DEFAULT,
	TK_DO,
	TK_WHILE,
	TK_FOR,
	TK_SIZEOF,
	TK_BLOCK,
	TK_STR,
	TK_BREAK,
	TK_CONTINUE,
	TK_TYPEDEF,
	TK_EXTERN,
	TK_RETURN,
	TK_THREAD_LOCAL,
	TK_COMPILER_DIRECTIVE,
	TK_EOF,
}TokenKind;

typedef enum{
	// lhs <-- symbol --> rhs
	ND_ADD, 	//  +
	ND_SUB, 	//  -
	ND_MUL, 	//  *
	ND_DIV, 	//  /
	ND_MOD, 	//  %
	ND_GT, 		//  >
	ND_GE, 		//  >=
	ND_LT, 		//  <
	ND_LE, 		//  <=
	ND_EQ, 		//  ==
	ND_NE, 		//  !=
	ND_AND, 	//  &&
	ND_OR, 		//  ||
	ND_ASSIGN, 	//  =
	ND_COMPOUND, 	//  +=, -=, *=, /=

	// symbol --> rhs
	ND_POSTID, 	//  a++, a--
	ND_DOT,		//  struc.member
	ND_ARROW,	//  struc_ptr->member

	// lhs <-- symbol
	ND_PREID, 	//  ++a, --a
	ND_NOT, 	//  !a
	ND_ADDRESS, 	//  &a
	ND_DEREF, 	//  *a

	// other
	ND_LVAR, 	//  local variable
	ND_GVAR, 	//  global variable
	ND_LARRAY, 	//  local array
	ND_GARRAY, 	//  global array
	ND_STR, 	//  "string"
	ND_NUM, 	//  integer
	ND_CALL_FUNC, 	//  func();
	ND_CASE, 	//  case or default(has code after label)
	ND_TERNARY,	//  cond ? if_true : if_false
	ND_BLOCK, 	//  {}

	// statement(does not push value to stack)
	ND_NULL_STMT, 	//  NULL statement (;) 
	ND_IF, 		//  if
	ND_ELSE, 	//  else
	ND_IFELSE, 	//  if-else
	ND_SWITCH, 	//  switch
	ND_FOR, 	//  for
	ND_WHILE, 	//  while
	ND_DOWHILE, 	//  do-while
	ND_BREAK, 	//  break
	ND_CONTINUE, 	//  continue
	ND_RETURN, 	//  return

	//virtual type
	ND_ARG, 	//  function argument;
	ND_TYPE, 	//  int, double, char...
}NodeKind;

typedef enum{
	VOID,
	BOOL,
	CHAR,
	INT,
	PTR,
	ARRAY,
	STRUCT,
	ENUM,
}TypeKind;

typedef enum{
	PRE_INC,
	PRE_DEC,
	POST_INC,
	POST_DEC,
}IncDecKind;

typedef enum{
	LB_LABEL,
	LB_CASE,
	LB_DEFAULT,
}LabelKind;

typedef struct Token  Token;
typedef struct Node   Node;
typedef struct LVar   LVar;
typedef struct GVar   GVar;
typedef struct Struc  Struc;
typedef struct Enum   Enum;
typedef struct Member Member;
typedef struct Func   Func;
typedef struct Label  Label;
typedef struct Str    Str;
typedef struct Type   Type;
typedef struct Def_Type Def_Type;

// code token
struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

// type of variable
struct Type{
	TypeKind ty;
	Type	 *ptr_to;
	int	 size;
	int	 align;
	int      index_size;
	int      is_extern;
	int      is_thread_local;
	int      len;
	char     *name;
};

// defined type
struct Def_Type{
	char     *name;
	int      name_len;
	char     *tag;
	int      tag_len;
	Type     *type;
	Def_Type *next;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *next;
	Node *block_code;
	Type *type;
	int  val;
	char *str;
	int  offset;
};

// function
struct Func{
	//int argc;
	int  stack_size;
	char *name;
	Type *type;
	Node *args;
	Node *code[300];
	Func *next;
};

// string
struct Str{
	int len;
	int label_num;
	char *str;
	Str *next;
};

// global variable
struct GVar{
	int len;
	int memsize;
	char *name;
	Type *type;
	GVar *next;
	Node *init;
};

// local variable
struct LVar{
	int len;
	int offset;
	char *name;
	Type *type;
	LVar *next;
}; 

// Labels
struct Label{
	int       id;
	Node      *cond;
	Label     *next;
	LabelKind kind;
}; 

// struct
struct Struc{
	int    len;
	int    memsize;
	char   *name;
	Member *member;
	Struc  *next;
};

// enum
struct Enum{
	int    len;
	char   *name;
	Member *member;
	Enum   *next;
};

// (struct|enum) member
struct Member{
	int    len;
	int    offset;
	int    memsize;
	char   *name;
	Type   *type;
	Member *next;
};



//================= global variable ===================
extern int      llid;
extern int      lvar_count;
extern int      alloc_size;
extern char     *user_input;
extern char     filename[100];
extern Token    *token;
extern Func     *func_list[300];
extern LVar     *locals;
extern GVar     *globals;
extern Str      *strings;
extern Struc    *structs;
extern Enum     *enumerations;
extern Def_Type *defined_types;
extern Label    *labels_head;
extern Label    *labels_tail;
extern LVar     *outside_lvar;
extern Struc    *outside_struct;
extern Enum     *outside_enum;
extern Def_Type *outside_deftype;
extern int label_num;
extern int label_loop_end;
//=====================================================


//================standard library=====================
typedef struct _IO_FILE FILE;
typedef void   _IO_lock_t;
typedef void*  __off_t;

struct _IO_FILE{
	int _flags;           /* High-order word is _IO_MAGIC; rest is flags. */

	/* The following pointers correspond to the C++ streambuf protocol. */
	char *_IO_read_ptr;   /* Current read pointer */
	char *_IO_read_end;   /* End of get area. */
	char *_IO_read_base;  /* Start of putback+get area. */
	char *_IO_write_base; /* Start of put area. */
	char *_IO_write_ptr;  /* Current put pointer. */
	char *_IO_write_end;  /* End of put area. */
	char *_IO_buf_base;   /* Start of reserve area. */
	char *_IO_buf_end;    /* End of reserve area. */

	/* The following fields are used to support backing up and undo. */
	char *_IO_save_base; /* Pointer to start of non-current get area. */
	char *_IO_backup_base;  /* Pointer to first valid character of backup area */
	char *_IO_save_end; /* Pointer to end of non-current get area. */

	struct _IO_marker *_markers;

	struct _IO_FILE *_chain;

	int _fileno;
	int _flags2;

	__off_t _old_offset; /* This used to be _offset but it's too small.  */

	/* 1+column number of pbase(); 0 is unknown. */
	//unsigned short _cur_column;
	//signed char _vtable_offset;
	int  _cur_column;
	char _vtable_offset;
	char _shortbuf[1];

	_IO_lock_t *_lock;
};

typedef _Bool bool;
bool true  = 1;
bool false = 0;
//=========================================================



//================temporary definition=====================
typedef void* size_t;

int  SEEK_SET = 0;
int  SEEK_END = 2;
int  FUNC_NUM = 300;

extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */

extern _Thread_local int errno;
//=========================================================





void expand_next(Node *node){
	while(node){
		gen(node);
		node=node->next;
	}
	printf("	push rax\n");
}

void expand_block_code(Node *node){
	while(node){
		gen(node);
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
	//const char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};
	char *reg[6];
	reg[0] = "rdi";
	reg[1] = "rsi";
	reg[2] = "rdx";
	reg[3] = "rcx";
	reg[4] = "r8";
	reg[5] = "r9";



	while(args){
		gen_expr(args);
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
	/**/ if(node->kind == ND_DEREF)   gen_expr(node->rhs);
	else if(node->kind == ND_DOT)     gen_struc(node);
	else if(node->kind == ND_ARROW)   gen_struc(node);
	else if(node->kind == ND_GVAR)    gen_gvar(node);
	else if(node->kind == ND_GARRAY)  gen_gvar(node);
	else if(node->kind == ND_LVAR)    gen_lvar(node);
	else if(node->kind == ND_LARRAY)  gen_lvar(node);
	else error_at(token->str, "can not assign");
}

void gen_calc(Node *node){
	//                          void _Bool  char  int   ptr  array
	//const char reg_ax[6][4]={"eax","eax","eax","eax","rax","rax"};
	//const char reg_dx[6][4]={"edx","edx","edx","edx","rdx","rdx"};
	//const char reg_di[6][4]={"edi","edi","edi","edi","rdi","rdi"};

	int reg_ty = (node->type->ty == ENUM) ? 1 : node->type->ty;
	char *reg_ax[6];
	char *reg_dx[6];
	char *reg_di[6];

	reg_ax[0] = "eax";
	reg_ax[1] = "eax";
	reg_ax[2] = "eax";
	reg_ax[3] = "eax";
	reg_ax[4] = "rax";
	reg_ax[5] = "rax";

	reg_dx[0] = "edx";
	reg_dx[1] = "edx";
	reg_dx[2] = "edx";
	reg_dx[3] = "edx";
	reg_dx[4] = "rdx";
	reg_dx[5] = "rdx";

	reg_di[0] = "edi";
	reg_di[1] = "edi";
	reg_di[2] = "edi";
	reg_di[3] = "edi";
	reg_di[4] = "rdi";
	reg_di[5] = "rdi";

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
			return;
		case ND_GARRAY:
			gen_gvar(node);
			return;
		case ND_LARRAY:
			gen_lvar(node);
			return;
		case ND_PREID:
			// ++p -> p += 1
			gen(node->lhs);
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

			// already evacuation
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
			gen(node->rhs);
			printf("	jmp .LifEnd%03d\n", node->val);
			printf(".Lelse%03d:\n", node->val);

			// false
			gen(node->next);
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
			gen_address(node->rhs);// printf("	push rax\n");
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
	char *reg[6];
	reg[0] = "rdi";
	reg[1] = "rsi";
	reg[2] = "rdx";
	reg[3] = "rcx";
	reg[4] = "r8";
	reg[5] = "r9";

	// generate assembly
	switch(node->kind){
		case ND_NULL_STMT:
			// NULL statement
			return;
		case ND_IF:
			gen(node->lhs);
			printf("	cmp rax,0\n");
			printf("	je .LifEnd%03d\n", node->val);
			gen(node->rhs);

			printf(".LifEnd%03d:\n", node->val);
			return;
		case ND_IFELSE:
			// condition
			gen(node->lhs);
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
		case ND_FOR:
			// init
			gen(node->lhs);

			// condition
			printf(".LloopBegin%03d:\n", node->val);
			gen(node->lhs->next);
			printf("	cmp rax,0\n");
			printf("	je .LloopEnd%03d\n", node->val);

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
			expand_block_code(node->rhs);
			return;
		case ND_CASE:
			printf(".LcaseBegin%03d:\n", node->val);
			gen(node->rhs);
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

