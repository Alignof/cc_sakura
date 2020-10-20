#include "cc_sakura.h"

bool isblock(char *str){
	return (*str == '{') || (*str == '}');
}

bool at_eof(){
	return token->kind == TK_EOF;
}

int is_alnum(char c){
	return	(('a' <=  c) && (c <=  'z')) ||
		(('A' <=  c) && (c <=  'Z')) ||
		(('0' <=  c) && (c <=  '9')) ||
		(c == '_');
}

int len_val(char *str){
	int counter = 0;
	for(;is_alnum(*str);str++){
		counter++;
	}

	return counter;
}

bool issymbol(char *str,  bool *flag){
	int i;
	int size;
	char single_symbol[] = "+-*/%&()'<>=,;[]";
	char multi_symbol[] = "<>&|+-";
	char multi_eq[] = "<=>!";
	
	//Is multi equal? (<=,==,!=,>=)
	size = sizeof(multi_eq)/sizeof(char);
	for(i = 0;i < size;i++){
		if((*str == multi_eq[i]) && (*(str+1) == '=')){
			*flag = false;
			return true;
		}
	}
	
	//Is multi symbol? (<<,>>,&&,||,++,--)
	size = sizeof(multi_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i]){
			*flag = false;
			return true;
		}
	}

	//Is single symbol? (+,-,*,/,%,<,>,')
	size = sizeof(single_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == single_symbol[i]){
			*flag = true;
			return true;
		}
	}

	return false;
}

Token *new_token(TokenKind kind, Token *cur, char *str){
	Token *new = calloc(1, sizeof(Token));
	new->kind = kind;
	//Remaining characters
	new->str = str;
	new->len = 1;
	cur->next = new;
	return new;
}

bool consume_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind){
	if(strncmp(*p, str, len) !=  0 || is_alnum((*p)[len])){
		return false;
	}

	*now = new_token(tk_kind, *now, *p);
	(*now)->len = len;
	(*now)->str = *p;
	*p += len;

	return true;
}

Token *tokenize(char *p){
	bool is_single_token;
	Token head;
	head.next = NULL;

	//set head pointer to cur
	Token *now = &head;

	while(*p){
		if(isspace(*p)){
			p++;
			continue;
		}

		if((*p == '/') && (*(p+1) == '/')){
			while(*p != '\n') p++;
			continue;
		}

		if((*p == '/') && (*(p+1) == '*')){
			while(!((*(p-1) == '*') && (*p == '/'))) p++;
			p++;
			continue;
		}

		//judge single token or multi token or isn't token
		if(issymbol(p, &is_single_token)){
			now = new_token(TK_RESERVED, now, p);
			if(is_single_token){
				p++;
			}else{
				p += 2;
				now->len = 2;
			}
			continue;
		}

		if(consume_reserved(&p, "int",	  3, &now, TK_TYPE))	continue;
		if(consume_reserved(&p, "char",   4, &now, TK_TYPE))	continue;
		if(consume_reserved(&p, "struct", 5, &now, TK_TYPE))    continue;
		if(consume_reserved(&p, "if",	  2, &now, TK_IF))	continue;
		if(consume_reserved(&p, "else",	  4, &now, TK_ELSE))	continue;
		if(consume_reserved(&p, "for",	  3, &now, TK_FOR))	continue;
		if(consume_reserved(&p, "while",  5, &now, TK_WHILE))   continue;
		if(consume_reserved(&p, "sizeof", 6, &now, TK_SIZEOF))  continue;
		if(consume_reserved(&p, "return", 6, &now, TK_RETURN))  continue;

		//Is block? '{' or '}'
		if(isblock(p)){
			now = new_token(TK_BLOCK, now, p);
			now->len = 1;
			now->str = p;
			p++;
			continue;
		}

		//Is string?
		if(*p == '"'){
			p++;
			while(*p != '"') now = new_token(TK_STR, now, p++);
			p++;
			continue;
		}
		
		//Is number?
		if(isdigit(*p)){
			if(now->kind == TK_IDENT){
				now = new_token(TK_IDENT, now, p++);
				now->len = 1;
			}else{
				//add number token
				now = new_token(TK_NUM, now, p);
				//set number
				now->val = strtol(p, &p, 10);
			}
			continue;
		}

		//Is valiable?
		if(is_alnum(*p)){
			now = new_token(TK_IDENT, now, p++);
			now->len = 1;
			continue;
		}

		error_at(p, "cat not tokenize.");
	}

	//add EOF token
	new_token(TK_EOF, now, p);
	return head.next;
}
