#include "cc_sakura.h"

int alloc_size;
Token *token;
LVar *locals;
Str *strings;
// Func *func_list[100];

Node *primary(){
	if(consume("(")){
		//jmp expr
		Node *node = expr();
		//check end of caret
		expect(")");
		return node;
	}

	// variable
	Token *tok = consume_ident();
	if(tok){
		Node *node = calloc(1,sizeof(Node));

		LVar *lvar = find_lvar(tok);
		if(lvar){
			node->kind = (lvar->type.ty == ARRAY)? ND_LARRAY : ND_LVAR;
			node->offset = lvar->offset;
			node->type = lvar->type;
		// call function
		}else if(*(token->str) == '('){
			node = call_function(node,tok);
		}else{
			GVar *gvar = find_gvar(tok);
			if(gvar){
				// global variable exist
				node->kind = (gvar->type.ty == ARRAY)? ND_GARRAY : ND_GVAR;
				node->type = gvar->type;
				node->str = tok->str;
				node->val = tok->len;
			}else{
				//variable does not exist.
				error_at(token->str,"this variable is not declaration");
			}
		}

		// Is array index
		if(consume("[")){
			node = array_index(node,mul());
			expect("]");
		}

		// increment/decrement
		if(consume("++") || consume("--"))
			error_at(token->str,"Unimplemented.");

		return node;
	}

	//return new num node
	return new_node_num(expect_number());
}

Node *unary(){
	Node *node=NULL;
	Type *rhs_ptr_to;

	if(consume("*")){
		node = new_node(ND_DEREF,new_node_num(0),unary());
		rhs_ptr_to = node->rhs->type.ptr_to;

		if(rhs_ptr_to == NULL || type_size(rhs_ptr_to->ty) == 8)
			node->type.ty = PTR;

		return node;
	}

	if(consume("&")){
		node = new_node(ND_ADDRESS,NULL,unary());
		node->type.ty = PTR;

		return node;
	}

	if(token->kind == TK_STR){
		consume("\"");
		Node *node = calloc(1,sizeof(Node));
		node->kind = ND_STR;
		node->type.ty = PTR;

		Token *tok = consume_string();
		Str *fstr = find_string(tok);

		// has already
		if(fstr){
			node->str = fstr->str;
			node->val = fstr->label_num;
			node->offset = fstr->len;
		// new one
		}else{
			Str *new = calloc(1,sizeof(Str));
			new->len = tok->len;
			new->str = tok->str;
			new->label_num = strings ? strings->label_num+1 : 0;
			node->str = new->str;
			node->offset = new->len;
			node->val = new->label_num;

			if(strings == NULL){
				strings = new;
			}else{
				new->next = strings;
				strings = new;
			}
		}

		return node;
	}

	if(consume("+"))
		//ignore +n
		return primary();

	if(consume("-"))
		//convert to 0-n
		return new_node(ND_SUB,new_node_num(0),primary());


	if(consume_reserved_word("sizeof",TK_SIZEOF)){
		// sizeof(5)  = > 4
		// sizeof(&a)  = > 8
		node = new_node(ND_NUM,node,unary());
		node->val = type_size(node->rhs->type.ty);

		return node;
	}

	return primary();
}

Node *mul(){
	//jmp unary()
	Node *node = unary();

	for(;;){
		// is * and move the pointer next
		if(consume("*")){
			//create new node and jmp unary
			node = new_node(ND_MUL,node,unary());
		}else if(consume("/")){
			node = new_node(ND_DIV,node,unary());
		}else if(consume("%")){
			node = new_node(ND_MOD,node,unary());
		}else{
			return node;
		}
	}
}

Node *add(){
	Type *lhs_type;
	Type *rhs_type;

	//jmp mul()
	Node *node = mul();

	for(;;){
		if(consume("+")){
			node = new_node(ND_ADD,node,mul());
			lhs_type = &(node->lhs->type);
			rhs_type = &(node->rhs->type);

			if(type_size(lhs_type->ty) == 8 || type_size(rhs_type->ty) == 8)
				node = pointer_calc(node,lhs_type,rhs_type);

		}else if(consume("-")){
			node = new_node(ND_SUB,node,mul());
			lhs_type = &(node->lhs->type);
			rhs_type = &(node->rhs->type);

			if(type_size(lhs_type->ty) == 8 || type_size(rhs_type->ty) == 8)
				node = pointer_calc(node,lhs_type,rhs_type);

		}else{
			return node;
		}
	}
}

Node *relational(){
	Node *node = add();

	for(;;){
		//prefer multi symbol
		if(consume("> = ")){
			node = new_node(ND_GE,node,add());
		}else if(consume("< = ")){
			node = new_node(ND_LE,node,add());
		}else if(consume(">")){
			node = new_node(ND_GT,node,add());
		}else if(consume("<")){
			node = new_node(ND_LT,node,add());
		}else{
			return node;
		}
	}
}

Node *equelity(){
	Node *node = relational();

	for(;;){
		if(consume("==")){
			node = new_node(ND_EQ,node,relational());
		}else if(consume("!=")){
			node = new_node(ND_NE,node,relational());
		}else{
			return node;
		}
	}
}

Node *logical(){
	Node *node = equelity();
	for(;;){
		if(consume("&&")){
			node = new_node(ND_AND,node,equelity());
		}else if(consume("||")){
			node = new_node(ND_OR,node,equelity());
		}else{
			return node;
		}
	}
}

