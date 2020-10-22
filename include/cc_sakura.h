#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>
#include <errno.h>


typedef enum{
	TK_TYPE,
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_IF,
	TK_ELSE,
	TK_WHILE,
	TK_FOR,
	TK_SIZEOF,
	TK_BLOCK,
	TK_STR,
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

	// symbol --> rhs
	ND_POSTID, 	//  a++, a--

	// lhs <-- symbol
	ND_PREID, 	//  ++a, --a
	ND_ADDRESS, 	//  &a
	ND_DEREF, 	//  *a

	// other
	ND_LVAR, 	//  local variable
	ND_GVAR, 	//  global variable
	ND_LARRAY, 	//  local array
	ND_GARRAY, 	//  global array
	ND_STR, 	//  "string"
	ND_NUM, 	//  integer
	ND_IF, 		//  if
	ND_ELSE, 	//  else
	ND_IFELSE, 	//  if-else
	ND_WHILE, 	//  while
	ND_FOR, 	//  for
	ND_BLOCK, 	//  {}
	ND_ARG, 	//  function argument;
	ND_CALL_FUNC, 	//  func();
	ND_RETURN, 	//  return
	ND_TYPE, 	//  int, double, char...
}NodeKind;

typedef enum{
	CHAR,
	INT,
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


typedef struct Token  Token;
typedef struct Node   Node;
typedef struct LVar   LVar;
typedef struct GVar   GVar;
typedef struct Struc  Struc;
typedef struct Member Member;
typedef struct Func   Func;
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
	size_t   index_size;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *next;
	Node *vector;
	Type type;
	int  val;
	char *str;
	int  offset;
};

// function
struct Func{
	//int argc;
	int stack_size;
	char *name;
	Type type;
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
	Type type;
	GVar *next;
	Node *init;
};

// local variable
struct LVar{
	int len;
	int offset;
	char *name;
	Type type;
	LVar *next;
}; 

// struct
struct Struc{
	int    len;
	int    memsize;
	char   *name;
	Member *member;
	Struc  *next;
};

// struct member
struct Member{
	int    len;
	int    offset;
	char   *name;
	Type   type;
	Member *next;
};



// global variable
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

// main.c
char *read_file(char *path);
void get_code(int argc, char **argv);

// tokenizer.c
int len_val(char *str);
int is_alnum(char c);
bool issymbol(char *str,  bool *flag);
bool isblock(char *str);
bool at_eof();
Token *tokenize(char *p);
Token *new_token(TokenKind kind, Token *cur, char *str);
bool consume_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind);

// parse_sys.c
void error(char *loc, char *fmt,  ...);
void error_at(char *loc, char *msg);
bool consume(char *op);
bool consume_ret();
bool consume_reserved_word();
void expect(char *op);
int expect_number();
Token *consume_ident();
Token *consume_string();
Node *new_node(NodeKind kind, Node *lhs, Node *rhs);
Node *new_node_num(int val);
GVar *find_gvar(Token *tok);
LVar *find_lvar(Token *tok);
Str  *find_string(Token *tok);
Struc *find_struc(Token *tok);

// parse_util.c
int type_size(TypeKind type);
int align_array_size(int isize, TypeKind array_type);
Node *pointer_calc(Node *node, Type lhs_type, Type rhs_type);
TypeKind get_pointer_type(Type *given);

// syntax_tree.c
void program();
void function(Func *func);
Node *stmt();
Node *expr();
Node *assign();
Node *relational();
Node *logical();
Node *equelity();
Node *add();
Node *mul();
Node *unary();
Node *primary();

// parse_part.c
void get_argument(int func_index);
Node *init_formula(Node *node, Node *init_val);
Node *incdec(Node *node, IncDecKind idtype);
Node *array_block();
Node *array_str(Node *arr, Node *init_val);
Node *call_function(Node *node, Token *tok);
Node *array_index(Node *node, Node *index);

// declare.c
Node *declare_global_variable();
Node *declare_local_variable(Node *node, Token *tok, int star_count);
void declare_struct(Struc *new_struc);

// codegan.c
extern int label_begin;
extern int label_end;
extern int label_else;
void gen(Node *node);
void gen_lvar(Node *node);
void gen_gvar(Node *node);
void expand_next(Node *node);
void expand_vector(Node *node);


