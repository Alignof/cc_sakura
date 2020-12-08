#include "cc_sakura.h"

int len_val(char *str){
	int counter = 0;
	for(;is_alnum(*str);str++){
		counter++;
	}

	return counter;
}

bool is_block(char c){
	return (c == '{') || (c == '}');
}

bool is_space(char c){
	return (c == ' ') || (c == '\t') || (c == '\n');
}

bool is_digit(char c){
	return	(('0' <=  c) && (c <=  '9'));
}

bool at_eof(void){
	return token->kind == TK_EOF;
}

bool is_alnum(char c){
	return	(('a' <=  c) && (c <=  'z')) ||
		(('A' <=  c) && (c <=  'Z')) ||
		(('0' <=  c) && (c <=  '9')) ||
		(c == '_');
}

bool is_symbol(char *str,  bool *single_flag){
     int i;
     int size;
     char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
     char repeat_symbol[] = "<>&|+-";
     char multi_symbol[]  = "->";
     char multi_eq[]      = "<=>!+*-/";
     
     //Is multi equal? (<=,==,!=,>=)
     size = sizeof(multi_eq)/sizeof(char);
     for(i = 0;i < size;i++){
     	if((*str == multi_eq[i]) && (*(str+1) == '=')){
     		*single_flag = false;
     		return true;
     	}
     }
     
     //Is repeat symbol? (<<,>>,&&,||,++,--)
     size = sizeof(repeat_symbol)/sizeof(char);
     for(i = 0;i < size;i++){
     	if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
     		*single_flag = false;
     		return true;
     	}
     }

     //Is multi symbol? (->)
     size = sizeof(multi_symbol)/sizeof(char)/2;
     for(i = 0;i < size;i += 2){
     	if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
     		*single_flag = false;
     		return true;
     	}
     }

     //Is single symbol? (+,-,*,/,%,<,>,',.)
     size = sizeof(single_symbol)/sizeof(char);
     for(i = 0;i < size;i++){
     	if(*str == single_symbol[i]){
     		*single_flag = true;
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

bool tokenize_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind){
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
		if(is_space(*p)){
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

		//Is character literal?
		if(*p == '\''){
			p++;// consume single quote
			if(*p == '\\'){
				p++;// consume back slash

				//Is NUL? (\0)
				if(*p == '0'){
					now = new_token(TK_NUM, now, p++);
					now->val = 0;
				//Is LF? (\n)
				}else if(*p == 'n'){
					now = new_token(TK_NUM, now, p++);
					now->val = 10;
				//Is HT? (\t)
				}else if(*p == 't'){
					now = new_token(TK_NUM, now, p++);
					now->val = 9;
				}else if(*p == '\\'){
					now = new_token(TK_NUM, now, p++);
					now->val = 92;
				}else if(*p == '\''){
					now = new_token(TK_NUM, now, p++);
					now->val = 39;
				}
			}else{
				now = new_token(TK_NUM, now, p);
				now->val = *p++;
			}
			// consume single quote
			p++;
			continue;
		}

		//Is number?
		if(is_digit(*p)){
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

		//judge single token or multi token or isn't token
		if(is_symbol(p, &is_single_token)){
			now = new_token(TK_RESERVED, now, p);
			if(is_single_token){
				p++;
			}else{
				p += 2;
				now->len = 2;
			}
			continue;
		}

		if(tokenize_reserved(&p, "void",     4, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "_Bool",    5, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "char",     4, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "int",	     3, &now, TK_TYPE))	    continue;
		if(tokenize_reserved(&p, "struct",   6, &now, TK_TYPE))     continue;
		if(tokenize_reserved(&p, "enum",     4, &now, TK_TYPE))     continue;
		if(tokenize_reserved(&p, "if",	     2, &now, TK_IF))	    continue;
		if(tokenize_reserved(&p, "else",     4, &now, TK_ELSE))	    continue;
		if(tokenize_reserved(&p, "switch",   6, &now, TK_SWITCH))   continue;
		if(tokenize_reserved(&p, "case",     4, &now, TK_CASE))	    continue;
		if(tokenize_reserved(&p, "default",  7, &now, TK_DEFAULT))  continue;
		if(tokenize_reserved(&p, "for",	     3, &now, TK_FOR))	    continue;
		if(tokenize_reserved(&p, "do",	     2, &now, TK_DO))       continue;
		if(tokenize_reserved(&p, "while",    5, &now, TK_WHILE))    continue;
		if(tokenize_reserved(&p, "break",    5, &now, TK_BREAK))    continue;
		if(tokenize_reserved(&p, "continue", 8, &now, TK_CONTINUE)) continue;
		if(tokenize_reserved(&p, "sizeof",   6, &now, TK_SIZEOF))   continue;
		if(tokenize_reserved(&p, "typedef",  7, &now, TK_TYPEDEF))  continue;
		if(tokenize_reserved(&p, "extern",   6, &now, TK_EXTERN))   continue;
		if(tokenize_reserved(&p, "return",   6, &now, TK_RETURN))   continue;
		if(tokenize_reserved(&p, "_Thread_local", 13, &now, TK_THREAD_LOCAL)) continue;

		// compiler directive
		if(tokenize_reserved(&p, "__NULL",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
		//if(tokenize_reserved(&p, "define",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
		//if(tokenize_reserved(&p, "include",  7, &now, TK_COMPILER_DIRECTIVE)) continue;


		//Is block? '{' or '}'
		if(is_block(*p)){
			now = new_token(TK_BLOCK, now, p);
			now->len = 1;
			now->str = p;
			p++;
			continue;
		}

		//Is string?
		if(*p == '"'){
			p++;
			while(!(*(p-1) != '\\' && *p == '"')){
				now = new_token(TK_STR, now, p++);
			}
			p++;
			continue;
		}

		//Is escape?
		if(*p == '\\' && *(p+1) == '\\'){
			now = new_token(TK_IDENT, now, p++);
			p++;
			continue;
		}
		
		//Is valiable?
		if(is_alnum(*p)){
			while(is_alnum(*p)){
				now = new_token(TK_IDENT, now, p++);
				now->len = 1;
			}
			continue;
		}

		error_at(p, "can not tokenize.");
	}

	//add EOF token
	new_token(TK_EOF, now, p);
	return head.next;
}
