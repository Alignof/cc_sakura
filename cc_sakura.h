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
	TK_IF,
	TK_ELSE,
	TK_WHILE,
	TK_FOR,
	TK_RETURN,
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
	ND_IF,		//if
	ND_ELSE,	//else
	ND_IFELSE,	//if-else
	ND_WHILE,	//while
	ND_FOR,		//for
	ND_RETURN,	//return
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

int len_val(char *str);
char *user_input;
void error(char *loc,char *fmt, ...);
bool issymbol(char *str, bool *flag);
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
int label_begin;
int label_end;
int label_else;
void gen(Node *node);
void gen_lval(Node *node);





