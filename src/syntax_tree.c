#include "cc_sakura.h"

int alloc_size;
Token *token;
Str *strings;
//LVar *locals;
//Func *func_list[100]; 

Node *data(void){
	if(consume("(")){
		Node *node = expr();
		expect(")");
		return node;
	}
	
	// compiler directive
	if(token->kind == TK_COMPILER_DIRECTIVE){
		Node *node = compiler_directive();
		return node;
	}

	// variable
	int INSIDE_FUNC = 0;
	Token *tok = consume_ident();
	if(tok){
		Node *node = calloc(1, sizeof(Node));

		LVar *lvar = find_lvar(tok, INSIDE_FUNC);
		if(lvar){
			node->kind   = (lvar->type->ty == ARRAY)? ND_LARRAY : ND_LVAR;
			node->offset = lvar->offset;
			node->type   = lvar->type;
		// call function
		}else if(check("(")){
			Func *called = find_func(tok);
			if(called){
				node->type = called->type;
			}else{
				node->type = calloc(1, sizeof(Type));
				node->type->ty = INT;
			}

			node = call_function(node, tok);
		}else{
			GVar *gvar = find_gvar(tok);
			if(gvar){
				// global variable exist
				node->kind = (gvar->type->ty == ARRAY)? ND_GARRAY : ND_GVAR;
				node->type = gvar->type;
				node->str  = tok->str;
				node->val  = tok->len;
			}else{
				Member *rator = find_enumerator(tok, INSIDE_FUNC);
				if(rator){
					node = new_node_num(rator->offset);
				// variable does not exist.
				}else{
					error_at(token->str, "this variable is not declaration");
				}
			}
		}

		return node;
	// return new num node
	}else if(token->kind == TK_NUM){
		return new_node_num(expect_number());
	}


	// NULL statement
	return new_node(ND_NULL_STMT, NULL, NULL);
}

Node *primary(void){
	Node *node = data();

	// Is array index
	while(consume("[")){
		node = array_index(node, add());
		expect("]");
	}

	// increment
	if(consume("++")){
		node = incdec(node, POST_INC);
	}

	// decrement
	if(consume("--")){
		node = incdec(node, POST_DEC);
	}

	// member variable
	while(check(".") || check("->")){
		// dot
		if(consume(".")){
			if(node->kind == ND_LVAR){
				node = new_node(ND_ADDRESS, NULL, node);
			}
			node = dot_arrow(ND_DOT, node);
		}

		// arrow
		if(consume("->")){
			node = dot_arrow(ND_ARROW, node);
		}

		// array index
		while(consume("[")){
			node = array_index(node, mul());
			expect("]");
		}
	}

	return node;
}

