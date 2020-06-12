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
	if(token->kind != TK_RETURN ||
		token->len!=6||
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

Node *primary(){
	Node *tmp;

	if(consume("(")){
		//jmp expr
		Node *node=expr();
		//check end of caret
		expect(")");
		return node;
	}

	// variable
	Token *tok=consume_ident();
	if(tok){
		Node *node=calloc(1,sizeof(Node));
		//node->kind=ND_LVAR;

		LVar *lvar=find_lvar(tok);
		if(lvar){
			// variable exist
			node->kind=ND_LVAR;
			node->offset=lvar->offset;
			node->type=lvar->type;
		}else if(*(token->str)=='('){
			// function
			expect("(");

			node->kind=ND_CALL_FUNC;
			node->str=(char *)calloc(tok->len,sizeof(char));
			strncpy(node->str,tok->str,tok->len);
			
			// have argument?
			if(!(consume(")"))){
				tmp=node;
				while(token->kind == TK_NUM || token->kind ==TK_IDENT || TK_RESERVED){
					tmp->vector=equelity();
					tmp=tmp->vector;

					if(!(consume(",")))
						break;
				}
				tmp->vector=NULL;
				expect(")");
			}
		}else{
			//variable does not exist.
			error(token->str,"this variable is not declaration");
		}

		return node;
	}

	//return new num node
	return new_node_num(expect_number());
}

Node *unary(){
	Node *node;

	if(consume("*")){
		node=new_node(ND_DEREF,new_node_num(0),unary());
		if(node->rhs->type.ptr_to==NULL || node->rhs->type.ptr_to->ty==PTR)
			node->type.ty=PTR;

		return node;
	}

	if(consume("&")){
		node=new_node(ND_ADDRESS,new_node_num(0),unary());
		node->type.ty=PTR;

		return node;
	}


	if(consume("+"))
		//ignore +
		return primary();

	if(consume("-"))
		//convert 0-n
		return new_node(ND_SUB,new_node_num(0),primary());


	if(consume_reserved_word("sizeof",TK_SIZEOF)){
		// sizeof(5) => 4
		// sizeof(&a) => 8
		node=new_node(ND_NUM,node,unary());

		if(node->rhs->type.ty==INT)
			node->val=4;
		if(node->rhs->type.ty==PTR)
			node->val=8;

		return node;
	}

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
	int ptrtype;
	Node *pointer_size;

	//jmp mul()
	Node *node=mul();

	for(;;){
		if(consume("+")){
			node=new_node(ND_ADD,node,mul());

			if(node->lhs->type.ty==PTR || node->rhs->type.ty==PTR){
				node->type.ty=PTR;
				pointer_size=calloc(1,sizeof(Node));
				pointer_size->kind=ND_NUM;
	
				if(node->lhs->type.ty==PTR && node->lhs->type.ptr_to!=NULL)
					ptrtype=node->lhs->type.ptr_to->ty;
				if(node->rhs->type.ty==PTR && node->rhs->type.ptr_to!=NULL)
					ptrtype=node->rhs->type.ptr_to->ty;

				if(ptrtype==INT){
					// int pointer
					pointer_size->val=4;
				}else{
					// int pointer pointer ...
					pointer_size->val=8;
				}

				if(node->lhs->type.ty==PTR && node->lhs->type.ptr_to!=NULL)
					node->rhs=new_node(ND_MUL,node->rhs,pointer_size);
				if(node->rhs->type.ty==PTR && node->rhs->type.ptr_to!=NULL)
					node->lhs=new_node(ND_MUL,node->lhs,pointer_size);
			}
		}else if(consume("-")){
			node=new_node(ND_SUB,node,mul());
			
			if(node->lhs->type.ty==PTR || node->rhs->type.ty==PTR){
				node->type.ty=PTR;
				pointer_size=calloc(1,sizeof(Node));
				pointer_size->kind=ND_NUM;
	
				if(node->lhs->type.ty==PTR && node->lhs->type.ptr_to!=NULL)
					ptrtype=node->lhs->type.ptr_to->ty;
				if(node->rhs->type.ty==PTR && node->rhs->type.ptr_to!=NULL)
					ptrtype=node->rhs->type.ptr_to->ty;

				if(ptrtype==INT){
					// int pointer
					pointer_size->val=4;
				}else{
					// int pointer pointer ...
					pointer_size->val=8;
				}

				if(node->lhs->type.ty==PTR && node->lhs->type.ptr_to!=NULL)
					node->rhs=new_node(ND_MUL,node->rhs,pointer_size);
				if(node->rhs->type.ty==PTR && node->rhs->type.ptr_to!=NULL)
					node->lhs=new_node(ND_MUL,node->lhs,pointer_size);
			}
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

	if(consume("="))
		node=new_node(ND_ASSIGN,node,assign());

	return node;
}

Node *expr(){
	int i;
	Node *node;
	Type *newtype;
	int star_count=0;

	if(consume_reserved_word("int",TK_TYPE)){
		// count asterisk
		while(token->kind==TK_RESERVED && *(token->str)=='*'){
			star_count++;
			token=token->next;
		}

		// variable declaration
		Token *tok=consume_ident();
		if(tok){
			node=calloc(1,sizeof(Node));
			LVar *lvar=find_lvar(tok);

			if(lvar){
				error(token->str,"this variable has already existed.");
			}else{
				lvar=calloc(1,sizeof(LVar));
				lvar->next=locals;
				lvar->name=tok->str;
				lvar->len=tok->len;
				lvar_count++;

				// add type list
				newtype=&(lvar->type);
				for(i=0;i<star_count;i++){
					newtype->ty=PTR;
					newtype->ptr_to=calloc(1,sizeof(Type));
					newtype=newtype->ptr_to;
				}

				if(star_count==0) newtype->ptr_to=calloc(1,sizeof(Type));
				newtype->ty=INT;
			}
			
			if(locals)
				lvar->offset=locals->offset+8;
			else
				lvar->offset=8;
			
			node->kind=ND_LVAR;
			node->offset=lvar->offset;
			node->type=lvar->type;

			// locals == new lvar
			locals=lvar;
		}else{
			error(token->str,"not a variable.");
		}
	}else{
		node=assign();
	}

	return node;
}

Node *stmt(){
	Node *node=NULL;
	Node *tmp=NULL;

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
			node->rhs=stmt();
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
			node->rhs=stmt();
		}
	}else if(consume("{")){
		node=new_node(ND_BLOCK,node,NULL);
		
		Node *tmp=calloc(1,sizeof(Node));
		node->vector=tmp;
		while(token->kind!=TK_BLOCK){
			//Is first?
			if(tmp->vector){
				tmp=stmt();
			}else{
				tmp->vector=stmt();
				tmp=tmp->vector;
			}
		}
		expect("}");
	}else{
		node=expr();
		if(!consume(";"))
			error(token->str,"not a ';' token.");
	}

	return node;
}

void function(Func *func){
	int i=0;

	// while end of function block
	while(!consume("}"))
		func->code[i++]=stmt();

	func->lvarc=lvar_count;
	func->code[i]=NULL;
}

void program(){
	int i=0;
	int counter;
	Node *tmp;
	Node **args_ptr;

	while(!at_eof()){
		// reset lvar list
		locals=NULL;
		// reset lvar counter
		lvar_count=0;
		counter=0;
		func_list[i]=(Func *)malloc(sizeof(Func));

		// type of function return value
		if(!consume_reserved_word("int",TK_TYPE))
			error(token->str,"not a function type token.");

		// Is function?
		if(token->kind != TK_IDENT ||!('a' <= *(token->str) && *(token->str) <= 'z'))
			error(token->str,"not a function.");

		// get string len
		for(counter=0;(('a' <= token->str[counter] && token->str[counter] <= 'z') || ('0' <= token->str[counter] && token->str[counter] <= '9'));counter++)

		func_list[i]->name=(char *)calloc(counter,sizeof(char));
		strncpy(func_list[i]->name,token->str,counter);

		// consume function name
		while(('a' <= *(token->str) && *(token->str) <= 'z') || ('0' <= *(token->str) && *(token->str) <= '9'))
			token=token->next;

		// get argument
		expect("(");
		counter=0;
		if(!(consume(")"))){
			// set args node
			args_ptr=&(func_list[i]->args);
			tmp=*args_ptr;
			while(token->kind == TK_NUM || token->kind == TK_TYPE){
				*args_ptr=(Node *)calloc(1,sizeof(Node));
				(*args_ptr)->kind=ND_ARG;
				(*args_ptr)->val=counter;
				(*args_ptr)->vector=expr();
				(*args_ptr)->rhs=tmp;
				// go to next
				tmp=*args_ptr;

				counter++;

				if(!(consume(",")))
					break;
			}
			args_ptr=NULL;
			func_list[i]->args->val=counter-1;
			expect(")");
		}

		// get function block
		consume("{");
		function(func_list[i++]);
		consume("}");
	}
	func_list[i]=NULL;
}
