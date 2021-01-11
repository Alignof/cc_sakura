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
	TK_ALIGNOF,
	TK_BLOCK,
	TK_STR,
	TK_BREAK,
	TK_CONTINUE,
	TK_TYPEDEF,
	TK_RETURN,
	TK_CONST,
	TK_EXTERN,
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
	ND_AND, 	//  &&
	ND_OR, 		//  ||
	ND_BIT_AND, 	//  &
	ND_BIT_OR, 	//  |
	ND_ASSIGN, 	//  =
	ND_COMPOUND, 	//  +=, -=, *=, /=
	ND_GT, 		//  >
	ND_GE, 		//  >=
	ND_LT, 		//  <
	ND_LE, 		//  <=
	ND_EQ, 		//  ==
	ND_NE, 		//  !=

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
	ND_CAST,	//  (type) variable;
	ND_LVAR, 	//  local variable
	ND_GVAR, 	//  global variable
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
	ENUM,
	SIZE_T,
	PTR,
	ARRAY,
	STRUCT,
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
	int      is_const;
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
        int  len;
	int  val;
	char *str;
	int  offset;
};

// function
struct Func{
	int len;
	int stack_size;
	char *name;
	Type *type;
	Node *args;
	Node *code[1000];
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
extern int      alloc_size;
extern int      IGNORE_SCOPE;
extern int      CONSIDER_SCOPE;
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
extern int      label_num;
extern int      label_loop_end;
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
int  SEEK_SET = 0;
int  SEEK_END = 2;
int  FUNC_NUM = 300;

extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */

extern _Thread_local int errno;
//=========================================================


//==================Prototype function=====================
// main.c
char *read_file(char *path);
void get_code(int argc, char **argv);
void set_gvar(GVar *gvar);
void gen_gvar_label(GVar *gvar, Node *init);

// tokenizer.c
int  len_val(char *str);
bool is_ascii(char c);
bool is_alnum(char c);
bool is_space(char c);
bool is_digit(char c);
bool is_block(char c);
bool is_symbol(char *str,  bool *single_flag);
bool at_eof(void);
bool tokenize_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind);
Token *new_token(TokenKind kind, Token *cur, char *str);
Token *tokenize(char *p);


// parse_sys.c
void error_at(char *loc, char *msg);
void expect(char *op);
void label_register(Node *node, LabelKind kind);
bool check(char *op);
bool consume(char *op);
bool consume_ret(void);
bool consume_reserved_word(char *keyword, TokenKind kind);
int expect_number(void);
int string_len(void);
Token *consume_ident(void);
Token *consume_string(void);
Node *new_node_num(int val);
Node *new_node(NodeKind kind, Node *lhs, Node *rhs);
Func *find_func(Token *tok);
GVar *find_gvar(Token *tok);
LVar *find_lvar(Token *tok, int find_range);
Str  *find_string(Token *tok);
Struc *find_struc(Token *tok, int find_range);
Enum *find_enum(Token *tok, int find_range);
Member *find_enumerator(Token *tok, int find_range);
Member *find_struct_member(Type *type, int find_range);
Def_Type *find_defined_type(Token *tok, int find_range);

// parse_util.c
int type_size(Type *type);
int type_align(Type *type);
Node *pointer_calc(Node *node, Type *lhs_type, Type *rhs_type);
Type *get_pointer_type(Type *given);

// syntax_tree.c
void program(void);
void function(Func *func);
Node *stmt(void);
Node *expr(void);
Node *assign(void);
Node *relational(void);
Node *logical(void);
Node *ternary(void);
Node *equelity(void);
Node *add(void);
Node *mul(void);
Node *unary(void);
Node *primary(void);
Node *data(void);

// parse_part.c
void get_argument(Func *target_func);
Node *compiler_directive();
Node *compound_assign(TypeKind type, Node *dst, Node *src);
Node *dot_arrow(NodeKind type, Node *node);
Node *init_formula(Node *node);
Node *global_init(Node *node);
Node *incdec(Node *node, IncDecKind idtype);
Node *array_block(Node *arr);
Node *array_str(Node *arr);
Node *call_function(Node *node, Token *tok);
Node *array_index(Node *node, Node *index);

// declare.c
Type *set_type(Type *type, Token *tok);
Type *parse_type(void);
Type *insert_ptr_type(Type *prev, int star_count);
Node *declare_global_variable(int star_count, Token* def_name, Type *toplv_type);
Node *declare_local_variable(Node *node, Token *tok, int star_count);
void declare_struct(Struc *new_struc);
void declare_enum(Enum *new_enum);
Member *register_struc_member(int *asize_ptr);
Member *register_enum_member(void);

// codegen.c
void gen(Node *node);
void gen_expr(Node *node);
void gen_args(Node *args);
void gen_calc(Node *node);
void gen_lvar(Node *node);
void gen_gvar(Node *node);
void gen_struc(Node *node);
void gen_address(Node *node);
void expand_next(Node *node);
void expand_block_code(Node *node);


//=========================================================



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
	printf("	push rax\n");
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
		case ND_BLOCK:
			expand_block_code(node->rhs);
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
LVar     *locals;
GVar     *globals;
Struc    *structs;
Enum     *enumerations;
Def_Type *defined_types;
LVar     *outside_lvar;
Struc    *outside_struct;
Enum     *outside_enum;
Def_Type *outside_deftype;

Type *set_type(Type *type, Token *tok){
	Enum  *enum_found  = __NULL;
	Struc *struc_found = __NULL;

	switch(type->ty){
		case VOID:
		case BOOL:
		case CHAR:
		case INT:
		case SIZE_T:
		case PTR:
		case ARRAY:
			break;
		case STRUCT:
			// find with tag name
			struc_found = find_struc(tok, IGNORE_SCOPE);
			type->len   = tok->len;
			type->name  = tok->str;
			if(struc_found){
				type->ty   = STRUCT;
				type->size = struc_found->memsize;
				// unname enum
				if(struc_found->member == __NULL && consume("{")){
					struc_found->member = register_struc_member(&(struc_found->memsize));
				}
			}else{
				Struc *new_struc = calloc(1,sizeof(Struc));
				new_struc->len   = tok->len;
				new_struc->name  = tok->str;
				// normal declare
				if(consume("{")){
					declare_struct(new_struc);
					type->ty        = STRUCT;
					type->size      = structs->memsize;
				// in typedef
				}else{
					type->ty        = STRUCT;
					new_struc->next = structs;
					structs         = new_struc;
				}
			}

			break;
		case ENUM:
			if(tok){
				enum_found = find_enum(tok, IGNORE_SCOPE);
			}

			if(enum_found){
				type->ty = ENUM;
				if(enum_found->member == __NULL && consume("{")){
					enum_found->member = register_enum_member();
				}
			}else{
				Enum *new_enum = calloc(1,sizeof(Struc));
				if(tok){
					new_enum->len   = tok->len;
					new_enum->name  = tok->str;
				}
				if(consume("{")){
					if(enum_found) error_at(token->str, "multiple definition");
					declare_enum(new_enum);
					type->ty        = ENUM;
				}else{
					new_enum->next  = enumerations;
					enumerations    = new_enum;
					type->ty        = ENUM;
				}
			}
			break;
	}

	return type;
}

Type *parse_type(void){
	Type *type = calloc(1, sizeof(Type));
	int is_const   = 0;
	int star_count = 0;

	// const
	if(consume_reserved_word("const", TK_CONST)){
		is_const = 1;
	}

	// check type
	if(consume_reserved_word("void", TK_TYPE)){
		type->ty = VOID;
		type = set_type(type, __NULL);
	}else if(consume_reserved_word("_Bool", TK_TYPE)){
		type->ty = BOOL;
		type = set_type(type, __NULL);
	}else if(consume_reserved_word("char", TK_TYPE)){
		type->ty = CHAR;
		type = set_type(type, __NULL);
	}else if(consume_reserved_word("int", TK_TYPE)){
		type->ty = INT;
		type = set_type(type, __NULL);
	}else if(consume_reserved_word("size_t", TK_TYPE)){
		type->ty = SIZE_T;
		type = set_type(type, __NULL);
	}else if(consume_reserved_word("struct", TK_TYPE)){
		type->ty = STRUCT;
		type = set_type(type, consume_ident());
	}else if(consume_reserved_word("enum", TK_TYPE)){
		type->ty = ENUM;
		type = set_type(type, consume_ident());
	}else{
		Token *tok = consume_ident();
		Def_Type *def_found = find_defined_type(tok, IGNORE_SCOPE);
		if(def_found){
			tok->str = def_found->tag;
			tok->len = def_found->tag_len;
			type     = set_type(def_found->type, tok);
		}else{
			error_at(tok->str, "unknown type.");
		}
	}

	type->size  = type_size(type);
	type->align = type_align(type);

	// count asterisk
	while(token->kind == TK_RESERVED && *(token->str) == '*'){
		star_count++;
		token = token->next;
	}

	// add ptr
	type = insert_ptr_type(type, star_count);
	type->is_const = is_const;

	return type;
}