Node *unary(void){
	Node *node=NULL;

	// logical not
	if(consume("!")){
		node = new_node(ND_NOT, NULL, logical());
		return node;
	}

	if(consume("*")){
		node = new_node(ND_DEREF, NULL, unary());

		return node;
	}

	if(consume("&")){
		node = new_node(ND_ADDRESS, NULL, unary());

		return node;
	}

	if(token->kind == TK_STR){
		consume("\"");
		Node *node = calloc(1, sizeof(Node));
		node->kind = ND_STR;
		node->type = calloc(1, sizeof(Type));
		node->type->ty = PTR;

		Token *tok = consume_string();
		Str *fstr = find_string(tok);

		// has already
		if(fstr){
			node->str = fstr->str;
			node->val = fstr->label_num;
			node->offset = fstr->len;
		// new one
		}else{
			Str *new = calloc(1, sizeof(Str));
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

	if(consume("+")){
		//ignore +n
		return primary();
	}

	if(consume("-")){
		//convert to 0-n
		return new_node(ND_SUB, new_node_num(0), primary());
	}

	// increment
	if(consume("++")){
		return incdec(primary(), PRE_INC);
	}

	// decrement
	if(consume("--")){
		return incdec(primary(), PRE_DEC);
	}

	if(consume_reserved_word("sizeof", TK_SIZEOF)){
		// sizeof(5)  = > 4
		// sizeof(&a)  = > 8

		if(consume("(")){
			int INSIDE_FILE = 0;
			if(token->kind == TK_TYPE || find_defined_type(token, INSIDE_FILE)){
				Type *target_type = parse_type();
				node = new_node(ND_NUM, node, new_node_num(target_type->size));
				node->val = target_type->size;
			}else{
				Node *target = expr();
				node = new_node(ND_NUM, node, target);
				node->val = node->rhs->type->size;
			}
			expect(")");
		}

		return node;
	}

	return primary();
}

Node *mul(void){
	//jmp unary()
	Node *node = unary();

	for(;;){
		// is * and move the pointer next
		if(consume("*")){
			//create new node and jmp unary
			node = new_node(ND_MUL, node, unary());
		}else if(consume("/")){
			node = new_node(ND_DIV, node, unary());
		}else if(consume("%")){
			node = new_node(ND_MOD, node, unary());
		}else{
			return node;
		}
	}
}

Node *add(void){
	//jmp mul()
	Node *node = mul();

	for(;;){
		if(consume("+")){
			node = new_node(ND_ADD, node, mul());
		}else if(consume("-")){
			node = new_node(ND_SUB, node, mul());
		}else{
			return node;
		}
	}
}

Node *relational(void){
	Node *node = add();

	for(;;){
		//prefer multi symbol
		if(consume(">=")){
			node = new_node(ND_GE, node, add());
		}else if(consume("<=")){
			node = new_node(ND_LE, node, add());
		}else if(consume(">")){
			node = new_node(ND_GT, node, add());
		}else if(consume("<")){
			node = new_node(ND_LT, node, add());
		}else{
			return node;
		}
	}
}

Node *equelity(void){
	Node *node = relational();

	for(;;){
		if(consume("==")){
			node = new_node(ND_EQ, node, relational());
		}else if(consume("!=")){
			node = new_node(ND_NE, node, relational());
		}else{
			return node;
		}
	}
}

Node *logical(void){
	Node *node = equelity();
	for(;;){
		if(consume("&&")){
			node = new_node(ND_AND, node, equelity());
		}else if(consume("||")){
			node = new_node(ND_OR, node, equelity());
		}else{
			return node;
		}
	}
}

Node *ternary(void){
	Node *node = logical();
	if(consume("?")){
		//                          cond  if true
		node = new_node(ND_TERNARY, node, ternary());
		expect(":");
		//           if false
		node->next = ternary();
	}

	return node;
}

Node *assign(void){
	Node *node = ternary();

	if(consume("=")){
		node = new_node(ND_ASSIGN, node, assign());
	}else if(consume("+=")){
		node = compound_assign(ND_ADD, node, assign());
	}else if(consume("-=")){
		node = compound_assign(ND_SUB, node, assign());
	}else if(consume("*=")){
		node = compound_assign(ND_MUL, node, assign());
	}else if(consume("/=")){
		node = compound_assign(ND_DIV, node, assign());
	}


	return node;
}

Node *expr(void){
	int star_count   = 0;
	int INSIDE_SCOPE = 1;
	Node *node;

	if(token->kind == TK_TYPE || find_defined_type(token, INSIDE_SCOPE)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_LVAR;

		// parsing type
		node->type = parse_type();

		// only type (e.g. int; enum DIR{E,W,S,N}; ...) 
		if(check(";")){
			return node;
		}

		// variable declaration
		Token *tok = consume_ident();
		if(tok){
			int INSIDE_SCOPE = 1;
			// If enumerator already exist -> error
			find_enumerator(tok, INSIDE_SCOPE);
			node = declare_local_variable(node, tok, star_count);
		}else{
			error_at(token->str, "not a variable.");
		}

		// initialize formula
		if(consume("=")){
			if(consume("{")){
				node = array_block(node);
				//node->block_code = array_block(node);
			}else{
				node = init_formula(node, assign());
				//node->block_code = init_formula(node, assign());
			}
		}
	}else if(consume_reserved_word("break", TK_BREAK)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_BREAK;
	}else if(consume_reserved_word("continue", TK_CONTINUE)){
		node	   = calloc(1, sizeof(Node));
		node->kind = ND_CONTINUE;
	}else{
		node = assign();
	}

	return node;
}

Node *stmt(void){
	Node *node = NULL;

	if(consume_reserved_word("return", TK_RETURN)){
		node = new_node(ND_RETURN, node, NULL);
		if(!consume(";")){
			node->rhs = expr();
			if(!consume(";")) error_at(token->str, "not a ';' token.");
		}
	}else if(consume_reserved_word("if", TK_IF)){
		/*
		 * =========== if =========== 
		 *
		 *     (cond)<--if-->expr
		 *
		 * ========= else if =========== 
		 *
		 *     (cond)<--if-----+
		 *                     | 
		 *        if(cond)<--else-->expr
		 */
		node = new_node(ND_IF, node, NULL);
		if(consume("(")){
			//jmp expr
			Node *cond = expr();
			//check end of caret
			expect(")");

			// (cond)<-if->expr
			node->lhs = cond;
			node->rhs = stmt();
		}

		if(consume_reserved_word("else", TK_ELSE)){
			// if()~ <-else-> expr
			Node *else_block = new_node(ND_ELSE, node, stmt());
			else_block->lhs  = node->rhs;
			node->rhs  = else_block;
			node->kind = ND_IFELSE;
		}
 
 	}else if(consume_reserved_word("switch", TK_SWITCH)){
 		/*
 		 * default<---switch--->block code
 		 *               | 
 		 *               | (next)
 		 *               | 
 		 *   (cond)<---case->code
 		 *               | 
 		 *               | (next: chain_case)
 		 *               +----->case->case->... 
 		 */
 
 		Node  *cond = NULL;
		Label *before_switch = labels_tail;
		Label *prev = NULL;

 		node = new_node(ND_SWITCH, node, NULL);
 		if(consume("(")){
 			//jmp expr
 			cond = expr();
 			//check end of caret
 			expect(")");
 		}else{
 			error_at(token->str, "expected ‘(’ before ‘{’ token");
 		}

		// get code block 
		node->rhs = stmt(); 

		// register and remove case
		Node *cond_cases = NULL;
		prev = before_switch;
		Label *lb = (before_switch) ? prev->next : labels_head;
		while(lb){
			if(lb->kind == LB_CASE){
				if(cond_cases){
					cond_cases->next      = new_node(ND_EQ, cond, lb->cond);
					cond_cases->next->val = lb->id;
					cond_cases            = cond_cases->next;
				}else{
					cond_cases      = new_node(ND_EQ, cond, lb->cond);
					cond_cases->val = lb->id;
					node->next      = cond_cases;
				}
			}else if(lb->kind == LB_DEFAULT){
				if(node->lhs){
					error_at(token->str, "multiple default labels in one switch");
				}else{
					node->lhs      = lb->cond;
					node->lhs->val = lb->id;
				}
			}

			// remove used case
			if(prev){
				prev->next = lb->next;
				//free(lb);
				lb   = prev->next;
				prev = lb;
			// remove head
			}else{
				prev = lb;
				//free(prev);
				lb   = lb->next;
				prev = NULL;
			}
		}
	}else if(consume_reserved_word("case", TK_CASE)){
		/*
		 *  (cond) <--- case ---> code
		 */
		node = new_node(ND_CASE, logical(), NULL);
		expect(":");
		label_register(node, LB_CASE);
		node->rhs = stmt();
	}else if(consume_reserved_word("default", TK_DEFAULT)){
		/*
		 *  (cond) <--- default ---> code
		 */
		node = new_node(ND_CASE, NULL, NULL);
		expect(":");
		node->rhs = stmt();
		label_register(node, LB_DEFAULT);
	}else if(consume_reserved_word("for", TK_FOR)){
		outside_lvar   = locals;
		outside_enum   = enumerations;
		outside_struct = structs;
		
		node = new_node(ND_FOR, node, NULL);

		if(consume("(")){
			//jmp expr
			Node *init = expr();
			expect(";");
			Node *cond = expr();
			expect(";");
			Node *calc = expr();
			//check end of caret
			expect(")");

			// +-----------------------+
			// +-> (init->cond->loop)  +<-for->expr
			node->rhs = stmt();
			node->lhs = init;
			node->lhs->next = cond;
			node->lhs->next->next = calc;
		}

		locals       = outside_lvar; 
		enumerations = outside_enum; 
		structs      = outside_struct; 
	}else if(consume_reserved_word("do", TK_DO)){
		// (cond)<-- do-while -->block
		node = new_node(ND_DOWHILE, NULL, stmt());

		consume_reserved_word("while", TK_WHILE);
		if(consume("(")){
			node->lhs = expr();
			expect(")");
		}
		expect(";");
	}else if(consume_reserved_word("while", TK_WHILE)){
		node = new_node(ND_WHILE, node, NULL);
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
		node = new_node(ND_BLOCK, node, NULL);
		outside_lvar   = locals;
		outside_enum   = enumerations;
		outside_struct = structs;

		Node *block_code = calloc(1, sizeof(Node));
		while(token->kind!=TK_BLOCK){
			//Is first?
			if(node->block_code){
				block_code->block_code = stmt();
				block_code = block_code->block_code;
			}else{
				block_code = stmt();
				node->block_code = block_code;
			}
		}
		
		locals       = outside_lvar; 
		enumerations = outside_enum; 
		structs      = outside_struct; 
		expect("}");
	}else{
		node = expr();
		if(!consume(";")){
			while(*(token->str)!='\n') (token->str)--;
			error_at(token->str, "not a ';' token.");
		}
	}

	return node;
}

void function(Func *func){
	int i = 0;

	Def_Type *stash_def_types = defined_types;

	// while end of function block
	while(!consume("}")){
		func->code[i++] = stmt();
	}

	defined_types = stash_def_types;

	func->stack_size = alloc_size;
	func->code[i] = NULL;
}

void program(void){
	int func_index = 0;
	int star_count;
	Type *toplv_type;

	while(!at_eof()){
		// reset lvar list
		locals = NULL;
		// reset lvar counter
		alloc_size = 0;
		star_count = 0;

		// typedef
		if(consume_reserved_word("typedef", TK_TYPEDEF)){
			Type *specified_type   = parse_type();
			Token *def_name        = consume_ident();

			Def_Type *def_new_type = calloc(1, sizeof(Def_Type));
			def_new_type->name     = def_name->str;
			def_new_type->name_len = def_name->len;

			if(specified_type->ty == STRUCT){
				def_new_type->tag     = structs->name;
				def_new_type->tag_len = structs->len;
			}else if(specified_type->ty == ENUM){
				if(enumerations->name){
					def_new_type->tag     = enumerations->name;
					def_new_type->tag_len = enumerations->len;
				}else{
					enumerations->name    = def_name->str;
					enumerations->len     = def_name->len;
					def_new_type->tag     = def_name->str;
					def_new_type->tag_len = def_name->len;
				}
			}

			def_new_type->type = specified_type;
			def_new_type->next = defined_types;
			defined_types      = def_new_type;

			expect(";");
			continue;
		}

		// parsing type
		toplv_type = parse_type();

		// only type (e.g. int; enum DIR{E,W,S,N}; ...) 
		if(consume(";")){
			continue;
		}

		func_list[func_index] = (Func *)malloc(sizeof(Func));

		// Is function?
		if(token->kind != TK_IDENT ||!(is_alnum(*token->str))){
			error_at(token->str, "not a function.");
		}

		Token *def_name = consume_ident();

		// function
		if(consume("(")){
			func_list[func_index]->type = toplv_type;
			func_list[func_index]->name = calloc(def_name->len, sizeof(char));
			strncpy(func_list[func_index]->name, def_name->str, def_name->len);
			
			// add type list
			func_list[func_index]->type = insert_ptr_type(func_list[func_index]->type, star_count);

			// get arguments
			get_argument(func_index);

			// get function block
			consume("{");
			function(func_list[func_index++]);
			consume("}");
		// global variable
		}else{
			Node *init_gv = declare_global_variable(star_count, def_name, toplv_type);

			// initialize formula
			if(consume("=")){
				if(consume("{")){
					globals->init = array_block(init_gv);
				}else{
					globals->init = init_formula(init_gv, assign());
				}
			}else{
				if(init_gv->kind == ND_GVAR){
					globals->init = init_formula(init_gv, new_node_num(0));
				}
			}

			expect(";");
		}
	}
	func_list[func_index] = NULL;
}
