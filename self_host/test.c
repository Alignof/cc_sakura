typedef enum{
	TK_TYPE,
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_IF,
	TK_ELSE,
	TK_SWITCH,
	TK_CASE,
	TK_DEFAULT,
	TK_DO,
	TK_WHILE,
	TK_FOR,
	TK_SIZEOF,
	TK_BLOCK,
	TK_STR,
	TK_BREAK,
	TK_CONTINUE,
	TK_TYPEDEF,
	TK_RETURN,
	TK_EOF,
	TK_COMPILER_DIRECTIVE,
}TokenKind;

typedef enum{
	// lhs <-- symbol --> rhs
	ND_ADD, 	//  +
	ND_SUB, 	//  -
	ND_MUL, 	//  *
	ND_DIV, 	//  /
	ND_MOD, 	//  %
	ND_GT, 		//  >
	ND_GE, 		//  >=
	ND_LT, 		//  <
	ND_LE, 		//  <=
	ND_EQ, 		//  ==
	ND_NE, 		//  !=
	ND_AND, 	//  &&
	ND_OR, 		//  ||
	ND_ASSIGN, 	//  =
	ND_COMPOUND, 	//  +=, -=, *=, /=

	// symbol --> rhs
	ND_POSTID, 	//  a++, a--
	ND_DOT,		//  struc.member
	ND_ARROW,	//  struc_ptr->member

	// lhs <-- symbol
	ND_PREID, 	//  ++a, --a
	ND_NOT, 	//  !a
	ND_ADDRESS, 	//  &a
	ND_DEREF, 	//  *a

	// other
	ND_LVAR, 	//  local variable
	ND_GVAR, 	//  global variable
	ND_LARRAY, 	//  local array
	ND_GARRAY, 	//  global array
	ND_STR, 	//  "string"
	ND_NUM, 	//  integer
	ND_TERNARY,	//  cond ? if_true : if_false
	ND_IF, 		//  if
	ND_ELSE, 	//  else
	ND_IFELSE, 	//  if-else
	ND_SWITCH, 	//  switch
	ND_CASE, 	//  case or default
	ND_WHILE, 	//  while
	ND_DOWHILE, 	//  do-while
	ND_FOR, 	//  for
	ND_BLOCK, 	//  {}
	ND_ARG, 	//  function argument;
	ND_CALL_FUNC, 	//  func();
	ND_RETURN, 	//  return
	ND_BREAK, 	//  break
	ND_CONTINUE, 	//  continue
	ND_TYPE, 	//  int, double, char...
	ND_NULL_STMT, 	//  NULL statement (;) 
}NodeKind;

typedef enum{
	VOID,
	BOOL,
	CHAR,
	INT,
	PTR,
	ARRAY,
	STRUCT,
	ENUM,
}TypeKind;

typedef enum{
	PRE_INC,
	PRE_DEC,
	POST_INC,
	POST_DEC,
}IncDecKind;

typedef enum{
	LB_LABEL,
	LB_CASE,
	LB_DEFAULT,
}LabelKind;

typedef struct Token  Token;
typedef struct Node   Node;
typedef struct LVar   LVar;
typedef struct GVar   GVar;
typedef struct Struc  Struc;
typedef struct Enum   Enum;
typedef struct Member Member;
typedef struct Func   Func;
typedef struct Label  Label;
typedef struct Str    Str;
typedef struct Type   Type;
typedef struct Def_Type Def_Type;

// code token
struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

// type of variable
struct Type{
	TypeKind ty;
	Type	 *ptr_to;
	int	 size;
	int	 align;
	int      index_size;
	int      len;
	char     *name;
};

// defined type
struct Def_Type{
	char     *name;
	int      name_len;
	char     *tag;
	int      tag_len;
	Type     *type;
	Def_Type *next;
};

// tree object
struct Node{
	NodeKind kind;
	Node *lhs;
	Node *rhs;
	Node *next;
	Node *block_code;
	Type *type;
	int  val;
	char *str;
	int  offset;
};

// function
struct Func{
	//int argc;
	int stack_size;
	char *name;
	Type *type;
	Node *args;
	Node *code[300];
	Func *next;
};

// string
struct Str{
	int len;
	int label_num;
	char *str;
	Str *next;
};

// global variable
struct GVar{
	int len;
	int memsize;
	char *name;
	Type *type;
	GVar *next;
	Node *init;
};

// local variable
struct LVar{
	int len;
	int offset;
	char *name;
	Type *type;
	LVar *next;
}; 

// Labels
struct Label{
	int       id;
	Node      *cond;
	Label     *next;
	LabelKind kind;
}; 

// struct
struct Struc{
	int    len;
	int    memsize;
	char   *name;
	Member *member;
	Struc  *next;
};

// enum
struct Enum{
	int    len;
	char   *name;
	Member *member;
	Enum   *next;
};

// (struct|enum) member
struct Member{
	int    len;
	int    offset;
	int    memsize;
	char   *name;
	Type   *type;
	Member *next;
};



