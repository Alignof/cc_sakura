#include "cc_sakura.h"

// GVar *globals;
// char filename[100];

void error(char *loc, char *fmt, ...){
	va_list ap;
	va_start(ap, fmt);

	int pos = loc-user_input;
	fprintf(stderr, "%s\n", user_input);
	fprintf(stderr, "%*s", pos, "");
	fprintf(stderr, "^ ");
	vfprintf(stderr, fmt, ap);
	fprintf(stderr, "\n");
	exit(1);
}

void error_at(char *loc, char *msg){
	while((user_input < loc) && (loc[-1] == '\n' || loc[-1] == '\t')) loc--;

	char *start = loc;
	while((user_input < start) && (start[-1] != '\n')) start--;

	char *end = loc;
	while(*end != '\n') end++;

	int line_num = 1;
	for(char *c = user_input;c < loc;c++){
		if(*c == '\n') line_num++;
	}

	// consume \t
	while(*start == '\t') start++;

	int indent = fprintf(stderr, "%s:%d ", filename, line_num);
	fprintf(stderr, "%.*s\n", (int)(end-start), start);

	int pos = indent+loc-start;
	fprintf(stderr, "%*s", pos, "");
	fprintf(stderr, "^ %s\n", msg);
	exit(1);
}

bool check(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, token->len)){
		return false;
	}

	return true;
}

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, token->len)){
		return false;
	}

	token = token->next;
	return true;
}

int string_len(){
	int len = 0;
	while(token->kind == TK_STR){
		token = token->next;
		len++;
	}

	return len;
}

bool consume_ret(){
	if((token->kind != TK_RETURN) || (token->len != 6) ||
	    memcmp(token->str, "return", token->len)){
		return false;
	}

	token = token->next;
	return true;
}

bool consume_reserved_word(char *keyword, TokenKind kind){
	if( token->kind != kind ||
	    token->len != strlen(keyword) ||
	    memcmp(token->str, keyword, token->len)){
		return false;
	}

	token = token->next;
	return true;
}

Token *consume_string(){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_STR || !(isascii(*(token->str)))){
		return false;
	}

	Token *ret = token;
	int counter = 0;
	for(char *str = token->str;*str != '"';str++){
		counter++;
	}

	token->len = counter;

	//move next token 
	for(int i = 0;i < counter;i++){
		token = token->next;
	}

	return ret;
}


Token *consume_ident(){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||
	   !(is_alnum(*(token->str)))){
		return NULL;
	}

	Token *ret = token;
	//check variable length
	int _len = len_val(token->str);
	token->len = _len;

	//move next token 
	for(int i = 0;i < _len;i++){
		token = token->next;
	}

	return ret;
}

void expect(char *op){
	// judge whether op is a symbol and move the pointer to the next
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK)||
	    strlen(op) != token->len||
	    memcmp(token->str, op, token->len)){
		error_at(token->str, "not a charctor.");
	}
	token = token->next;
}

int expect_number(){
	// judge whether token is a number and move the pointer to the next and return value
	if(token->kind != TK_NUM){
		error_at(token->str, "not a number");
	}

	int val = token->val;
	token = token->next;
	return val;
}

Func *find_func(Token *tok){
	for (int i = 0;func_list[i] && i < FUNC_NUM;i++){
		if(!memcmp(tok->str, func_list[i]->name, tok->len)){
			return func_list[i];
		}
	}
	return NULL;
}

GVar *find_gvar(Token *tok){
	//while var not equal NULL
	for (GVar *var = globals;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
			return var;
		}
	}
	return NULL;
}

LVar *find_lvar(Token *tok){
	//while var not equal NULL
	for (LVar *var = locals;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
			return var;
		}
	}
	return NULL;
}

Str *find_string(Token *tok){
	for (Str *var = strings;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->str, var->len)){
			return var;
		}
	}
	return NULL;
}

Struc *find_struc(Token *tok){
	for (Struc *var = structs;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
			return var;
		}
	}
	return NULL;
}

Node *new_node(NodeKind kind, Node *lhs, Node *rhs){
	//create new node(symbol)
	Node *node = calloc(1, sizeof(Node));
	node->type = calloc(1, sizeof(Type));
	node->kind = kind;
	node->lhs  = lhs;
	node->rhs  = rhs;

	if(kind == ND_ADD || kind == ND_SUB){
		if(lhs->type->ty >= PTR  ||  rhs->type->ty >= PTR){
			node = pointer_calc(node, lhs->type, rhs->type);
		}
	}

	if(kind == ND_DEREF){
		if(rhs->type->ptr_to == NULL || rhs->type->ptr_to->ty != ARRAY){
			node->type = node->rhs->type->ptr_to;
		}else{
			free(node->type);
			free(node);
			rhs->type = rhs->type->ptr_to;
			return rhs;
		}
	}

	if(ND_ADD <= kind && kind <= ND_ASSIGN){
		node->type = (lhs->type->ty > rhs->type->ty)? lhs->type : rhs->type;
	}

	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_NUM;
	node->val  = val;
	node->type = calloc(1, sizeof(Type));
	node->type->ty = INT;
	return node;
}

