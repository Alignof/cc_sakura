#include "cc_sakura.h"

MacroTable *macros;

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

bool is_directive(char c) {
    return c == '#';
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

bool is_ascii(char c){
	return 0 <= c && c <= 127;
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

Token *is_macro(char *p, int len) {
	//while var not equal NULL
	for (MacroTable *macro = macros; macro; macro = macro->next) {
		if(macro->len == len && strncmp(p, macro->name, len) == 0) {
			return macro->code;
		}
	}

    return NULL;
}

bool consume_keyword(char **p, char *str, int len) {
	if(strncmp(*p, str, (size_t)len) != 0){
		return false;
	}

    *p += len;
    return true;
}

Token *new_token(TokenKind kind, Token *cur, char *str){
	Token *new = calloc(1, sizeof(Token));
	new->kind = kind;
	//Remaining characters
	new->str = str;
	new->len = 1;
    if (cur == NULL) {
        cur = new;
    } else {
	    cur->next = new;
    }
	return new;
}

bool tokenize_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind){
	if(strncmp(*p, str, (size_t)len) !=  0 || is_alnum((*p)[len])){
		return false;
	}

	*now = new_token(tk_kind, *now, *p);
	(*now)->len = len;
	(*now)->str = *p;
	*p += len;

	return true;
}

void register_macro(char **p) {
    MacroTable *new_macro = calloc(1, sizeof(MacroTable));
    new_macro->code = NULL;
    new_macro->name = *p;
    while(**p != ' ') (*p)++;
    new_macro->len = *p - new_macro->name;

    while(**p == ' ') (*p)++; // skip space

	Token *code = NULL;
    while(**p != '\n') {
        code = tokenize(p, code);
        if (new_macro->code == NULL) new_macro->code = code;
    }

    if (macros == NULL) {
        macros = new_macro;
    } else {
        new_macro->next = macros;
        macros = new_macro;
    }
}

Token *tokenize(char **p, Token *now){
	bool is_single_token;

    if(is_space(**p)){
        (*p)++;
        return now;
    }

    if((**p == '/') && (*(*p+1) == '/')){
        while(**p != '\n') (*p)++;
        return now;
    }

    if((**p == '/') && (*(*p+1) == '*')){
        *p += 3;
        while(!((*(*p-1) == '*') && (**p == '/'))) (*p)++;
        (*p)++;
        return now;
    }

    //Is character literal?
    if(**p == '\''){
        (*p)++;// consume single quote
        if(**p == '\\'){
            (*p)++;// consume back slash

            if(**p == '0'){ // Is NUL? (\0)
                now = new_token(TK_NUM, now, (*p)++);
                now->val = 0;
            }else if(**p == 'n'){ // Is LF? (\n)
                now = new_token(TK_NUM, now, (*p)++);
                now->val = 10;
            }else if(**p == 't'){ // Is HT? (\t)
                now = new_token(TK_NUM, now, (*p)++);
                now->val = 9;
            }else if(**p == '\\'){
                now = new_token(TK_NUM, now, (*p)++);
                now->val = 92;
            }else if(**p == '\''){
                now = new_token(TK_NUM, now, (*p)++);
                now->val = 39;
            }
        }else{
            now = new_token(TK_NUM, now, *p);
            now->val = *(*p)++;
        }
        // consume single quote
        (*p)++;
        return now;
    }

    // Is number?
    if(is_digit(**p)){
        // add number token
        now = new_token(TK_NUM, now, *p);
        // set number
        now->val = strtol(*p, p, 10);
        return now;
    }

    //judge single token or multi token or isn't token
    if(is_symbol(*p, &is_single_token)){
        now = new_token(TK_RESERVED, now, *p);
        if(is_single_token){
            (*p)++;
        }else{
            *p += 2;
            now->len = 2;
        }
        return now;
    }

    if(tokenize_reserved(p, "void",     4, &now, TK_TYPE))	   return now;
    if(tokenize_reserved(p, "_Bool",    5, &now, TK_TYPE))	   return now;
    if(tokenize_reserved(p, "char",     4, &now, TK_TYPE))	   return now;
    if(tokenize_reserved(p, "int",	    3, &now, TK_TYPE))	   return now;
    if(tokenize_reserved(p, "long",     4, &now, TK_TYPE))     return now;
    if(tokenize_reserved(p, "struct",   6, &now, TK_TYPE))     return now;
    if(tokenize_reserved(p, "enum",     4, &now, TK_TYPE))     return now;
    if(tokenize_reserved(p, "if",	    2, &now, TK_IF))	   return now;
    if(tokenize_reserved(p, "else",     4, &now, TK_ELSE))	   return now;
    if(tokenize_reserved(p, "switch",   6, &now, TK_SWITCH))   return now;
    if(tokenize_reserved(p, "case",     4, &now, TK_CASE))	   return now;
    if(tokenize_reserved(p, "default",  7, &now, TK_DEFAULT))  return now;
    if(tokenize_reserved(p, "for",	    3, &now, TK_FOR))	   return now;
    if(tokenize_reserved(p, "do",	    2, &now, TK_DO))       return now;
    if(tokenize_reserved(p, "while",    5, &now, TK_WHILE))    return now;
    if(tokenize_reserved(p, "break",    5, &now, TK_BREAK))    return now;
    if(tokenize_reserved(p, "continue", 8, &now, TK_CONTINUE)) return now;
    if(tokenize_reserved(p, "sizeof",   6, &now, TK_SIZEOF))   return now;
    if(tokenize_reserved(p, "_Alignof", 8, &now, TK_ALIGNOF))  return now;
    if(tokenize_reserved(p, "typedef",  7, &now, TK_TYPEDEF))  return now;
    if(tokenize_reserved(p, "return",   6, &now, TK_RETURN))   return now;
    if(tokenize_reserved(p, "extern",   6, &now, TK_EXTERN))   return now;
    if(tokenize_reserved(p, "const",    5, &now, TK_CONST))    return now;
    if(tokenize_reserved(p, "_Thread_local", 13, &now, TK_THREAD_LOCAL)) return now;

    if (is_directive(**p)) {
        (*p)++;
        if(consume_keyword(p, "include", 7)) {
            // ignore this line
            while(**p != '\n') (*p)++;
            (*p)++;
            return now;
        }
        if(consume_keyword(p, "define", 6)) {
            while(!is_space(**p)) (*p)++;
            (*p)++;
            register_macro(p);
            return now;
        }
    }


    //Is block? '{' or '}'
    if(is_block(**p)){
        now = new_token(TK_BLOCK, now, *p);
        now->len = 1;
        now->str = *p;
        (*p)++;
        return now;
    }

    //Is string?
    if(**p == '"'){
        now = new_token(TK_RESERVED, now, (*p)++);
        while(!(*(*p-1) != '\\' && **p == '"')){
            now = new_token(TK_STR, now, (*p)++);
        }
        now = new_token(TK_RESERVED, now, (*p)++);
        return now;
    }

    //Is escape?
    if(**p == '\\' && *(*p+1) == '\\'){
        now = new_token(TK_IDENT, now, (*p)++);
        (*p)++;
        return now;
    }

    //Is valiable or macro?
    if(is_alnum(**p)){
        char *tmp = *p;
        Token *macro_tok = NULL;

        while(is_alnum(**p)) (*p)++;
        if (macro_tok = is_macro(tmp, *p - tmp)) {
            while (macro_tok != NULL) {
                if (now == NULL) {
                    now = calloc(1, sizeof(Token));
                    memcpy(now, macro_tok, sizeof(Token));
                    macro_tok = macro_tok->next;
                } else {
                    now->next = calloc(1, sizeof(Token));
                    memcpy(now->next, macro_tok, sizeof(Token));
                    now = now->next;
                    macro_tok = macro_tok->next;
                }
            }
        } else {
            now = new_token(TK_IDENT, now, tmp);
            now->len = *p - tmp;
        }
        return now;
    }

    error_at(*p, "can not tokenize.");
}

Token *tokenize_main(char *p){
	Token *head = NULL;
	Token *now = NULL;

	while(*p){
        now = tokenize(&p, now);
        if (head == NULL) head = now;
	}

	//add EOF token
	new_token(TK_EOF, now, p);
	return head;
}
