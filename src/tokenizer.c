#include "cc_sakura.h"

bool isblock(char *str){
	return *str=='{' || *str=='}';
}

bool at_eof(){
	return token->kind==TK_EOF;
}

int is_alnum(char c){
	return ('a'<=c && c<='z')||
	('A'<=c && c<='Z')||
	('0'<=c && c<='9')||
	(c=='_');
}

int len_val(char *str){
	int counter;
	for(counter=0;(('a' <= *str && *str <= 'z') || ('0' <= *str && *str <= '9'));str++)
		counter++;
	return counter;
}

bool issymbol(char *str, bool *flag){
	int i;
	char single_tokens[]="+-*/&()<>=,;";
	char multi_tokens[]="<=>!";
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

Token *new_token(TokenKind kind,Token *cur,char *str){
	Token *new=calloc(1,sizeof(Token));
	new->kind=kind;
	//Remaining characters
	new->str=str;
	new->len=1;
	cur->next=new;
	return new;
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

		//Is Type:int?
		if(strncmp(p,"int",3)==0 && !is_alnum(p[3])){
			cur=new_token(TK_TYPE,cur,p);
			cur->len=3;
			cur->str=p;
			p+=3;
			continue;
		}

		//Is if?
		if(strncmp(p,"if",2)==0 && !is_alnum(p[2])){
			cur=new_token(TK_IF,cur,p);
			cur->len=2;
			cur->str=p;
			p+=2;
			continue;
		}

		//Is else?
		if(strncmp(p,"else",4)==0 && !is_alnum(p[4])){
			cur=new_token(TK_ELSE,cur,p);
			cur->len=4;
			cur->str=p;
			p+=4;
			continue;
		}

		//Is while?
		if(strncmp(p,"while",5)==0 && !is_alnum(p[5])){
			cur=new_token(TK_WHILE,cur,p);
			cur->len=5;
			cur->str=p;
			p+=5;
			continue;
		}
		
		//Is sizeof?
		if(strncmp(p,"sizeof",6)==0 && !is_alnum(p[6])){
			cur=new_token(TK_SIZEOF,cur,p);
			cur->len=6;
			cur->str=p;
			p+=6;
			continue;
		}
		
		//Is block? '{' or '}'
		if(isblock(p)){
			cur=new_token(TK_BLOCK,cur,p);
			cur->len=1;
			cur->val=*p;
			cur->str=p;
			p+=1;
			continue;
		}
		
		//Is return?
		if(strncmp(p,"return",6)==0 && !is_alnum(p[6])){
			cur=new_token(TK_RETURN,cur,p);
			cur->len=6;
			cur->str=p;
			p+=6;
			continue;
		}

		//Is valiable?
		if('a'<=*p && *p<='z'){
			cur=new_token(TK_IDENT,cur,p++);
			cur->len=1;
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