Type *insert_ptr_type(Type *prev, int star_count){
	Type *newtype;
	if(star_count == 0) return prev;

	for(int i = 0;i<star_count;i++){
		newtype = calloc(1, sizeof(Type));
		newtype->ty     = PTR;
		newtype->size   = type_size(newtype);
		newtype->align  = type_align(newtype);
		newtype->ptr_to = prev;
		newtype->is_extern       = prev->is_extern;
		newtype->is_thread_local = prev->is_thread_local;
		prev = newtype;
	}

	return newtype;
}

Node *declare_global_variable(int star_count, Token* def_name, Type *toplv_type){
	// if not token -> error
	if(!def_name) error_at(token->str, "not a variable.");

	int index_num;
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_GVAR;

	GVar *gvar = calloc(1, sizeof(GVar));
	gvar->next = globals;
	gvar->len  = def_name->len;
	gvar->name = def_name->str;
	toplv_type->size  = type_size(toplv_type);
	toplv_type->align = type_align(toplv_type);

	// add type list
	gvar->type = insert_ptr_type(gvar->type, star_count);

	// Is array
	if(check("[")){
		node->val     = -1;
		Type *newtype = calloc(1, sizeof(Type));
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				index_num = token->val;
				token = token->next;
			}

			newtype->ptr_to = calloc(1, sizeof(Type));
			newtype->ptr_to->ty              = ARRAY;
			newtype->ptr_to->index_size      = index_num;
			newtype->ptr_to->is_extern       = toplv_type->is_extern;
			newtype->ptr_to->is_thread_local = toplv_type->is_thread_local;
			newtype = newtype->ptr_to;

			if(gvar->type == __NULL){
				gvar->type = newtype;
				gvar->type->is_const = toplv_type->is_const;
				toplv_type->is_const = 0;
			}
			expect("]");
		}
		newtype->ptr_to = toplv_type;
	}else{
		gvar->type      = toplv_type;
	}

	gvar->type->size = type_size(gvar->type);
	gvar->memsize    = gvar->type->size;

	// globals == new gvar
	globals = gvar;
	node->type = gvar->type;
	node->str  = gvar->name;
	node->val  = gvar->len;

	return node;
}

Node *declare_local_variable(Node *node, Token *tok, int star_count){
	LVar *lvar = find_lvar(tok, CONSIDER_SCOPE);
	if(lvar) error_at(token->str, "this variable has already existed.");

	lvar = calloc(1, sizeof(LVar));
	lvar->next = locals;
	lvar->name = tok->str;
	lvar->len  = tok->len;

	// Is array
	if(check("[")){
		Type *newtype = calloc(1, sizeof(Type));
		int index_num;
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				index_num = token->val;
				token     = token->next;
			}

			newtype->ptr_to = calloc(1, sizeof(Type));
			newtype->ptr_to->ty         = ARRAY;
			newtype->ptr_to->index_size = index_num;
			newtype = newtype->ptr_to;

			if(lvar->type == __NULL){
				lvar->type = newtype;
				lvar->type->is_const = node->type->is_const;
				node->type->is_const = 0;
			}
			expect("]");
		}
		newtype->ptr_to = node->type;
	}else{
		lvar->type      = node->type;
	}

	lvar->type->size  = type_size(lvar->type);
	lvar->type->align = type_align(lvar->type);
	lvar->offset      = ((locals) ? (locals->offset) : 0) + lvar->type->size;

	node->type   = lvar->type;
	node->offset = lvar->offset;
	alloc_size   += lvar->type->size;
	locals = lvar;

	return node;
}

Member *register_struc_member(int *asize_ptr){
	int size_of_type;
	Member *new_memb  = __NULL;
	Member *memb_head = __NULL;

	while(1){
		if(!(token->kind == TK_TYPE || find_defined_type(token, IGNORE_SCOPE))){
			error_at(token->str, "not a type.");
		}

		new_memb = calloc(1,sizeof(Member));

		// parse member type
		Type *memb_type  = parse_type();

		// add member name
		Token *def_name  = consume_ident();
		new_memb->name   = def_name->str;
		new_memb->len    = def_name->len;

		// Is array
		if(check("[")){
			int index_num;
			Type *newtype = calloc(1, sizeof(Type));
			while(consume("[")){
				index_num = -1;
				if(!check("]")){
					index_num = token->val;
					token     = token->next;
				}

				newtype->ptr_to = calloc(1, sizeof(Type));
				newtype->ptr_to->ty         = ARRAY;
				newtype->ptr_to->index_size = index_num;
				newtype = newtype->ptr_to;

				if(new_memb->type == __NULL){
					new_memb->type = newtype;
					new_memb->type->is_const = memb_type->is_const;
					memb_type->is_const = 0;
				}
				expect("]");
			}
			newtype->ptr_to = memb_type;
		}else{
			new_memb->type  = memb_type;
		}
		new_memb->type->size  = type_size(new_memb->type);
		new_memb->type->align = type_align(new_memb->type);

		int padding = 0;
		new_memb->memsize = new_memb->type->size;
		size_of_type      = new_memb->memsize;

		if(memb_head){
			int prev_tail    = (memb_head) ? (memb_head->offset + memb_head->type->size) : 0;
			padding          = (prev_tail % new_memb->type->align) ? (new_memb->type->align - (prev_tail % new_memb->type->align)) : 0;
			new_memb->offset = prev_tail + padding;
		}else{
			new_memb->offset = 0;
		}
		(*asize_ptr) += size_of_type + padding;

		new_memb->next = memb_head;
		memb_head      = new_memb;

		expect(";");
		if(consume("}")) break;
	}

	return memb_head;
}

void declare_struct(Struc *new_struc){
	int asize = 0;

	new_struc->member  = register_struc_member(&asize);
	new_struc->memsize = asize;
	new_struc->next    = structs;
	structs = new_struc;
}

Member *register_enum_member(void){
	int counter = 0;
	Member *new_memb  = __NULL;
	Member *memb_head = __NULL;

	while(1){
		new_memb = calloc(1,sizeof(Member));

		if(token->kind != TK_IDENT) error_at(token->str, "expected ‘,’ or ‘}’");
		// add member name
		Token *def_name  = consume_ident();
		new_memb->name   = def_name->str;
		new_memb->len    = def_name->len;

		if(consume("=")){
			if(token->kind != TK_NUM){
				error_at(token->str, "enumerator value is not an integer constant");
			}

			counter	         = token->val;
			new_memb->offset = counter;
			token            = token->next;
		}else{
			new_memb->offset = counter;
			counter++;
		}

		new_memb->next   = memb_head;
		memb_head        = new_memb;

		if(consume(","));
		if(consume("}")) break;
	}

	return memb_head;
}

void declare_enum(Enum *new_enum){
	new_enum->member = register_enum_member();
	new_enum->next   = enumerations;
	enumerations     = new_enum;
}
int   llid;
int   label_num;
int   IGNORE_SCOPE;
int   CONSIDER_SCOPE;
int   label_loop_end;
char  *user_input;
char  filename[100];
Func  *func_list[300];
Label *labels_head;
Label *labels_tail;

