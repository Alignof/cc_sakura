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
	TK_EXTERN,
	TK_RETURN,
	TK_THREAD_LOCAL,
	TK_COMPILER_DIRECTIVE,
	TK_EOF,
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
	ND_CALL_FUNC, 	//  func();
	ND_CASE, 	//  case or default(has code after label)
	ND_TERNARY,	//  cond ? if_true : if_false
	ND_BLOCK, 	//  {}

	// statement(does not push value to stack)
	ND_NULL_STMT, 	//  NULL statement (;) 
	ND_IF, 		//  if
	ND_ELSE, 	//  else
	ND_IFELSE, 	//  if-else
	ND_SWITCH, 	//  switch
	ND_FOR, 	//  for
	ND_WHILE, 	//  while
	ND_DOWHILE, 	//  do-while
	ND_BREAK, 	//  break
	ND_CONTINUE, 	//  continue
	ND_RETURN, 	//  return

	//virtual type
	ND_ARG, 	//  function argument;
	ND_TYPE, 	//  int, double, char...
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
	int      is_extern;
	int      is_thread_local;
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
	int  stack_size;
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



//================= global variable ===================
extern int      llid;
extern int      lvar_count;
extern int      alloc_size;
extern char     *user_input;
extern char     filename[100];
extern Token    *token;
extern Func     *func_list[300];
extern LVar     *locals;
extern GVar     *globals;
extern Str      *strings;
extern Struc    *structs;
extern Enum     *enumerations;
extern Def_Type *defined_types;
extern Label    *labels_head;
extern Label    *labels_tail;
extern LVar     *outside_lvar;
extern Struc    *outside_struct;
extern Enum     *outside_enum;
extern Def_Type *outside_deftype;
extern int label_num;
extern int label_loop_end;
//=====================================================


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

typedef _Bool bool;
bool true  = 1;
bool false = 0;
//=========================================================



//================temporary definition=====================
typedef void* size_t;

int  SEEK_SET = 0;
int  SEEK_END = 2;
int  FUNC_NUM = 300;

extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */

extern _Thread_local int errno;
//=========================================================





Node *compiler_directive(){
	Node *node;
	
	if(consume_reserved_word("__NULL", TK_COMPILER_DIRECTIVE)){
		node = new_node_num(0);
		node->type->ty    = PTR;
		node->type->size  = 8;
		node->type->align = 8;

		node->type->ptr_to        = calloc(1, sizeof(Type));
		node->type->ptr_to->ty    = VOID;
		node->type->ptr_to->size  = 1;
		node->type->ptr_to->align = 1;
	}

	return node;
}

Node *compound_assign(TypeKind type, Node *dst, Node *src){
	Node *calc = new_node(type, dst, src);
	Node *new  = new_node(ND_COMPOUND, dst, calc);
	return new;
}

Node *dot_arrow(NodeKind type, Node *node){
	// struc.aaa.bbb.ccc;
	// struc->aaa->bbb->ccc;
	// (lvar <- node -> dot) <- node -> dot
	int INSIDE_FILE = 0;
	Type *struc_type;
	Node *new = new_node(type, node, __NULL);
	Token *memb_name  = consume_ident();
	Member *memb_list;

	// get type of struct
	if(node->kind == ND_ADDRESS){
		struc_type = node->rhs->type;
	}else if(node->kind == ND_DEREF){
		struc_type = node->rhs->type->ptr_to;
	}else{
		struc_type = node->type;
	}

	// get member list
	if(type == ND_DOT){
		memb_list = find_struct_member(struc_type, INSIDE_FILE);
	}else{
		memb_list = find_struct_member(struc_type->ptr_to, INSIDE_FILE);
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, memb_name->len)){
			new->rhs  = new_node_num(memb_list->offset);
			new->type = memb_list->type;
			break;
		}
		memb_list = memb_list->next;
	}

	return new;
}

Node *incdec(Node *node, IncDecKind idtype){
	/*
	 * a++;
	 * a <-- (ND_POSTID) --> a = a+1;
	 *
	 * --a;
	 * a = a-1; <-- (ND_PREID) --> a;
	 */

	Node *new = calloc(1,sizeof(Node));
	Node *plmi_one = calloc(1,sizeof(Node));

	// increment or decrement
	if(idtype == PRE_INC || idtype == POST_INC){
		plmi_one = new_node(ND_COMPOUND, node, new_node(ND_ADD,node,new_node_num(1)));
	}else{
		plmi_one = new_node(ND_COMPOUND, node, new_node(ND_SUB,node,new_node_num(1)));
	}

	// pre
	if(idtype == PRE_INC || idtype == PRE_DEC){
		new->kind = ND_PREID;
		new->lhs  = plmi_one;
		new->rhs  = node;
	// post
	}else{
		new->kind = ND_POSTID;
		new->lhs  = node;
		new->rhs  = plmi_one;
	}

	new->type = node->type;
	return new;
}

