#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef enum{
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_EOF,
}TokenKind;

typedef enum{
	ND_ADD,		// *
	ND_SUB,		// -
	ND_MUL,		// *
	ND_DIV,		// /
	ND_GT,		// >
	ND_GE,		// >=
	ND_LT,		// <
	ND_LE,		// <=
	ND_EQ,		// ==
	ND_NE,		// !=
	ND_ASSIGN,	// =
	ND_LVAR,	//local valiable
	ND_NUM,		//integer
}NodeKind;


typedef struct Token Token;
typedef struct Node Node;
typedef struct LVar LVar;

//code token
struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

//tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	int val;
	int offset;
};

//local variable
struct LVar{
	LVar *next;
	char *name;
	int len;
	int offset;
};

//parse.c
Token *token;
Node *code[100];
LVar *locals;

char *user_input;
void error(char *loc,char *fmt, ...);
bool issymbol(char *str, bool *flag);
bool at_eof();
bool consume(char *op);
void expect(char *op);
int expect_number();

Token *new_token(TokenKind kind,Token *cur,char *str);
Token *tokenize(char *p);

Node *new_node(NodeKind kind,Node *lhs,Node *rhs);
Node *new_node_num(int val);

void program();
Node *stmt();
Node *expr();
Node *assign();
Node *relational();
Node *equelity();
Node *add();
Node *mul();
Node *unary();
Node *primary();

//codegan.c
void gen(Node *node);