char *read_file(char *path){
	FILE *fp;
	char *buf;

	strcpy(filename, path);
	if ((fp = fopen(path, "r")) == __NULL) {
		fprintf(stderr, "File open error.\n");
		exit(1);
	}

	// get file size
	if(fseek(fp, 0, SEEK_END) == -1){
		printf("%s: fseek:%s", path, strerror(errno));
	}

	size_t size = ftell(fp);

	if(fseek(fp, 0, SEEK_SET) == -1){
		printf("%s: fseek:%s", path, strerror(errno));
	}

	buf = calloc(1, size+2);
	fread(buf, size, 1, fp);

	if(size == 0 || buf[size-1] != '\n'){
		buf[size++] = '\n';
	}

	buf[size] = '\0';
	fclose(fp);

	return buf;
}

void get_code(int argc, char **argv){
	if(argc == 2){
		user_input = read_file(argv[1]);
	}else if(argc == 3){
		if(!strcmp(argv[1], "-cl")){
			user_input = argv[2];
			strcpy(filename, "command line");
		}else{
			fprintf(stderr, "Incorrect option\n");
			exit(1);
		}
	}else{
		fprintf(stderr, "Incorrect number of arguments\n");
		exit(1);
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

void set_gvar(GVar *gvar){
	if(gvar->type->is_extern == 1){
		return;
	}

	if(gvar->type->is_thread_local == 1){
		printf(".section .tbss,\"awT\",@nobits\n");
		printf("%.*s:\n	.zero	%d\n", gvar->len, gvar->name, gvar->memsize);
		return;
	}

	printf(".globl %.*s\n", gvar->len, gvar->name);
	printf("%.*s:\n", gvar->len, gvar->name);
	if(gvar->init){
		if(gvar->init->kind == ND_BLOCK){
			Node *init = gvar->init->rhs;
			while(init){
				gen_gvar_label(gvar, init);
				init = init->block_code;
			}
			if(gvar->init->offset) printf("        .zero   %d\n", gvar->init->offset);
		}else{
			gen_gvar_label(gvar, gvar->init);
		}
	}else{
		printf("	.zero	%d\n", gvar->memsize);
	}
}

int main(int argc, char **argv){
	int i;
	int j;
	IGNORE_SCOPE   = 0;
	CONSIDER_SCOPE = 1;

	// get source code
	get_code(argc, argv);

	// tokenize
	token = tokenize(user_input);
	// make syntax tree
	program();

	if(func_list == __NULL){
		fprintf(stderr, "function is not found.");
	}


	// generate code
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
	labels_head    = __NULL;
	labels_tail    = __NULL;

	//generate assembly at first expr
	printf(".text\n");
	for(i = 0;func_list[i];i++){
		if(func_list[i]->code[0] == __NULL) continue;
		printf(".globl %s\n", func_list[i]->name);
		printf("%s:\n", func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n", func_list[i]->stack_size);

		if(func_list[i]->args){
			// set local variable
			gen(func_list[i]->args);
		}

		for(j = 0;func_list[i]->code[j] != __NULL;j++){
			// gen code
			gen(func_list[i]->code[j]);
		}

		// epiroge
		// rax = return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}

Node *global_init(Node *node){
	Node *init_val = __NULL;
	if(check("\"")){
		if(node->type->ty == ARRAY){
			consume("\"");
			Token *tok = consume_string();
			expect("\"");
			init_val   = new_node(ND_STR, __NULL, __NULL);
			init_val->str      = tok->str;
			init_val->len      = tok->len;
			init_val->type->ty = PTR;

			if(node->type->index_size != -1 && init_val->len+1 != node->type->index_size){
				error_at(token->str, "invalid global variable initialize");
			}else if(node->type->index_size != -1 && init_val->len+1 < node->type->index_size){
				init_val->len = node->type->index_size - init_val->len - 1;
			}
		}else{
			init_val = assign();
		}
	}else if(consume("{")){
		int ctr   = 0;
		Node *new = __NULL;
		init_val  = new_node(ND_BLOCK, __NULL, __NULL);
		while(token->kind != TK_BLOCK){
			//Is first?
			if(ctr == 0){
				new = expr();
				init_val->rhs = new;
			}else{
				new->block_code = expr();
				new = new->block_code;
			}

			if(new->kind == ND_STR && node->type->ty == ARRAY){
				if(node->type->index_size != -1 && new->len > node->type->index_size){
					error_at(token->str, "invalid global variable initialize");
				}else if(node->type->ptr_to->index_size != -1 && new->len < node->type->index_size){
					new->offset = node->type->ptr_to->index_size - new->len - 1;
				}
			}
			consume(",");
			ctr++;
		}

		expect("}");

		// too many
		if(node->type->index_size != -1 && node->type->index_size < ctr){
			error_at(token->str, "Invalid array size");
		// too little
		}else if(node->type->index_size > ctr){
			init_val->offset = (node->type->index_size - ctr) * node->type->ptr_to->size;
		}
	}else{
		init_val = assign();
	}

	return init_val;
}

Node *compiler_directive(){
	Node *node;

	if(consume_reserved_word("__NULL", TK_COMPILER_DIRECTIVE)){
		node = new_node_num(0);
		node->type->ty    = PTR;
		node->type->size  = 8;
		node->type->align = 8;

		node->type->ptr_to        = calloc(1, sizeof(Type));
		node->type->ptr_to->ty    = VOID;
		node->type->ptr_to->size  = 1;
		node->type->ptr_to->align = 1;
	}

	return node;
}

Node *compound_assign(TypeKind type, Node *dst, Node *src){
	Node *calc = new_node(type, dst, src);
	Node *new  = new_node(ND_COMPOUND, dst, calc);
	return new;
}

Node *dot_arrow(NodeKind type, Node *node){
	// struc.aaa.bbb.ccc;
	// struc->aaa->bbb->ccc;
	// (lvar <- node -> dot) <- node -> dot
	Type *struc_type;
	Node *new = new_node(type, node, __NULL);
	Token *memb_name  = consume_ident();
	Member *memb_list;

	// get type of struct
	if(node->kind == ND_ADDRESS){
		struc_type = node->rhs->type;
	}else if(node->kind == ND_DEREF){
		struc_type = node->rhs->type->ptr_to;
	}else{
		struc_type = node->type;
	}

	// get member list
	if(type == ND_DOT){
		memb_list = find_struct_member(struc_type, IGNORE_SCOPE);
	}else{
		memb_list = find_struct_member(struc_type->ptr_to, IGNORE_SCOPE);
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, (size_t)memb_name->len)){
			new->rhs  = new_node_num(memb_list->offset);
			new->type = memb_list->type;
			break;
		}
		memb_list = memb_list->next;
	}

	return new;
}

Node *incdec(Node *node, IncDecKind idtype){
	/*
	 * a++;
	 * a <-- (ND_POSTID) --> a = a+1;
	 *
	 * --a;
	 * a = a-1; <-- (ND_PREID) --> a;
	 */

	Node *new      = calloc(1,sizeof(Node));
	Node *plmi_one = calloc(1,sizeof(Node));

	// increment or decrement
	if(idtype == PRE_INC || idtype == POST_INC){
		plmi_one = new_node(ND_COMPOUND, node, new_node(ND_ADD,node,new_node_num(1)));
	}else{
		plmi_one = new_node(ND_COMPOUND, node, new_node(ND_SUB,node,new_node_num(1)));
	}

	// pre
	if(idtype == PRE_INC || idtype == PRE_DEC){
		new->kind = ND_PREID;
		new->lhs  = plmi_one;
		new->rhs  = node;
	// post
	}else{
		new->kind = ND_POSTID;
		new->lhs  = node;
		new->rhs  = plmi_one;
	}

	new->type = node->type;
	return new;
}

Node *init_formula(Node *node){
	int is_const = node->type->is_const;
	node->type->is_const = 0;

	if(consume("{")){
		node = array_block(node);
	}else if(check("\"")){
		node = array_str(node);
	}else{
		node = new_node(ND_ASSIGN, node, assign());
	}

	if(is_const) node->type->is_const = 1;
	return node;
}

Node *array_str(Node *arr){
	int ctr	   = 0;
	int isize  = arr->type->index_size;

	if(arr->type->ty == PTR){
		return new_node(ND_ASSIGN, arr, assign());
	}

	if(arr->type->ty != ARRAY){
		error_at(token->str, "Invalid assign");
	}

	Node *src  = __NULL;
	Node *dst  = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, __NULL, __NULL);

	consume("\"");
	Token *tok = consume_string();
	while(ctr < tok->len){
		src = array_index(arr, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, new_node_num((int)*(tok->str + ctr)));
			node->rhs = dst;
		}else{
			dst->block_code = new_node(ND_ASSIGN, src, new_node_num((int)*(tok->str + ctr)));
			dst = dst->block_code;
		}
		consume(",");
		ctr++;
	}
	expect("\"");

	// '\0'
	dst->block_code = new_node(ND_ASSIGN, array_index(arr, new_node_num(tok->len)), new_node_num('\0'));
	dst = dst->block_code;
	ctr++;

	// ommitted
	if(isize == -1){
		int asize  = arr->type->ptr_to->size * ctr;
		alloc_size += asize;
		arr->offset    = ((locals)?(locals->offset):0) + asize;
		locals->offset = arr->offset;
		locals->type->index_size = ctr;
		locals->type->size  = type_size(locals->type);
		locals->type->align = type_size(locals->type);
	}
	return node;
}

Node *array_block(Node *arr){
	int ctr = 0;
	int isize = arr->type->index_size;
	Node *src;
	Node *dst  = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, __NULL, __NULL);

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(token->kind != TK_BLOCK){
		src = array_index(clone, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, expr());
			node->rhs = dst;
		}else{
			dst->block_code = new_node(ND_ASSIGN, src, expr());
			dst = dst->block_code;
		}
		consume(",");
		ctr++;
	}

	expect("}");

	// ommitted
	if(isize == -1){
		if(arr->type->ty == ARRAY){
			int asize  = arr->type->ptr_to->size * ctr;
			alloc_size += asize;
			arr->offset    = ((locals)?(locals->offset):0) + asize;
			clone->offset  = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
			locals->type->size  = type_size(locals->type);
			locals->type->align = type_size(locals->type);
		}
	// too many
	}else if(arr->type->index_size < ctr){
		error_at(token->str, "Invalid array size");
	// too little
	}else if(arr->type->index_size > ctr){
		while(ctr != arr->type->index_size){
			src = array_index(clone, new_node_num(ctr));
			dst->block_code = new_node(ND_ASSIGN, src, new_node_num(0));
			dst = dst->block_code;

			ctr++;
			consume(",");
		}
	}

	return node;
}

