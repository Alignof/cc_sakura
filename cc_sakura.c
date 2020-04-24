#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum{
	TK_RESERVED,
	TK_NUM,
	TK_EOF,
}TokenKind;

typedef enum{
	ND_ADD,
	ND_SUB,
	ND_MUL,
	ND_DIV,
	ND_GT,
	ND_GE,
	ND_LT,
	ND_LE,
	ND_EQ,
	ND_NE,
	ND_NUM,
}NodeKind;

typedef struct Token Token;
typedef struct Node Node;

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
};

Token *token;
char *user_input;

Node *expr();
Node *relationalj();
Node *add();
Node *mul();
Node *unary();
Node *primary();

void error(char *loc,char *fmt, ...){
	va_list ap;
	va_start(ap,fmt);

	int pos=loc-user_input;
	fprintf(stderr,"%s\n",user_input);
	fprintf(stderr,"%*s",pos,"");
	fprintf(stderr,"^ ");
	vfprintf(stderr,fmt,ap);
	fprintf(stderr,"\n");
	exit(1);
}

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if(token->kind != TK_RESERVED ||
		strlen(op)!=token->len||
		memcmp(token->str,op,token->len))
		return false;
	token=token->next;
	return true;
}

void expect(char *op){
	// judge whether op is a symbol and move the pointer to the next
	if(token->kind != TK_RESERVED ||
		strlen(op)!=token->len||
		memcmp(token->str,op,token->len))
		error(token->str,"does not charctor.");
	token=token->next;
}

int expect_number(){
	// judge whether token is a number and move the pointer to the next and return value
	if(token->kind!=TK_NUM)
		error(token->str,"not a number");
	int val=token->val;
	token=token->next;
	return val;
}

Node *new_node(NodeKind kind,Node *lhs,Node *rhs){
	//create new node(symbol)
	Node *node=calloc(1,sizeof(Node));
	node->kind=kind;
	node->lhs=lhs;
	node->rhs=rhs;
	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node=calloc(1,sizeof(Node));
	node->kind=ND_NUM;
	node->val=val;
	return node;
}

Node *primary(){
	if(consume("(")){
		//jmp expr
		Node *node=expr();
		//check end of caret
		expect(")");
		return node;
	}
	//return new num node
	return new_node_num(expect_number());
}

Node *unary(){
	if(consume("+"))
		//ignore +
		return primary();
	if(consume("-"))
		//convert 0-n
		return new_node(ND_SUB,new_node_num(0),primary());

	return primary();
}

Node *mul(){
	//jmp unary()
	Node *node=unary();

	for(;;){
		// is * and move the pointer next
		if(consume("*")){
			//create new node and jmp unary
			node=new_node(ND_MUL,node,unary());
		}else if(consume("/")){
			node=new_node(ND_DIV,node,unary());
		}else{
			return node;
		}
	}
}

Node *add(){
	//jmp mul()
	Node *node=mul();

	for(;;){
		if(consume("+")){
			node=new_node(ND_ADD,node,mul());
		}else if(consume("-")){
			node=new_node(ND_SUB,node,mul());
		}else{
			return node;
		}
	}
}

Node *relational(){
	Node *node=add();

	for(;;){
		//prefer multi symbol
		if(consume(">=")){
			node=new_node(ND_GE,node,add());
		}else if(consume("<=")){
			node=new_node(ND_LE,node,add());
		}else if(consume(">")){
			node=new_node(ND_GT,node,add());
		}else if(consume("<")){
			node=new_node(ND_LT,node,add());
		}else{
			return node;
		}
		
	}
}

Node *expr(){
	Node *node=relational();

	for(;;){
		if(consume("==")){
			node=new_node(ND_EQ,node,relational());
		}else if(consume("!=")){
			node=new_node(ND_NE,node,relational());
		}else{
			return node;
		}
	}
}

Token *new_token(TokenKind kind,Token *cur,char *str){
	Token *new=calloc(1,sizeof(Token));
	new->kind=kind;
	new->str=str;
	new->len=1;
	cur->next=new;
	return new;
}

bool istoken(char *str, bool *flag){
	int i;
	char *single_tokens="+-*/()<>";
	char *multi_tokens="<=>!";
	int size;
	
	//Is multi token? (<=,==,!=,>=)
	size=sizeof(multi_tokens)/sizeof(char);
	for(i=0;i<size;i++){
		if(*str==multi_tokens[i] && *(str+1)=='='){
			*flag=false;
			return true;
		}
	}
	
	//Is single token? (+,-,*,/,<,>)
	size=sizeof(single_tokens)/sizeof(char);
	for(i=0;i<size;i++){
		if(*str==single_tokens[i]){
			*flag=true;
			return true;
		}
	}

	return false;
}

Token *tokenize(char *p){
	bool is_single_token;
	Token head;
	head.next=NULL;

	//set head pointer to cur
	Token *cur=&head;

	while(*p){
		if(isspace(*p)){
			p++;
			continue;
		}

		//single token or multi token or isn't token
		if(istoken(p,&is_single_token)){
			if(is_single_token){
				cur=new_token(TK_RESERVED,cur,p);
				p++;
			}else{
				cur=new_token(TK_RESERVED,cur,p);
				p+=2;
				cur->len=2;
			}
			continue;
		}

		if(isdigit(*p)){
			//add number token
			cur=new_token(TK_NUM,cur,p);
			//set number
			cur->val=strtol(p,&p,10);
			continue;
		}

		error(token->str,"cat not tokenize.");
	}

	//add EOF token
	new_token(TK_EOF,cur,p);
	return head.next;
}

bool at_eof(){
	return token->kind==TK_EOF;
}

void gen(Node *node){
	if(node->kind==ND_NUM){
		printf("push %d\n",node->val);
		return;
	}

	//check left hand side
	gen(node->lhs);
	//check right hand side
	gen(node->rhs);

	printf("	pop rdi\n");
	printf("	pop rax\n");

	switch(node->kind){
		case ND_ADD:
			printf("	add rax,rdi\n");
			break;
		case ND_SUB:
			printf("	sub rax,rdi\n");
			break;
		case ND_MUL:
			printf("	imul rax,rdi\n");
			break;
		case ND_DIV:
			printf("	cqo\n");
			printf("	idiv rax,rdi\n");
			break;
		case ND_GT:
			printf("	cmp rdi,rax\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_GE:
			printf("	cmp rdi,rax\n");
			printf("	setge al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LT:
			printf("	cmp rax,rdi\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LE:
			printf("	cmp rax,rdi\n");
			printf("	setle al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_EQ:
			printf("	cmp rax,rdi\n");
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_NE:
			printf("	cmp rax,rdi\n");
			printf("	setne al\n");
			printf("	movzb rax,al\n");
			break;
	}

	printf("	push rax\n");
}

int main(int argc,char **argv){
	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	user_input=argv[1];
	//tokenize
	token=tokenize(argv[1]);
	//make syntax tree
	Node *node=expr();

	printf(".intel_syntax noprefix\n");
	printf(".global main\n");
	printf("main:\n");

	//generate assembly
	gen(node);

	printf("	pop rax\n");
	printf("	ret\n");

	return 0;
}

