//================define macro=====================
#define SEEK_SET 0
#define SEEK_END 2
#define FUNC_NUM 300
#define true ((bool)1)
#define false ((bool)0)
#define NULL ((void *)0)

extern int *__errno_location(void);
#define errno (*__errno_location())

#define SIZE_PTR 8
//=========================================================

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
	LONG,
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
typedef struct MacroTable  MacroTable;
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

// macro table
struct MacroTable {
	Token *code;
    MacroTable *next;
    char *name;
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
extern int      aligned_stack_size;
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

extern FILE *stdin;     /* Standard input stream.  */
extern FILE *stdout;	/* Standard output stream.  */
extern FILE *stderr;	/* Standard error output stream.  */

typedef _Bool bool;
typedef long size_t;
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
Token *is_macro(char *p, int len);
bool consume_keyword(char **p, char *str, int len);
bool at_eof(void);
bool tokenize_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind);
Token *new_token(TokenKind kind, Token *cur, char *str);
void register_macro(char **p);
Token *tokenize(char **p, Token *now);
Token *tokenize_main(char *p);


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
void gen_main(void);
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

