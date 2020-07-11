#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


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
	TK_RETURN,
	TK_EOF,
}TokenKind;

typedef enum{
	ND_ADD,		//  +
	ND_SUB,		//  -
	ND_MUL,		//  *
	ND_DIV,		//  /
	ND_GT,		//  >
	ND_ADDRESS,	//  &a
	ND_DEREF,	//  *a
	ND_GE,		//  >=
	ND_LT,		//  <
	ND_LE,		//  <=
	ND_EQ,		//  ==
	ND_NE,		//  !=
	ND_ASSIGN,	//  =
	ND_LVAR,	//  local valiable
	ND_NUM,		//  integer
	ND_IF,		//  if
	ND_ELSE,	//  else
	ND_IFELSE,	//  if-else
	ND_WHILE,	//  while
	ND_FOR,		//  for
	ND_BLOCK,	//  {}
	ND_ARG,		//  function argument;
	ND_CALL_FUNC,	//  func();
	ND_RETURN,	//  return
	ND_TYPE,	//  int,double,char...
}NodeKind;

typedef enum{
	INT,
	PTR,
	ARRAY,
}TypeKind;


typedef struct Token Token;
typedef struct Node Node;
typedef struct LVar LVar;
typedef struct Func Func;
typedef struct Type Type;

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
	Type *ptr_to;
	size_t alloc_size;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *vector;
	Type type;
	int val;
	char *str;
	int offset;
};

// function
struct Func{
	int argc;
	int lvarc;
	char *name;
	Type type;
	Node *args;
	Node *code[100];
	Func *next;
};

// local variable
struct LVar{
	int len;
	int offset;
	char *name;
	Type type;
	LVar *next;
};

// tokenizer
int len_val(char *str);
bool issymbol(char *str, bool *flag);
bool isblock(char *str);
bool at_eof();
Token *tokenize(char *p);
Token *new_token(TokenKind kind,Token *cur,char *str);
bool consume_reserved(char **p,char *str,int len,Token **now,TokenKind tk_kind);

// parse_func.c
int lvar_count;
char *user_input;
Token *token;
Func *func_list[100];
LVar *locals;

void error(char *loc,char *fmt, ...);
bool consume(char *op);
bool consume_ret();
bool consume_reserved_word();
void expect(char *op);
int expect_number();
int type_size(TypeKind type);
Token *consume_ident();
Node *new_node(NodeKind kind,Node *lhs,Node *rhs);
Node *new_node_num(int val);
LVar *find_lvar(Token *tok);
Node *pointer_calc(Node *node,Type *lhs_type,Type *rhs_type);

// parse_stream.c
void program();
void function(Func *func);
Node *stmt();
Node *expr();
Node *assign();
Node *relational();
Node *equelity();
Node *add();
Node *mul();
Node *unary();
Node *primary();

// codegan.c
int label_begin;
int label_end;
int label_else;
void gen(Node *node);
void gen_lvar(Node *node);


