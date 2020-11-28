#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>
#include <errno.h>

#define FUNC_NUM 100

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
	TK_RETURN,
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
	ND_TERNARY,	//  cond ? if_true : if_false
	ND_IF, 		//  if
	ND_ELSE, 	//  else
	ND_IFELSE, 	//  if-else
	ND_SWITCH, 	//  switch
	ND_CASE, 	//  case or default
	ND_WHILE, 	//  while
	ND_DOWHILE, 	//  do-while
	ND_FOR, 	//  for
	ND_BLOCK, 	//  {}
	ND_ARG, 	//  function argument;
	ND_CALL_FUNC, 	//  func();
	ND_RETURN, 	//  return
	ND_BREAK, 	//  break
	ND_CONTINUE, 	//  continue
	ND_TYPE, 	//  int, double, char...
}NodeKind;

typedef enum{
	VOID,
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
typedef struct Type   Type;
typedef struct Str    Str;

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
	Member   *member;
	int	 size;
	int	 align;
	int      index_size;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *next;
	Node *vector;
	Type *type;
	int  val;
	char *str;
	int  offset;
};

// function
struct Func{
	//int argc;
	int stack_size;
	char *name;
	Type *type;
	Node *args;
	Node *code[100];
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



// global variable
extern int   llid;
extern int   lvar_count;
extern int   alloc_size;
extern char  *user_input;
extern char  filename[100];
extern Token *token;
extern Func  *func_list[100];
extern LVar  *locals;
extern GVar  *globals;
extern Str   *strings;
extern Struc *structs;
extern Enum  *enumerations;
extern Label *labels_head;
extern Label *labels_tail;
extern LVar  *outside_lvar;
extern Struc *outside_struct;
extern Enum  *outside_enum;

// main.c
char *read_file(char *path);
void get_code(int argc, char **argv);

// tokenizer.c
int len_val(char *str);
int is_alnum(char c);
bool issymbol(char *str,  bool *single_flag);
bool isblock(char *str);
bool at_eof(void);
Token *tokenize(char *p);
Token *new_token(TokenKind kind, Token *cur, char *str);
bool consume_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind);

// parse_sys.c
void error(char *loc, char *fmt,  ...);
void error_at(char *loc, char *msg);
bool check(char *op);
bool consume(char *op);
bool consume_ret(void);
bool consume_reserved_word(char *keyword, TokenKind kind);
void expect(char *op);
int expect_number(void);
Token *consume_ident(void);
Token *consume_string(void);
void label_register(Node *node, LabelKind kind);
Node *new_node(NodeKind kind, Node *lhs, Node *rhs);
Node *new_node_num(int val);
Func *find_func(Token *tok);
GVar *find_gvar(Token *tok);
LVar *find_lvar(Token *tok, int find_range);
Str  *find_string(Token *tok);
Struc *find_struc(Token *tok, int find_range);
Enum *find_enum(Token *tok, int find_range);
Member *find_enumerator(Token *tok, int find_range);
void revert_scope();

// parse_util.c
int type_size(Type *type);
int type_align(Type *type);
int align_array_size(int isize, Type *array_type);
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
void get_argument(int func_index);
Node *compound_assign(TypeKind type, Node *dst, Node *src);
Node *dot_arrow(NodeKind type, Node *node);
Node *init_formula(Node *node, Node *init_val);
Node *incdec(Node *node, IncDecKind idtype);
Node *array_block(Node *arr);
Node *array_str(Node *arr, Node *init_val);
Node *call_function(Node *node, Token *tok);
Node *array_index(Node *node, Node *index);

// declare.c
Type *parse_type(void);
Type *insert_ptr_type(Type *prev, int star_count);
Node *declare_global_variable(int star_count, Token* def_name, Type *toplv_type);
Node *declare_local_variable(Node *node, Token *tok, int star_count);
void declare_struct(Struc *new_struc);
void declare_enum(Enum *new_enum);

// codegan.c
extern int label_if;
extern int label_loop;
extern int if_depth;
extern int loop_depth;
void gen(Node *node);
void gen_calc(Node *node);
void gen_lvar(Node *node);
void gen_gvar(Node *node);
void gen_struc(Node *node);
void gen_address(Node *node);
void expand_next(Node *node);
void expand_vector(Node *node);