Node *call_function(Node *node, Token *tok){
	expect("(");

	node->kind = ND_CALL_FUNC;
	node->str  = tok->str;
	node->len  = tok->len;

	// have argument?
	if(consume(")")) return node;

	int ctr   = 0;
	Node *new = __NULL;
	while(1){
		if(new == __NULL){
			new        = assign();
			node->rhs  = new;
		}else{
			new->block_code = assign();
			new             = new->block_code;
		}

		ctr++;

		if(!(consume(","))) break;
	}
	expect(")");

	return node;
}

Node *array_index(Node *node, Node *index){
	// a[1] == *(a+1)
	node = new_node(ND_ADD, node, index);
	node = new_node(ND_DEREF, __NULL, node);

	return node;
}

void get_argument(Func *target_func){
	if(consume_reserved_word("void", TK_TYPE) || check(")")){
		target_func->args = __NULL;
		expect(")");
		return;
	}

	// set args node
	Node *new_arg = __NULL;
	int arg_counter = 0;

	while(token->kind == TK_CONST || token->kind == TK_NUM ||
	      token->kind == TK_TYPE  || find_defined_type(token, 0)){
		if(new_arg == __NULL){
			new_arg       = calloc(1, sizeof(Node));
			new_arg->kind = ND_ARG;
			new_arg->val  = arg_counter;
			new_arg->rhs  = expr();
			target_func->args = new_arg;
		}else{
			new_arg->next       = calloc(1, sizeof(Node));
			new_arg->next->kind = ND_ARG;
			new_arg->next->val  = arg_counter;
			new_arg->next->rhs  = expr();
			new_arg             = new_arg->next;
		}

		// Implicit Type Conversion 
		if(new_arg->rhs->type->ty == ARRAY){
			new_arg->rhs->type->ty = PTR;
			new_arg->rhs->offset   -= new_arg->rhs->type->size;
			new_arg->rhs->offset   += 8;
			locals->offset         = new_arg->rhs->offset;
			locals->type->size     = new_arg->rhs->type->size;
			alloc_size -= new_arg->rhs->type->size;
			alloc_size += 8;
		}

		arg_counter++;
		if(!(consume(","))) break;
	}
	expect(")");
}
void error_at(char *loc, char *msg){
	while((user_input < loc) && (loc[-1] == '\n' || loc[-1] == '\t')) loc--;

	char *start = loc;
	while((user_input < start) && (start[-1] != '\n')) start--;

	char *end = loc;
	while(*end != '\n') end++;

	int line_num = 1;
	for(char *c = user_input;c < loc;c++){
		if(*c == '\n') line_num++;
	}

	// consume \t
	while(*start == '\t') start++;

	int indent = fprintf(stderr, "%s:%d ", filename, line_num);
	fprintf(stderr, "%.*s\n", (int)(end-start), start);

	int pos = indent+loc-start;
	fprintf(stderr, "%*s", pos, " ");
	fprintf(stderr, "^ %s\n", msg);
	exit(1);
}

bool check(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		return false;
	}

	return true;
}

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

int string_len(void){
	int len = 0;
	while(token->kind == TK_STR){
		token = token->next;
		len++;
	}

	return len - 1;
}

