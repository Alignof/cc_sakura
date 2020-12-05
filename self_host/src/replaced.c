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
