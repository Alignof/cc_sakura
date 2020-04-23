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

typedef struct Token Token;

struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
};

Token *token;
char *user_input;

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

bool consume(char op){
	if(token->kind != TK_RESERVED || token->str[0] != op)
		return false;
	token=token->next;
	return true;
}

void expect(char op){
	if(token->kind!=TK_RESERVED || token->str[0]!=op)
		error(token->str,"does not charctor.");
	token=token->next;
}

int expect_number(){
	if(token->kind!=TK_NUM)
		error(token->str,"not a number");
	int val=token->val;
	token=token->next;
	return val;
}

Token *new_token(TokenKind kind,Token *cur,char *str){
	Token *new=calloc(1,sizeof(Token));
	new->kind=kind;
	new->str=str;
	cur->next=new;
	return new;
}

Token *tokenize(char *p){
	Token head;
	head.next=NULL;
	Token *cur=&head;

	while(*p){
		if(isspace(*p)){
			p++;
			continue;
		}

		if(*p=='+' || *p=='-'){
			cur=new_token(TK_RESERVED,cur,p++);
			continue;
		}

		if(isdigit(*p)){
			cur=new_token(TK_NUM,cur,p);
			cur->val=strtol(p,&p,10);
			continue;
		}

		error(token->str,"cat not tokenize.");
	}

	new_token(TK_EOF,cur,p);
	return head.next;
}

bool at_eof(){
	return token->kind==TK_EOF;
}

int main(int argc,char **argv){
	if(argc!=2){
		fprintf(stderr,"Incorrect number of arguments\n");
		return 1;
	}
	
	user_input=argv[1];
	token=tokenize(argv[1]);

	printf(".intel_syntax noprefix\n");
	printf(".global main\n");
	printf("main:\n");

	printf("	mov rax,%ld\n",expect_number());

	while(!at_eof()){
		if(consume('+')){
			printf("	add rax,%ld\n",expect_number());
			continue;
		}

		expect('-');
		printf("	sub rax,%ld\n",expect_number());
	}

	printf("	ret\n");

	return 0;
}