// global variable
int      llid;
int      lvar_count;
int      alloc_size;
char     *user_input;
char     filename[100];
Token    *token;
Func     *func_list[200];
LVar     *locals;
GVar     *globals;
Str      *strings;
Struc    *structs;
Enum     *enumerations;
Def_Type *defined_types;
Label    *labels_head;
Label    *labels_tail;
LVar     *outside_lvar;
Struc    *outside_struct;
Enum     *outside_enum;
Def_Type *outside_deftype;

int label_if;
int label_loop;
int label_if_num;
int label_loop_num;
//================standard library=====================
typedef struct _IO_FILE FILE;
typedef void   _IO_lock_t;
typedef void*  __off_t;

struct _IO_FILE{
	int _flags;           /* High-order word is _IO_MAGIC; rest is flags. */

	/* The following pointers correspond to the C++ streambuf protocol. */
	char *_IO_read_ptr;   /* Current read pointer */
	char *_IO_read_end;   /* End of get area. */
	char *_IO_read_base;  /* Start of putback+get area. */
	char *_IO_write_base; /* Start of put area. */
	char *_IO_write_ptr;  /* Current put pointer. */
	char *_IO_write_end;  /* End of put area. */
	char *_IO_buf_base;   /* Start of reserve area. */
	char *_IO_buf_end;    /* End of reserve area. */

	/* The following fields are used to support backing up and undo. */
	char *_IO_save_base; /* Pointer to start of non-current get area. */
	char *_IO_backup_base;  /* Pointer to first valid character of backup area */
	char *_IO_save_end; /* Pointer to end of non-current get area. */

	struct _IO_marker *_markers;

	struct _IO_FILE *_chain;

	int _fileno;
	int _flags2;

	__off_t _old_offset; /* This used to be _offset but it's too small.  */

	/* 1+column number of pbase(); 0 is unknown. */
	//unsigned short _cur_column;
	//signed char _vtable_offset;
	int  _cur_column;
	char _vtable_offset;
	char _shortbuf[1];

	_IO_lock_t *_lock;
};

FILE *stderr;

typedef _Bool bool;
bool true  = 1;
bool false = 0;
//=========================================================



//================temporary definition=====================
typedef void* size_t;

int  SEEK_SET = 0;
int  SEEK_END = 2;
char errno;
//=========================================================




//====================== syntax_tree.c===========================
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
	}

	// return new num node
	return new_node_num(expect_number());
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
				node = new_node(ND_ADDRESS, __NULL, node);
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
	Node *node=__NULL;

	// logical not
	if(consume("!")){
		node = new_node(ND_NOT, __NULL, logical());
		return node;
	}

	if(consume("*")){
		node = new_node(ND_DEREF, __NULL, unary());

		return node;
	}

	if(consume("&")){
		node = new_node(ND_ADDRESS, __NULL, unary());

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

			if(strings == __NULL){
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
	Node *node = __NULL;

	// NULL statement
	if(consume(";")){
		node = new_node(ND_NULL_STMT, __NULL, __NULL);
	}else if(consume_reserved_word("return", TK_RETURN)){
		node = new_node(ND_RETURN, node, __NULL);
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
		node = new_node(ND_IF, node, __NULL);
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
 
 		Node  *cond = __NULL;
		Label *before_switch = labels_tail;
		Label *prev = __NULL;

 		node = new_node(ND_SWITCH, node, __NULL);
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
		Node *cond_cases = __NULL;
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
				prev = __NULL;
			}
		}
	}else if(consume_reserved_word("case", TK_CASE)){
		/*
		 *  (cond) <--- case ---> code
		 */
		node = new_node(ND_CASE, logical(), __NULL);
		expect(":");
		label_register(node, LB_CASE);
		node->rhs = stmt();
	}else if(consume_reserved_word("default", TK_DEFAULT)){
		/*
		 *  (cond) <--- default ---> code
		 */
		node = new_node(ND_CASE, __NULL, __NULL);
		expect(":");
		node->rhs = stmt();
		label_register(node, LB_DEFAULT);
	}else if(consume_reserved_word("for", TK_FOR)){
		outside_lvar   = locals;
		outside_enum   = enumerations;
		outside_struct = structs;
		
		node = new_node(ND_FOR, node, __NULL);

		if(consume("(")){
			//jmp expr
			Node *init = stmt();
			Node *cond = stmt();
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
		node = new_node(ND_DOWHILE, __NULL, stmt());

		consume_reserved_word("while", TK_WHILE);
		if(consume("(")){
			node->lhs = expr();
			expect(")");
		}
		expect(";");
	}else if(consume_reserved_word("while", TK_WHILE)){
		node = new_node(ND_WHILE, node, __NULL);
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
		node = new_node(ND_BLOCK, node, __NULL);
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
	func->code[i] = __NULL;
}

void program(void){
	int func_index = 0;
	int star_count;
	Type *toplv_type;

	while(!at_eof()){
		// reset lvar list
		locals = __NULL;
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
	func_list[func_index] = __NULL;
}
//====================================================