bool consume_ret(void){
	if((token->kind != TK_RETURN) || (token->len != 6) ||
	    memcmp(token->str, "return", (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

bool consume_reserved_word(char *keyword, TokenKind kind){
	if(token->kind != kind ||
	   token->len  != strlen(keyword) ||
	   memcmp(token->str, keyword, (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

Token *consume_string(void){
	// null string
	if(token->kind == TK_RESERVED && *(token->str) == '"'){
		return calloc(1, sizeof(Token));
	}
	// judge whether token is a ident and token pointer
	if(token->kind != TK_STR || !(is_ascii(*(token->str)))){
		return __NULL;
	}

	Token *ret = token;
	int counter = 0;
	while(token->kind == TK_STR){
		counter++;
		token = token->next;
	}

	ret->len = counter;

	return ret;
}


Token *consume_ident(void){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||!(is_alnum(*(token->str)))){
		return __NULL;
	}

	Token *ret = token;
	//check variable length
	int _len   = len_val(token->str);
	token->len = _len;

	//move for next token 
	for(int i = 0;i < _len;i++){
		token = token->next;
	}

	return ret;
}

void expect(char *op){
	// judge whether op is a symbol and move the pointer to the next
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK)||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		error_at(token->str, "not a charctor.");
	}
	token = token->next;
}

int expect_number(void){
	// judge whether token is a number and move the pointer to the next and return value
	if(token->kind != TK_NUM){
		error_at(token->str, "not a number");
	}

	int val = token->val;
	token   = token->next;
	return val;
}

void label_register(Node *node, LabelKind kind){
	Label *new_label;
	if(labels_tail){
		labels_tail->next = calloc(1, sizeof(Label));
		new_label         = labels_tail->next;
	}else{
		labels_head = calloc(1, sizeof(Label));
		new_label   = labels_head;
	}

	new_label->kind  = kind;
	new_label->id    = llid;
	node->val        = llid;
	labels_tail      = (labels_tail) ? labels_tail->next : labels_head;

	llid++;

	if(kind == LB_CASE){
		new_label->cond = node->lhs;
	}else if(kind == LB_DEFAULT){
		new_label->cond = node->rhs;
	}
}

Func *find_func(Token *tok){
	for (int i = 0;func_list[i] && i < FUNC_NUM;i++){
		if(func_list[i]->len == tok->len && !memcmp(tok->str, func_list[i]->name, (size_t)tok->len)){
			return func_list[i];
		}
	}
	return __NULL;
}

GVar *find_gvar(Token *tok){
	//while var not equal __NULL
	for (GVar *var = globals;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return __NULL;
}

LVar *find_lvar(Token *tok, int find_range){
	/* find_range
	 * IGNORE_SCOPE   == 0
	 * CONSIDER_SCOPE == 1 
	 */

	int out_of_scope = 0;
	//while var not equal __NULL
	for (LVar *var = locals;var;var = var->next){
		if(var == outside_lvar) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return __NULL;
}

Str *find_string(Token *tok){
	for (Str *var = strings;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->str, (size_t)var->len)){
			return var;
		}
	}
	return __NULL;
}

Struc *find_struc(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return __NULL;
}

Member *find_struct_member(Type *type, int find_range){
	int out_of_scope = 0;
	int struc_len    = type->len;
	char *struc_name = type->name;

	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == struc_len && !memcmp(struc_name, var->name, (size_t)var->len)){
			return var->member;
		}
	}
	return __NULL;
}

Enum *find_enum(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Enum *var = enumerations;var;var = var->next){
		if(var == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return __NULL;
}

Member *find_enumerator(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Enum *en = enumerations;en;en = en->next){
		if(en == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		for (Member *var = en->member;var;var = var->next){
			if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
				return var;
			}
		}
	}
	return __NULL;
}

Def_Type *find_defined_type(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Def_Type *var = defined_types;var;var = var->next){
		if(var == outside_deftype) out_of_scope = 1;
		if(out_of_scope) break;
		if(var->name_len == len_val(tok->str) && !memcmp(tok->str, var->name, (size_t)var->name_len)){
			return var;
		}
	}
	return __NULL;
}

Node *new_node(NodeKind kind, Node *lhs, Node *rhs){
	//create new node(symbol)
	Node *node = calloc(1, sizeof(Node));
	node->type = calloc(1, sizeof(Type));
	node->kind = kind;
	node->lhs  = lhs;
	node->rhs  = rhs;

	if(ND_ADD <= kind && kind <= ND_BIT_OR){
		node->type = (lhs->type->ty > rhs->type->ty)? lhs->type : rhs->type;
	}

	if(kind == ND_SUB){
		if((lhs->type->ty == PTR   && rhs->type->ty == PTR)||
		   (lhs->type->ty == ARRAY && rhs->type->ty == ARRAY)){
			node = new_node(ND_DIV, node, new_node_num(node->type->ptr_to->size));
			return node;
		}
	}

	if(kind == ND_ADD || kind == ND_SUB){
		if(lhs->type->ty == PTR || lhs->type->ty == ARRAY ||
		   rhs->type->ty == PTR || rhs->type->ty == ARRAY ){
			node = pointer_calc(node, lhs->type, rhs->type);
		}
	}

	if(kind == ND_ASSIGN){
		if(lhs->type->ty == BOOL){
			node->rhs = new_node(ND_NE, node->rhs, new_node_num(0));
		}

		if(lhs->type->ty == STRUCT){
			error_at(token->str, "struct assignment is not implemented");
		}
	}

	if(kind == ND_ASSIGN || kind == ND_COMPOUND){
		node->type = lhs->type;
		if(lhs->type->ty > rhs->type->ty){
			node->type = lhs->type;
			node->rhs  = new_node(ND_CAST, __NULL, node->rhs);
			node->rhs->type = node->type;
		}
	}

	if(ND_GT <= kind && kind <= ND_NE){
		if(lhs->type->ty > rhs->type->ty){
			node->type = lhs->type;
			node->rhs  = new_node(ND_CAST, __NULL, node->rhs);
			node->rhs->type = lhs->type;
		}else if(lhs->type->ty < rhs->type->ty){
			node->type = rhs->type;
			node->lhs  = new_node(ND_CAST, __NULL, node->lhs);
			node->lhs->type = rhs->type;
		}else{
			node->type = lhs->type;
		}
	}


	if(kind == ND_DOT || kind == ND_ARROW){
		node->type = lhs->type;
	}

	if(kind == ND_DEREF){
		node->type = node->rhs->type->ptr_to;
	}

	if(kind == ND_ADDRESS){
		node->type->ty     = PTR;
		node->type->size   = type_size(node->type);
		node->type->align  = type_align(node->type);
		node->type->ptr_to = rhs->type;
	}

	if(node->type->is_const){
		if(node->kind == ND_ASSIGN || node->kind == ND_COMPOUND ||
		   node->kind == ND_POSTID || node->kind == ND_PREID){
			error_at(token->str, "changed read-only variable");
		}
	}

	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_NUM;
	node->val  = val;
	node->type = calloc(1, sizeof(Type));
	node->type->ty    = INT;
	node->type->size  = type_size(node->type);
	node->type->align = type_align(node->type);
	return node;
}

int type_size(Type *type){
	switch(type->ty){
		case VOID:
			return 1;
		case BOOL:
			return 1;
		case CHAR:
			return 1;
		case INT:
			return 4;
		case SIZE_T:
			return 8;
		case PTR:
			return 8;
		case ARRAY:
			if(type->index_size == -1) break; 
			return type->size = type->index_size * type_size(type->ptr_to);
		case STRUCT:
			return type->size;
		case ENUM:
			return 4;
		default:
			error_at(token->str, "unknown type");
	}

	return 0;
}

int type_align(Type *type){
	int max = 0;
	int align_num;
	Member *memb_list;

	switch(type->ty){
		case VOID:
			return 1;
		case BOOL:
			return 1;
		case CHAR:
			return 1;
		case INT:
			return 4;
		case SIZE_T:
			return 8;
		case PTR:
			return 8;
		case ARRAY:
			return type->align = type_align(type->ptr_to);
		case STRUCT:
			memb_list = find_struct_member(type, IGNORE_SCOPE);
			while(memb_list){
				align_num = type_align(memb_list->type);
				if(max < align_num){
					max = align_num;
				}
				memb_list = memb_list->next;
			}
			return max;
		case ENUM:
			return 4;
		default:
			error_at(token->str, "unknown type");
	}

	return 0;
}


Type *get_pointer_type(Type *given){
	while(given->ptr_to != __NULL) given = given->ptr_to;
	return given;
}

Node *pointer_calc(Node *node, Type *lhs_type, Type *rhs_type){
	Type *ptrtype;

	node->type = (lhs_type->ty > rhs_type->ty)? lhs_type : rhs_type;
	Node *pointer_size = calloc(1, sizeof(Node));
	pointer_size->kind = ND_NUM;
	pointer_size->type = calloc(1, sizeof(Type));
	pointer_size->type->ty    = INT;
	pointer_size->type->size  = type_size(pointer_size->type);
	pointer_size->type->align = type_align(pointer_size->type);


	if(lhs_type->ty >= PTR  &&  lhs_type->ptr_to != __NULL){
		ptrtype = lhs_type->ptr_to;
		pointer_size->val = ptrtype->size;
		node->rhs = new_node(ND_MUL, node->rhs, pointer_size);
	}else if(rhs_type->ty >= PTR  &&  rhs_type->ptr_to != __NULL){
		ptrtype = rhs_type->ptr_to;
		pointer_size->val = ptrtype->size;
		node->lhs = new_node(ND_MUL, node->lhs, pointer_size);
	}

	return node;
}
int alloc_size;
Token *token;
Str *strings;

Node *data(void){
	if(consume("(")){
		Node *node = expr();
		expect(")");
		return node;
	}

	// compiler directive
	if(token->kind == TK_COMPILER_DIRECTIVE){
		return compiler_directive();
	}


	if(consume("\"")){
		Node *node = calloc(1, sizeof(Node));
		node->kind = ND_STR;
		node->type = calloc(1, sizeof(Type));
		node->type->ty = PTR;

		Token *tok = consume_string();
		Str  *fstr = find_string(tok);

		// has already
		if(fstr){
			node->str = fstr->str;
			node->val = fstr->label_num;
			node->len = fstr->len;
		// new one
		}else{
			Str *new = calloc(1, sizeof(Str));
			new->len = tok->len;
			new->str = tok->str;
			new->label_num = strings ? strings->label_num+1 : 0;
			node->str = new->str;
			node->len = new->len;
			node->val = new->label_num;

			if(strings == __NULL){
				strings = new;
			}else{
				new->next = strings;
				strings = new;
			}
		}

		consume("\"");
		return node;
	}

	// variable
	Token *tok = consume_ident();
	if(tok){
		Node *node = calloc(1, sizeof(Node));

		LVar *lvar = find_lvar(tok, IGNORE_SCOPE);
		if(lvar){
			node->kind   = ND_LVAR;
			node->offset = lvar->offset;
			node->type   = lvar->type;
		// call function
		}else if(check("(")){
			Func *called = find_func(tok);
			if(called){
				node->type = called->type;
			}else{
				node->type = calloc(1, sizeof(Type));
				node->type->ty = INT;
			}

			node = call_function(node, tok);
		}else{
			GVar *gvar = find_gvar(tok);
			if(gvar){
				// global variable exist
				node->kind = ND_GVAR;
				node->type = gvar->type;
				node->str  = tok->str;
				node->len  = tok->len;
			}else{
				Member *rator = find_enumerator(tok, IGNORE_SCOPE);
				if(rator){
					node = new_node_num(rator->offset);
					// variable does not exist.
				}else{
					error_at(token->str, "this variable is not declarated");
				}
			}
		}

		return node;
	// return new num node
	}else if(token->kind == TK_NUM){
		return new_node_num(expect_number());
	}


	// __NULL statement
	return new_node(ND_NULL_STMT, __NULL, __NULL);
}

Node *primary(void){
	Node *node = data();

	// increment
	if(consume("++")){
		node = incdec(node, POST_INC);
	}

	// decrement
	if(consume("--")){
		node = incdec(node, POST_DEC);
	}

	// Is array index
	while(consume("[")){
		node = array_index(node, add());
		expect("]");
	}

	// member variable
	while(check(".") || check("->")){
		// dot
		if(consume(".")){
			if(node->kind == ND_LVAR){
				node = new_node(ND_ADDRESS, __NULL, node);
			}
			node = dot_arrow(ND_DOT, node);
		}

		// arrow
		if(consume("->")){
			node = dot_arrow(ND_ARROW, node);
		}

		// array index
		while(consume("[")){
			node = array_index(node, mul());
			expect("]");
		}
	}

	return node;
}

Node *unary(void){
	Node *node = __NULL;

	// increment
	if(consume("++")){
		return incdec(primary(), PRE_INC);
	}

	// decrement
	if(consume("--")){
		return incdec(primary(), PRE_DEC);
	}

	// logical not
	if(consume("!")){
		node = new_node(ND_NOT, __NULL, unary());
		node->type->ty    = INT;
		node->type->size  = 4 ;
		node->type->align = 4;
		return node;
	}

	// cast
	if(check("(")){
		if(token->next->kind == TK_TYPE || find_defined_type(token->next, CONSIDER_SCOPE)){
			consume("(");
			Type *casting_type = parse_type();
			expect(")");
			node = new_node(ND_CAST, __NULL, unary());
			node->type = casting_type;
			return node;
		}
	}

	if(consume("*")){
		return new_node(ND_DEREF, __NULL, unary());
	}

	if(consume("&")){
		return new_node(ND_ADDRESS, __NULL, unary());
	}

	if(consume("+")){
		//ignore +n
		return primary();
	}

	if(consume("-")){
		//convert to 0-n
		return new_node(ND_SUB, new_node_num(0), primary());
	}

	if(consume_reserved_word("sizeof", TK_SIZEOF)){
		// sizeof(5)  => 4
		// sizeof(&a) => 8
		if(consume("(")){
			if(token->kind == TK_TYPE || find_defined_type(token, IGNORE_SCOPE)){
				Type *target_type = parse_type();
				node = new_node(ND_NUM, node, new_node_num(target_type->size));
				node->val = target_type->size;
			}else{
				Node *target = expr();
				node = new_node(ND_NUM, node, target);
				node->val = node->rhs->type->size;
			}
			expect(")");
		}

		return node;
	}

	if(consume_reserved_word("_Alignof", TK_ALIGNOF)){
		// _Alignof(5)  => 4
		// _Alignof(&a) => 8
		if(consume("(")){
			if(token->kind == TK_TYPE || find_defined_type(token, IGNORE_SCOPE)){
				Type *target_type = parse_type();
				node = new_node(ND_NUM, node, new_node_num(target_type->align));
				node->val = target_type->align;
			}else{
				Node *target = expr();
				node = new_node(ND_NUM, node, target);
				node->val = node->rhs->type->align;
			}
			expect(")");
		}

		return node;
	}

	return primary();
}

Node *mul(void){
	Node *node = unary();

	for(;;){
		// is * and move the pointer next
		if(consume("*")){
			//create new node and jmp unary
			node = new_node(ND_MUL, node, unary());
		}else if(consume("/")){
			node = new_node(ND_DIV, node, unary());
		}else if(consume("%")){
			node = new_node(ND_MOD, node, unary());
		}else{
			return node;
		}
	}
}

Node *add(void){
	Node *node = mul();

	for(;;){
		if(consume("+")){
			node = new_node(ND_ADD, node, mul());
		}else if(consume("-")){
			node = new_node(ND_SUB, node, mul());
		}else{
			return node;
		}
	}
}

Node *relational(void){
	Node *node = add();

	for(;;){
		//prefer multi symbol
		if(consume(">=")){
			node = new_node(ND_GE, node, add());
		}else if(consume("<=")){
			node = new_node(ND_LE, node, add());
		}else if(consume(">")){
			node = new_node(ND_GT, node, add());
		}else if(consume("<")){
			node = new_node(ND_LT, node, add());
		}else{
			return node;
		}
	}
}

Node *equelity(void){
	Node *node = relational();

	for(;;){
		if(consume("==")){
			node = new_node(ND_EQ, node, equelity());
		}else if(consume("!=")){
			node = new_node(ND_NE, node, equelity());
		}else{
			return node;
		}
	}
}

Node *logical(void){
	Node *node = equelity();
	for(;;){
		if(consume("&&")){
			node = new_node(ND_AND, node, logical());
			node->lhs = new_node(ND_NE, node->lhs, new_node_num(0));
			node->rhs = new_node(ND_NE, node->rhs, new_node_num(0));
			node->val = label_num++;
		}else if(consume("||")){
			node = new_node(ND_OR, node, logical());
			node->lhs = new_node(ND_NE, node->lhs, new_node_num(0));
			node->rhs = new_node(ND_NE, node->rhs, new_node_num(0));
			node->val = label_num++;
		}else{
			return node;
		}
	}
}

Node *ternary(void){
	Node *node = logical();
	if(consume("?")){
		//                               cond  if true
		node      = new_node(ND_TERNARY, node, ternary());
		node->val = label_num++;
		expect(":");
		//           if false
		node->next = ternary();
	}

	return node;
}

Node *assign(void){
	Node *node = ternary();

	if(consume("=")){
		node = new_node(ND_ASSIGN, node, assign());
	}else if(consume("+=")){
		node = compound_assign(ND_ADD, node, assign());
	}else if(consume("-=")){
		node = compound_assign(ND_SUB, node, assign());
	}else if(consume("*=")){
		node = compound_assign(ND_MUL, node, assign());
	}else if(consume("/=")){
		node = compound_assign(ND_DIV, node, assign());
	}


	return node;
}

Node *expr(void){
	int star_count = 0;
	Node *node;

	if(token->kind == TK_CONST || token->kind == TK_TYPE ||
	   find_defined_type(token, CONSIDER_SCOPE)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_LVAR;

		// parsing type
		node->type = parse_type();

		// only type (e.g. int; enum DIR{E,W,S,N}; ...) 
		if(check(";")){
			return node;
		}

		// variable declaration
		Token *tok = consume_ident();
		if(tok){
			// If enumerator already exist -> error
			find_enumerator(tok, CONSIDER_SCOPE);
			node = declare_local_variable(node, tok, star_count);
		}else{
			error_at(token->str, "not a variable.");
		}

		// initialize formula
		if(consume("=")){
			node = init_formula(node);
		}
	}else if(consume_reserved_word("break", TK_BREAK)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_BREAK;
		node->val  = label_loop_end;
	}else if(consume_reserved_word("continue", TK_CONTINUE)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_CONTINUE;
		node->val  = label_loop_end;
	}else{
		node = assign();
	}

	return node;
}

Node *stmt(void){
	int stash_loop_end = label_loop_end;
	Node *node = __NULL;

	if(consume_reserved_word("return", TK_RETURN)){
		node = new_node(ND_RETURN, node, __NULL);
		if(!consume(";")){
			node->rhs = expr();
			if(!consume(";")) error_at(token->str, "not a ';' token.");
		}
	}else if(consume_reserved_word("if", TK_IF)){
		/*
		 * =========== if =========== 
		 *
		 *     (cond)<--if-->expr
		 *
		 * ========= else if =========== 
		 *
		 *     (cond)<--if-----+
		 *                     | 
		 *        if(cond)<--else-->expr
		 */
		node      = new_node(ND_IF, node, __NULL);
		node->val = label_num++;
		if(consume("(")){
			//jmp expr
			Node *cond = expr();
			//check end of caret
			expect(")");

			// (cond)<-if->expr
			node->lhs = cond;
			node->rhs = stmt();
		}

		if(consume_reserved_word("else", TK_ELSE)){
			// if()~ <-else-> expr
			Node *else_block = new_node(ND_ELSE, node, stmt());
			else_block->lhs  = node->rhs;
			node->rhs  = else_block;
			node->kind = ND_IFELSE;
		}

	}else if(consume_reserved_word("switch", TK_SWITCH)){
		/*
		 * default<---switch--->block code
		 *               | 
		 *               | (next)
		 *               | 
		 *   (cond)<---case->code
		 *               | 
		 *               | (next: chain_case)
		 *               +----->case->case->... 
		 */

		Node  *cond = __NULL;
		Label *before_switch = labels_tail;
		Label *prev = __NULL;

		node      = new_node(ND_SWITCH, node, __NULL);
		node->val = label_num++;
		label_loop_end = node->val;

		if(consume("(")){
			//jmp expr
			cond = expr();
			//check end of caret
			expect(")");
		}else{
			error_at(token->str, "expected ‘(’ before ‘{’ token");
		}

		// get code block 
		node->rhs = stmt(); 

		// register and remove case
		Node *cond_cases = __NULL;
		prev = before_switch;
		Label *lb = (before_switch) ? prev->next : labels_head;
		while(lb){
			if(lb->kind == LB_CASE){
				if(cond_cases){
					cond_cases->next      = new_node(ND_EQ, cond, lb->cond);
					cond_cases->next->val = lb->id;
					cond_cases            = cond_cases->next;
				}else{
					cond_cases      = new_node(ND_EQ, cond, lb->cond);
					cond_cases->val = lb->id;
					node->next      = cond_cases;
				}
			}else if(lb->kind == LB_DEFAULT){
				if(node->lhs){
					error_at(token->str, "multiple default labels in one switch");
				}else{
					node->lhs      = new_node(ND_CASE, __NULL, lb->cond);
					node->lhs->val = lb->id;
				}
			}

			// remove used case
			if(prev){
				prev->next = lb->next;
				lb   = prev->next;
				prev = lb;
			}else{
				prev = lb;
				lb   = lb->next;
				prev = __NULL;
			}
		}
	}else if(consume_reserved_word("case", TK_CASE)){
		/*
		 *  (cond) <--- case ---> code
		 */
		node = new_node(ND_CASE, logical(), __NULL);
		expect(":");
		label_register(node, LB_CASE);
		node->rhs = stmt();
	}else if(consume_reserved_word("default", TK_DEFAULT)){
		/*
		 *  (cond) <--- default ---> code
		 */
		node = new_node(ND_CASE, __NULL, __NULL);
		expect(":");
		node->rhs = stmt();
		label_register(node, LB_DEFAULT);
	}else if(consume_reserved_word("for", TK_FOR)){
		outside_lvar   = locals;
		outside_enum   = enumerations;
		outside_struct = structs;

		node      = new_node(ND_FOR, node, __NULL);
		node->val = label_num++;
		label_loop_end = node->val;

		if(consume("(")){
			//jmp expr
			Node *init = expr();
			expect(";");
			Node *cond = expr();
			expect(";");
			Node *calc = expr();
			//check end of caret
			expect(")");

			// +-----------------------+
			// +-> (init->cond->loop)  +<-for->expr
			node->rhs = stmt();
			node->lhs = init;
			node->lhs->next = cond;
			node->lhs->next->next = calc;
		}

		locals       = outside_lvar; 
		enumerations = outside_enum; 
		structs      = outside_struct; 
	}else if(consume_reserved_word("do", TK_DO)){
		// (cond)<-- do-while -->block
		node      = new_node(ND_DOWHILE, __NULL, __NULL);
		node->val = label_num++;
		label_loop_end = node->val;
		node->rhs = stmt();

		consume_reserved_word("while", TK_WHILE);
		if(consume("(")){
			node->lhs = expr();
			expect(")");
		}
		expect(";");
	}else if(consume_reserved_word("while", TK_WHILE)){
		node      = new_node(ND_WHILE, node, __NULL);
		node->val = label_num++;
		label_loop_end = node->val;
		if(consume("(")){
			//jmp expr
			Node *cond = expr();
			//check end of caret
			expect(")");

			// (cond)<-while->expr
			node->lhs = cond;
			node->rhs = stmt();
		}
	}else if(consume("{")){
		node = new_node(ND_BLOCK, node, __NULL);
		outside_lvar   = locals;
		outside_enum   = enumerations;
		outside_struct = structs;

		Node *block_code = calloc(1, sizeof(Node));
		while(token->kind!=TK_BLOCK){
			//Is first?
			if(node->rhs){
				block_code->block_code = stmt();
				block_code = block_code->block_code;
			}else{
				block_code = stmt();
				node->rhs = block_code;
			}
		}

		locals       = outside_lvar; 
		enumerations = outside_enum; 
		structs      = outside_struct; 
		expect("}");
	}else{
		node = expr();
		if(!consume(";")){
			while(*(token->str)!='\n') (token->str)--;
			error_at(token->str, "not a ';' token.");
		}
	}

	// revert loop end
	label_loop_end = stash_loop_end;
	return node;
}

void function(Func *func){
	int i = 0;

	Def_Type *stash_def_types = defined_types;

	// while end of function block
	while(!consume("}")){
		func->code[i++] = stmt();
	}

	defined_types = stash_def_types;

	func->stack_size = alloc_size;
	func->code[i] = __NULL;
}

void program(void){
	int func_index = 0;
	int star_count;
	int is_extern;
	int is_thread_local;
	Type *toplv_type;

	while(!at_eof()){
		// reset lvar list
		locals = __NULL;

		// reset lvar counter
		alloc_size = 0;
		star_count = 0;

		// reset flag
		is_extern       = 0;
		is_thread_local = 0;

		// typedef
		if(consume_reserved_word("typedef", TK_TYPEDEF)){
			Type *specified_type   = parse_type();
			Token *def_name        = consume_ident();

			Def_Type *def_new_type = calloc(1, sizeof(Def_Type));
			def_new_type->name     = def_name->str;
			def_new_type->name_len = def_name->len;

			if(specified_type->ty == STRUCT){
				def_new_type->tag     = structs->name;
				def_new_type->tag_len = structs->len;
			}else if(specified_type->ty == ENUM){
				if(enumerations->name){
					def_new_type->tag     = enumerations->name;
					def_new_type->tag_len = enumerations->len;
				}else{
					enumerations->name    = def_name->str;
					enumerations->len     = def_name->len;
					def_new_type->tag     = def_name->str;
					def_new_type->tag_len = def_name->len;
				}
			}

			def_new_type->type = specified_type;
			def_new_type->next = defined_types;
			defined_types      = def_new_type;

			expect(";");
			continue;
		}

		// extern
		if(consume_reserved_word("extern", TK_EXTERN)){
			is_extern = 1;
		}

		// thread local
		if(consume_reserved_word("_Thread_local", TK_THREAD_LOCAL)){
			is_thread_local = 1;
		}


		// parsing type
		toplv_type = parse_type();
		toplv_type->is_extern       = is_extern;
		toplv_type->is_thread_local = is_thread_local;

		// only type (e.g. int; enum DIR{E,W,S,N}; ...) 
		if(consume(";")){
			continue;
		}

		Token *def_name = consume_ident();

		// function
		if(consume("(")){
			Func *new_func = find_func(def_name);
			if(new_func == __NULL){
				func_list[func_index]       = calloc(1, sizeof(Func));
				func_list[func_index]->type = toplv_type;
				func_list[func_index]->name = calloc(def_name->len, sizeof(char));
				func_list[func_index]->len  = def_name->len;
				strncpy(func_list[func_index]->name, def_name->str, def_name->len);
				new_func = func_list[func_index];
				func_index++;
			}

			// add type list
			new_func->type = insert_ptr_type(new_func->type, star_count);

			// get arguments
			get_argument(new_func);

			// get function block
			if(consume("{")){
				function(new_func);
			// prototype declaration
			}else{
				expect(";");
			}
		// global variable
		}else{
			Node *init_gv = declare_global_variable(star_count, def_name, toplv_type);

			// initialize formula
			if(consume("=")){
				globals->init = global_init(init_gv);
			}

			expect(";");
		}
	}
	func_list[func_index] = __NULL;
}
int len_val(char *str){
	int counter = 0;
	for(;is_alnum(*str);str++){
		counter++;
	}

	return counter;
}

bool is_block(char c){
	return (c == '{') || (c == '}');
}

bool is_space(char c){
	return (c == ' ') || (c == '\t') || (c == '\n');
}

bool is_digit(char c){
	return	(('0' <=  c) && (c <=  '9'));
}

bool at_eof(void){
	return token->kind == TK_EOF;
}

bool is_alnum(char c){
	return	(('a' <=  c) && (c <=  'z')) ||
		(('A' <=  c) && (c <=  'Z')) ||
		(('0' <=  c) && (c <=  '9')) ||
		(c == '_');
}

bool is_ascii(char c){
	return 0 <= c && c <= 127;
}

bool is_symbol(char *str,  bool *single_flag){
	int i;
	int size;
	char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
	char repeat_symbol[] = "<>&|+-";
	char multi_symbol[]  = "->";
	char multi_eq[]      = "<=>!+*-/";

	//Is multi equal? (<=,==,!=,>=)
	size = sizeof(multi_eq)/sizeof(char);
	for(i = 0;i < size;i++){
		if((*str == multi_eq[i]) && (*(str+1) == '=')){
			*single_flag = false;
			return true;
		}
	}

	//Is repeat symbol? (<<,>>,&&,||,++,--)
	size = sizeof(repeat_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
			*single_flag = false;
			return true;
		}
	}

	//Is multi symbol? (->)
	size = sizeof(multi_symbol)/sizeof(char)/2;
	for(i = 0;i < size;i += 2){
		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
			*single_flag = false;
			return true;
		}
	}

	//Is single symbol? (+,-,*,/,%,<,>,',.)
	size = sizeof(single_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == single_symbol[i]){
			*single_flag = true;
			return true;
		}
	}

	return false;
}


