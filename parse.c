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
	char single_tokens[]="+-*/()<>=;";
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


bool at_eof(){
	return token->kind==TK_EOF;
}

int is_alnum(char c){
	return ('a'<=c && c<='z')||
	('A'<=c && c<='Z')||
	('0'<=c && c<='9')||
	(c=='_');
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

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if(token->kind != TK_RESERVED ||
		strlen(op)!=token->len||
		memcmp(token->str,op,token->len))
		return false;
	token=token->next;
	return true;
}

bool consume_ret(){
	if(token->kind != TK_RETURN ||
		token->len!=6||
		memcmp(token->str,"return",token->len))
		return false;
	token=token->next;
	return true;
}

bool consume_reserved_word(char *keyword,TokenKind kind){
	if(token->kind != kind ||
		token->len!=strlen(keyword)||
		memcmp(token->str,keyword,token->len))
		return false;
	token=token->next;
	return true;
}


int len_val(char *str){
	int counter;
	for(counter=0;('a' <= *str && *str <= 'z');str++)
		counter++;
	return counter;
}

Token *consume_ident(){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||
		!('a' <= *(token->str) && *(token->str) <= 'z'))
		return false;
	
	Token *ret=token;
	//check variable length
	int _len=len_val(token->str);
	
	//move next token 
	for(int i=0;i<_len;i++)
		token=token->next;

	return ret;
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

Node *primary(){
	if(consume("(")){
		//jmp expr
		Node *node=expr();
		//check end of caret
		expect(")");
		return node;
	}

	Token *tok=consume_ident();
	if(tok){
		Node *node=calloc(1,sizeof(Node));
		node->kind=ND_LVAR;

		LVar *lvar=find_lvar(tok);
		if(lvar){
			//variable exist
			node->offset=lvar->offset;
		}else{
			//variable does not exist.
			lvar=calloc(1,sizeof(LVar));
			lvar->next=locals;
			lvar->name=tok->str;
			lvar->len=tok->len;
			
			if(locals){
				lvar->offset=locals->offset+8;
			}else{
				lvar->offset=0;
			}
			node->offset=lvar->offset;
			//locals == head of list
			locals=lvar;
		}
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

Node *equelity(){
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

Node *assign(){
	Node *node=equelity();

	if(consume("=")){
		node=new_node(ND_ASSIGN,node,assign());
	}else{
		return node;
	}
}

Node *expr(){
	Node *node=assign();
	return node;
}

Node *stmt(){
	Node *node;
	Node *tmp;

	if(consume_reserved_word("return",TK_RETURN)){
		node=new_node(ND_RETURN,node,expr());
		if(!consume(";")){
			error(token->str,"not a ';' token.");
		}
	}else if(consume_reserved_word("if",TK_IF)){
		node=new_node(ND_IF,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *tmp=expr();
			//check end of caret
			expect(")");

			// (cond)if expr
			node->lhs=tmp;
			node->rhs=expr();
			if(!consume(";"))
				error(token->str,"not a ';' token.");
		}

		if(consume_reserved_word("else",TK_ELSE)){
			tmp=new_node(ND_ELSE,node,stmt());
			tmp->lhs=node->rhs;
			node->rhs=tmp;
			node->kind=ND_IFELSE;
		}
	}else if(consume_reserved_word("while",TK_WHILE)){
		node=new_node(ND_WHILE,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *tmp=expr();
			//check end of caret
			expect(")");

			// (cond)if expr
			node->lhs=tmp;
			node->rhs=expr();
			if(!consume(";"))
				error(token->str,"not a ';' token.");
		}
	}else{
		node=expr();
		if(!consume(";"))
			error(token->str,"not a ';' token.");
	}

	return node;
}

void program(){
	int i=0;
	while(!at_eof())
		code[i++]=stmt();
	code[i]=NULL;
}