Node *init_formula(Node *node, Node *init_val){
	switch(init_val->kind){
		case ND_STR:
			if(node->type->ty == PTR){
				node = new_node(ND_ASSIGN, node, init_val);
			}else if(node->type->ty == ARRAY){
				if(node->type->index_size == init_val->offset+1 || node->type->index_size == -1){
					node = array_str(node, init_val);
				}else{
					error_at(token->str, "Invalid array size");
				}
			}else{
				error_at(token->str, "Invalid assign");
			}
			break;
		default:
			node = new_node(ND_ASSIGN, node, init_val);
			break;
	}

	return node;
}

Node *array_str(Node *arr, Node *init_val){
	int ctr	  = 0;
	int isize = arr->type->index_size;
	Node *src;
	Node *dst  = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, __NULL, __NULL);

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(ctr < init_val->offset){
		src = array_index(clone, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, new_node_num(*(init_val->str + ctr)));
			node->rhs = dst;
		}else{
			dst->block_code = new_node(ND_ASSIGN, src, new_node_num(*(init_val->str + ctr)));
			dst = dst->block_code;
		}
		ctr++;
	}

	// '\0'
	dst->block_code = new_node(ND_ASSIGN, array_index(clone, new_node_num(init_val->offset)), new_node_num('\0'));
	dst = dst->block_code;
	ctr++;

	// ommitted
	if(isize == -1){
		if(arr->kind == ND_LARRAY){
			int asize = align_array_size(ctr, arr->type);
			alloc_size+=asize;
			arr->offset    = ((locals)?(locals->offset):0) + asize;
			clone->offset  = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
			locals->type->size  = type_size(locals->type);
			locals->type->align = type_size(locals->type);
		}else{
			globals->memsize = align_array_size(ctr, arr->type);
		}
	}

	return node;
}

Node *array_block(Node *arr){
	int ctr = 0;
	int isize = arr->type->index_size;
	Node *src;
	Node *dst = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, __NULL, __NULL);

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(token->kind != TK_BLOCK){
		src = array_index(clone, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, expr());
			node->rhs = dst;
		}else{
			dst->block_code = new_node(ND_ASSIGN, src, expr());
			dst = dst->block_code;
		}
		consume(",");
		ctr++;
	}

	expect("}");
	
	// ommitted
	if(isize == -1){
		if(arr->kind == ND_LARRAY){
			int asize = align_array_size(ctr, arr->type);
			alloc_size+=asize;
			arr->offset = ((locals)?(locals->offset):0) + asize;
			clone->offset = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
			locals->type->size  = type_size(locals->type);
			locals->type->align = type_size(locals->type);
		}else{
			globals->memsize = align_array_size(ctr, arr->type);
		}
	// too many
	}else if(arr->type->index_size < ctr){
		error_at(token->str, "Invalid array size");
	// too little
	}else if(arr->type->index_size > ctr){
		while(ctr != arr->type->index_size){
			src = array_index(clone, new_node_num(ctr));
			dst->block_code = new_node(ND_ASSIGN, src, new_node_num(0));
			dst = dst->block_code;

			ctr++;
			consume(",");
		}
	}

	return node;
}

Node *call_function(Node *node, Token *tok){
	expect("(");

	node->kind = ND_CALL_FUNC;
	node->str  = tok->str;
	node->val  = tok->len;

	// have argument?
	if(consume(")")) return node;

	int ctr = 0;
	Node *new = __NULL;
	while(1){
		if(new == __NULL){
			new       = logical();
			node->rhs = new;
		}else{
			new->next  = logical();
			new        = new->next;
		}

		ctr++;

		if(!(consume(","))) break;
	}
	expect(")");

	return node;
}

Node *array_index(Node *node, Node *index){
	// a[1] == *(a+1)
	node = new_node(ND_ADD, node, index);
	node = new_node(ND_DEREF, __NULL, node);

	return node;
}

void get_argument(int func_index){
	if(consume_reserved_word("void", TK_TYPE)){
		func_list[func_index]->args = __NULL;
		expect(")");
		return;
	}

	// get argument
	if(consume(")")){
		func_list[func_index]->args = __NULL;
	}else{
		// set args node
		Node *new_arg = __NULL;
		int arg_counter = 0;

		while(token->kind == TK_NUM || token->kind == TK_TYPE  || find_defined_type(token, 0)){
			if(new_arg == __NULL){
				new_arg       = calloc(1, sizeof(Node));
				new_arg->kind = ND_ARG;
				new_arg->val  = arg_counter;
				new_arg->rhs  = expr();
				func_list[func_index]->args = new_arg;
			}else{
				new_arg->next       = calloc(1, sizeof(Node));
				new_arg->next->kind = ND_ARG;
				new_arg->next->val  = arg_counter;
				new_arg->next->rhs  = expr();
				new_arg             = new_arg->next;
			}
			arg_counter++;

			if(!(consume(","))){
				break;
			}
		}
		expect(")");
	}
}