Token *new_token(TokenKind kind, Token *cur, char *str){
	Token *new = calloc(1, sizeof(Token));
	new->kind = kind;
	//Remaining characters
	new->str = str;
	new->len = 1;
	cur->next = new;
	return new;
}

bool tokenize_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind){
	if(strncmp(*p, str, (size_t)len) !=  0 || is_alnum((*p)[len])){
		return false;
	}

	*now = new_token(tk_kind, *now, *p);
	(*now)->len = len;
	(*now)->str = *p;
	*p += len;

	return true;
}

Token *tokenize(char *p){
	bool is_single_token;
	Token head;
	head.next = __NULL;

	//set head pointer to cur
	Token *now = &head;

	while(*p){
		if(is_space(*p)){
			p++;
			continue;
		}

		if((*p == '/') && (*(p+1) == '/')){
			while(*p != '\n') p++;
			continue;
		}

		if((*p == '/') && (*(p+1) == '*')){
			p+=3;
			while(!((*(p-1) == '*') && (*p == '/'))) p++;
			p++;
			continue;
		}

		//Is character literal?
		if(*p == '\''){
			p++;// consume single quote
			if(*p == '\\'){
				p++;// consume back slash

				//Is NUL? (\0)
				if(*p == '0'){
					now = new_token(TK_NUM, now, p++);
					now->val = 0;
					//Is LF? (\n)
				}else if(*p == 'n'){
					now = new_token(TK_NUM, now, p++);
					now->val = 10;
					//Is HT? (\t)
				}else if(*p == 't'){
					now = new_token(TK_NUM, now, p++);
					now->val = 9;
				}else if(*p == '\\'){
					now = new_token(TK_NUM, now, p++);
					now->val = 92;
				}else if(*p == '\''){
					now = new_token(TK_NUM, now, p++);
					now->val = 39;
				}
			}else{
				now = new_token(TK_NUM, now, p);
				now->val = *p++;
			}
			// consume single quote
			p++;
			continue;
		}

		//Is number?
		if(is_digit(*p)){
			if(now->kind == TK_IDENT){
				now = new_token(TK_IDENT, now, p++);
				now->len = 1;
			}else{
				//add number token
				now = new_token(TK_NUM, now, p);
				//set number
				now->val = strtol(p, &p, 10);
			}
			continue;
		}

		//judge single token or multi token or isn't token
		if(is_symbol(p, &is_single_token)){
			now = new_token(TK_RESERVED, now, p);
			if(is_single_token){
				p++;
			}else{
				p += 2;
				now->len = 2;
			}
			continue;
		}

		if(tokenize_reserved(&p, "void",     4, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "_Bool",    5, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "char",     4, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "int",	     3, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "size_t",   6, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "struct",   6, &now, TK_TYPE))     continue;
		if(tokenize_reserved(&p, "enum",     4, &now, TK_TYPE))     continue;
		if(tokenize_reserved(&p, "if",	     2, &now, TK_IF))	    continue;
		if(tokenize_reserved(&p, "else",     4, &now, TK_ELSE))	    continue;
		if(tokenize_reserved(&p, "switch",   6, &now, TK_SWITCH))   continue;
		if(tokenize_reserved(&p, "case",     4, &now, TK_CASE))	    continue;
		if(tokenize_reserved(&p, "default",  7, &now, TK_DEFAULT))  continue;
		if(tokenize_reserved(&p, "for",	     3, &now, TK_FOR))	    continue;
		if(tokenize_reserved(&p, "do",	     2, &now, TK_DO))       continue;
		if(tokenize_reserved(&p, "while",    5, &now, TK_WHILE))    continue;
		if(tokenize_reserved(&p, "break",    5, &now, TK_BREAK))    continue;
		if(tokenize_reserved(&p, "continue", 8, &now, TK_CONTINUE)) continue;
		if(tokenize_reserved(&p, "sizeof",   6, &now, TK_SIZEOF))   continue;
		if(tokenize_reserved(&p, "_Alignof", 8, &now, TK_ALIGNOF))  continue;
		if(tokenize_reserved(&p, "typedef",  7, &now, TK_TYPEDEF))  continue;
		if(tokenize_reserved(&p, "return",   6, &now, TK_RETURN))   continue;
		if(tokenize_reserved(&p, "extern",   6, &now, TK_EXTERN))   continue;
		if(tokenize_reserved(&p, "const",    5, &now, TK_CONST))    continue;
		if(tokenize_reserved(&p, "_Thread_local", 13, &now, TK_THREAD_LOCAL)) continue;

		// compiler directive
		if(tokenize_reserved(&p, "__NULL",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
		//if(tokenize_reserved(&p, "define",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
		//if(tokenize_reserved(&p, "include",  7, &now, TK_COMPILER_DIRECTIVE)) continue;


		//Is block? '{' or '}'
		if(is_block(*p)){
			now = new_token(TK_BLOCK, now, p);
			now->len = 1;
			now->str = p;
			p++;
			continue;
		}

		//Is string?
		if(*p == '"'){
			now = new_token(TK_RESERVED, now, p++);
			while(!(*(p-1) != '\\' && *p == '"')){
				now = new_token(TK_STR, now, p++);
			}
			now = new_token(TK_RESERVED, now, p++);
			continue;
		}

		//Is escape?
		if(*p == '\\' && *(p+1) == '\\'){
			now = new_token(TK_IDENT, now, p++);
			p++;
			continue;
		}

		//Is valiable?
		if(is_alnum(*p)){
			while(is_alnum(*p)){
				now = new_token(TK_IDENT, now, p++);
				now->len = 1;
			}
			continue;
		}

		error_at(p, "can not tokenize.");
	}

	//add EOF token
	new_token(TK_EOF, now, p);
	return head.next;
}
