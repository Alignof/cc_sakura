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

typedef struct Token Token;
typedef struct Node Node;
typedef struct LVar LVar;
typedef struct Func Func;

// code token
struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *vector;
	int val;
	char *str;
	int offset;
};

// function
struct Func{
	int argc;
	int lvarc;
	char *name;
	Func *next;
	Node *args;
	Node *code[100];
};

// local variable
struct LVar{
	int len;
	int offset;
	char *name;
	LVar *next;
	Type type;
};

// type of variable
struct Type{
	enum {INT,PTR} ty;
	struct Type *ptr_to;
};

// parse.c
int lvar_count;
Token *token;
Func *func_list[100];
LVar *locals;

int len_val(char *str);
char *user_input;
void error(char *loc,char *fmt, ...);
bool issymbol(char *str, bool *flag);
bool isblock(char *str);
bool at_eof();
bool consume(char *op);
bool consume_ret();
bool consume_reserved_word();
void expect(char *op);
int expect_number();

Token *new_token(TokenKind kind,Token *cur,char *str);
Token *tokenize(char *p);
Token *consume_ident();

Node *new_node(NodeKind kind,Node *lhs,Node *rhs);
Node *new_node_num(int val);

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


