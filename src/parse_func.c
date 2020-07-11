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

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK)||
			strlen(op)!=token->len||
			memcmp(token->str,op,token->len))
		return false;
	token=token->next;
	return true;
}

bool consume_ret(){
	if(token->kind != TK_RETURN  || token->len!=6 ||
		memcmp(token->str,"return",token->len))
		return false;
	token=token->next;
	return true;
}

bool consume_reserved_word(char *keyword,TokenKind kind){
	if(	token->kind != kind ||
		token->len!=strlen(keyword)||
		memcmp(token->str,keyword,token->len))
		return false;
	token=token->next;
	return true;
}


Token *consume_ident(){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||
			!('a' <= *(token->str) && *(token->str) <= 'z'))
		return false;

	Token *ret=token;
	//check variable length
	int _len=len_val(token->str);
	token->len=_len;

	//move next token 
	for(int i=0;i<_len;i++)
		token=token->next;

	return ret;
}

void expect(char *op){
	// judge whether op is a symbol and move the pointer to the next
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK)||
			strlen(op)!=token->len||
			memcmp(token->str,op,token->len))
		error(token->str,"not a charctor.");
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

LVar *find_lvar(Token *tok){
	//while var not equal NULL
	for (LVar *var=locals;var;var=var->next){
		if(var->len==tok->len && !memcmp(tok->str,var->name,var->len))
			return var;
	}
	return NULL;
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

int type_size(TypeKind type){
	switch(type){
		case INT:
			return 4;
		case PTR:
			return 8;
		case ARRAY:
			return 8;
	}
}