Node *assign(){
	Node *node = logical();

	if(consume("="))
		node = new_node(ND_ASSIGN,node,assign());

	return node;
}

Node *expr(){
	int star_count = 0;
	Node *node;

	if(token->kind == TK_TYPE){
		node = calloc(1,sizeof(Node));
		node->kind = ND_LVAR;

		// check type
		if(consume_reserved_word("int",TK_TYPE)) node->type.ty = INT;
		else if(consume_reserved_word("char",TK_TYPE)) node->type.ty = CHAR;
		
		// count asterisk
		while(token->kind == TK_RESERVED && *(token->str) == '*'){
			star_count++;
			token = token->next;
		}

		// variable declaration
		Token *tok = consume_ident();
		if(tok)
			node = declare_local_variable(node,tok,star_count);
		else
			error_at(token->str,"not a variable.");

		// initialize formula
		if(consume("=")){
			if(consume("{"))
				node->vector = array_block(node);
			else
				node->vector = init_formula(node,assign());
		}
	}else{
		node = assign();
	}

	return node;
}

Node *stmt(){
	Node *node = NULL;

	if(consume_reserved_word("return",TK_RETURN)){
		node = new_node(ND_RETURN,node,expr());
		if(!consume(";"))
			error_at(token->str,"not a ';' token.");

	}else if(consume_reserved_word("if",TK_IF)){
		node = new_node(ND_IF,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *cond = expr();
			//check end of caret
			expect(")");

			// (cond)<-if->expr
			node->lhs = cond;
			node->rhs = stmt();
		}

		if(consume_reserved_word("else",TK_ELSE)){
			// if()~ <-else-> expr
			Node *else_block = new_node(ND_ELSE,node,stmt());
			else_block->lhs = node->rhs;
			node->rhs = else_block;
			node->kind = ND_IFELSE;
		}
	}else if(consume_reserved_word("for",TK_FOR)){
		node = new_node(ND_FOR,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *init = expr();
			expect(";");
			Node *cond = expr();
			expect(";");
			Node *calc = expr();
			//check end of caret
			expect(")");

			// +----------------------+
			// +-> (init->cond->calc) +<-for->expr
			node->rhs = stmt();
			node->lhs = init;
			node->lhs->vector = cond;
			node->lhs->vector->vector = calc;
		}
	}else if(consume_reserved_word("while",TK_WHILE)){
		node = new_node(ND_WHILE,node,NULL);
		if(consume("(")){
			//jmp expr
			Node *cond = expr();
			//check end of caret
			expect(")");

			// (cond)<-while->expr
			node->lhs = cond;
			node->rhs = stmt();
		}
	}else if(consume("{")){
		node = new_node(ND_BLOCK,node,NULL);

		Node *block_code = calloc(1,sizeof(Node));
		while(token->kind!=TK_BLOCK){
			//Is first?
			if(block_code->rhs){
				block_code->vector = stmt();
				block_code = block_code->vector;
			}else{
				block_code = stmt();
				node->vector = block_code;
			}
		}
		expect("}");
	}else{
		node = expr();
		if(!consume(";")){
			while(*(token->str)!='\n') (token->str)--;
			error_at(token->str,"not a ';' token.");
		}
	}

	return node;
}

void function(Func *func){
	int i = 0;

	// while end of function block
	while(!consume("}"))
		func->code[i++] = stmt();

	func->stack_size = alloc_size;
	func->code[i] = NULL;
}

void program(){
	int func_index = 0;
	int star_count;
	Type toplv_type;
	toplv_type = (Type){0};

	while(!at_eof()){
		// reset lvar list
		locals = NULL;
		// reset lvar counter
		alloc_size = 0;
		star_count = 0;
		func_list[func_index] = (Func *)malloc(sizeof(Func));

		// type of function return value
		if(token->kind == TK_TYPE){
			if(consume_reserved_word("int",TK_TYPE))	toplv_type.ty = INT;
			else if(consume_reserved_word("char",TK_TYPE))  toplv_type.ty = CHAR;
			else error_at(token->str,"not a function type token.");
		}

		// count asterisk
		while(token->kind == TK_RESERVED && *(token->str) == '*'){
			star_count++;
			token = token->next;
		}


		// Is function?
		if(token->kind != TK_IDENT ||!(is_alnum(*token->str)))
			error_at(token->str,"not a function.");

		Token *def_name = consume_ident();

		// function
		if(consume("(")){
			func_list[func_index]->type = toplv_type;
			func_list[func_index]->name = (char *)calloc(def_name->len,sizeof(char));
			strncpy(func_list[func_index]->name,def_name->str,def_name->len);
			
			// get arguments
			get_argument(func_index);

			// get function block
			consume("{");
			function(func_list[func_index++]);
			consume("}");

		// global variable
		}else{
			Node *init_gv = declare_global_variable(star_count,def_name,toplv_type);

			// initialize formula
			if(consume("=")){
				if(consume("{"))
					globals->init = array_block(init_gv);
				else
					globals->init = init_formula(init_gv,assign());
			}else{
				if(init_gv->kind == ND_GVAR)
					globals->init = init_formula(init_gv,new_node_num(0));
			}

			expect(";");
		}
	}
	func_list[func_index] = NULL;
}
