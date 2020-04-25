#include "cc_sakura.h"

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

Token *new_token(TokenKind kind,Token *cur,char *str){
	Token *new=calloc(1,sizeof(Token));
	new->kind=kind;
	//Remaining characters
	new->str=str;
	new->len=1;
	cur->next=new;
	return new;
}

bool issymbol(char *str, bool *flag){
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


bool at_eof(){
	return token->kind==TK_EOF;
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

		//judge single token or multi token or isn't token
		if(issymbol(p,&is_single_token)){
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

