#include "cc_sakura.h"

Node *primary(){
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

		LVar *lvar=find_lvar(tok);
		if(lvar){
			// variable exist
			node->kind=ND_LVAR;
			node->offset=lvar->offset;
			node->type=lvar->type;
		// call function
		}else if(*(token->str)=='('){
			node=call_function(node,tok);
		}else{
			GVar *gvar=find_gvar(tok);
			if(gvar){
				// variable exist
				node->kind=ND_GVAR;
				node->type=gvar->type;
				node->str=tok->str;
				node->val=tok->len;
			}else{
				//variable does not exist.
				error(token->str,"this variable is not declaration");
			}
		}

		if(*(token->str)=='[')
			node=array_index(node);

		return node;
	}

	//return new num node
	return new_node_num(expect_number());
}

Node *unary(){
	Node *node;
	Type *rhs_ptr_to;

	if(consume("*")){
		node=new_node(ND_DEREF,new_node_num(0),unary());
		rhs_ptr_to=node->rhs->type.ptr_to;

		if(rhs_ptr_to==NULL || type_size(rhs_ptr_to->ty)==8)
			node->type.ty=PTR;

		return node;
	}

	if(consume("&")){
		node=new_node(ND_ADDRESS,new_node_num(0),unary());
		node->type.ty=PTR;

		return node;
	}


	if(consume("+"))
		//ignore +n
		return primary();

	if(consume("-"))
		//convert to 0-n
		return new_node(ND_SUB,new_node_num(0),primary());


	if(consume_reserved_word("sizeof",TK_SIZEOF)){
		// sizeof(5) => 4
		// sizeof(&a) => 8
		node=new_node(ND_NUM,node,unary());
		node->val=type_size(node->rhs->type.ty);

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
	Type *lhs_type;
	Type *rhs_type;

	//jmp mul()
	Node *node=mul();

	for(;;){
		if(consume("+")){
			node=new_node(ND_ADD,node,mul());
			lhs_type=&(node->lhs->type);
			rhs_type=&(node->rhs->type);

			if(type_size(lhs_type->ty)!=4 || type_size(rhs_type->ty)!=4)
				node=pointer_calc(node,lhs_type,rhs_type);

		}else if(consume("-")){
			node=new_node(ND_SUB,node,mul());
			lhs_type=&(node->lhs->type);
			rhs_type=&(node->rhs->type);

			if(type_size(lhs_type->ty)==8 || type_size(rhs_type->ty)==8)
				node=pointer_calc(node,lhs_type,rhs_type);

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
	int star_count=0;
	Node *node;

	if(token->kind==TK_TYPE){
		node=calloc(1,sizeof(Node));
		node->kind=ND_LVAR;

		// check type
		if(consume_reserved_word("int",TK_TYPE)) node->type.ty=INT;
		else if(consume_reserved_word("char",TK_TYPE)) node->type.ty=CHAR;
		
		// count asterisk
		while(token->kind==TK_RESERVED && *(token->str)=='*'){
			star_count++;
			token=token->next;
		}

		// variable declaration
		Token *tok=consume_ident();
		if(tok)
			node=declare_local_variable(node,tok,star_count);
		else
			error(token->str,"not a variable.");
	}else{
		node=assign();
	}

	return node;
}

Node *stmt(){
	Node *node=NULL;

	if(consume_reserved_word("return",TK_RETURN)){
		node=new_node(ND_RETURN,node,expr());
		if(!consume(";"))
			error(token->str,"not a ';' token.");

	}else if(consume_reserved_word("if",TK_IF)){
		node=new_node(ND_IF,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *cond=expr();
			//check end of caret
			expect(")");

			// (cond)<-if->expr
			node->lhs=cond;
			node->rhs=stmt();
		}

		if(consume_reserved_word("else",TK_ELSE)){
			// if()~ <-else-> expr
			Node *else_block=new_node(ND_ELSE,node,stmt());
			else_block->lhs=node->rhs;
			node->rhs=else_block;
			node->kind=ND_IFELSE;
		}
	}else if(consume_reserved_word("while",TK_WHILE)){
		node=new_node(ND_WHILE,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *cond=expr();
			//check end of caret
			expect(")");

			// (cond)<-while->expr
			node->lhs=cond;
			node->rhs=stmt();
		}
	}else if(consume("{")){
		node=new_node(ND_BLOCK,node,NULL);

		Node *block_code=calloc(1,sizeof(Node));
		node->vector=block_code;
		while(token->kind!=TK_BLOCK){
			//Is first?
			if(block_code->vector){
				block_code=stmt();
			}else{
				block_code->vector=stmt();
				block_code=block_code->vector;
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
	int func_index=0;
	int star_count;

	while(!at_eof()){
		// reset lvar list
		locals=NULL;
		// reset lvar counter
		lvar_count=0;
		star_count=0;
		func_list[func_index]=(Func *)malloc(sizeof(Func));

		// type of function return value
		if(token->kind==TK_TYPE){
			if(consume_reserved_word("int",TK_TYPE))	func_list[func_index]->type.ty=INT;
			else if(consume_reserved_word("char",TK_TYPE))  func_list[func_index]->type.ty=CHAR;
			else error(token->str,"not a function type token.");
		}

		// count asterisk
		while(token->kind==TK_RESERVED && *(token->str)=='*'){
			star_count++;
			token=token->next;
		}

		if(star_count)
			func_list[func_index]->type.ty=PTR;


		// Is function?
		if(token->kind != TK_IDENT ||!('a' <= *(token->str) && *(token->str) <= 'z'))
			error(token->str,"not a function.");

		Token *def_name=consume_ident();

		// function
		if(consume("(")){
			func_list[func_index]->name=(char *)calloc(def_name->len,sizeof(char));
			strncpy(func_list[func_index]->name,def_name->str,def_name->len);
			
			// get arguments
			get_argument(func_index);

			// get function block
			consume("{");
			function(func_list[func_index++]);
			consume("}");

		// global variable
		}else{
			declare_global_variable(star_count,def_name);
		}
	}
	func_list[func_index]=NULL;
}
