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




//======================== parse_sys.c ===============================
void error(char *loc, char *fmt){
	//va_list ap;
	//va_start(ap, fmt);

	int pos = loc-user_input;
	fprintf(stderr, "%s\n", user_input);
	fprintf(stderr, "%*s", pos, " ");
	fprintf(stderr, "^ ");
	//vfprintf(stderr, fmt, ap);
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
	fprintf(stderr, "%.*s\n", (end-start), start);

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

int string_len(void){
	int len = 0;
	while(token->kind == TK_STR){
		token = token->next;
		len++;
	}

	return len;
}

bool consume_ret(void){
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

Token *consume_string(void){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_STR || !(isascii(*(token->str)))){
		return false;
	}

	Token *ret = token;
	int counter = 0;
	while(token->kind == TK_STR){
		counter++;
		token = token->next;
	}

	ret->len = counter;

	return ret;
}


Token *consume_ident(void){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||!(is_alnum(*(token->str)))){
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

int expect_number(void){
	// judge whether token is a number and move the pointer to the next and return value
	if(token->kind != TK_NUM){
		error_at(token->str, "not a number");
	}

	int val = token->val;
	token = token->next;
	return val;
}

void label_register(Node *node, LabelKind kind){
	Label *new_label;
	if(labels_tail){
		labels_tail->next = calloc(1, sizeof(Label));
		new_label         = labels_tail->next;
	}else{
		labels_head = calloc(1, sizeof(Label));
		new_label   = labels_head;
	}

	new_label->kind  = kind;
	new_label->id    = llid;
	node->val        = llid;
	labels_tail      = (labels_tail) ? labels_tail->next : labels_head;

	llid++;


	if(kind == LB_CASE){
		new_label->cond = node->lhs;
	}else if(kind == LB_DEFAULT){
		new_label->cond = node->rhs;
	}
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

LVar *find_lvar(Token *tok, int find_range){
	/* find_range
	 * INSIDE_FUNC  == 0
	 * INSIDE_SCOPE == 1 
	 */

	int out_of_scope = 0;
	//while var not equal NULL
	for (LVar *var = locals;var;var = var->next){
		if(var == outside_lvar) out_of_scope = 1;
		if(find_range && out_of_scope) break;
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

Struc *find_struc(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
			return var;
		}
	}
	return NULL;
}

Member *find_struct_member(Type *type, int find_range){
	char *struc_name = type->name;
	int  struc_len   = type->len;
	int out_of_scope = 0;

	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == struc_len && !memcmp(struc_name, var->name, var->len)){
			return var->member;
		}
	}
	return NULL;
}

Enum *find_enum(Token *tok, int find_range){
	int out_of_scope = 0;

	for (Enum *var = enumerations;var;var = var->next){
		if(var == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
			return var;
		}
	}
	return NULL;
}

Member *find_enumerator(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Enum *en = enumerations;en;en = en->next){
		if(en == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		for (Member *var = en->member;var;var = var->next){
			if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
				return var;
			}
		}
	}
	return NULL;
}

Def_Type *find_defined_type(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Def_Type *var = defined_types;var;var = var->next){
		if(var == outside_deftype) out_of_scope = 1;
		if(out_of_scope) break;
		if(var->name_len == len_val(tok->str) && !memcmp(tok->str, var->name, var->name_len)){
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

	if(kind == ND_ASSIGN){
		if(lhs->type->ty == BOOL){
			node->rhs = new_node(ND_NE, node->rhs, new_node_num(0));
		}
	}

	if(ND_ADD <= kind && kind <= ND_ASSIGN){
		node->type = (lhs->type->ty > rhs->type->ty)? lhs->type : rhs->type;
	}

	if(kind == ND_DOT || kind == ND_ARROW){
		node->type = lhs->type;
	}

	if(kind == ND_ADDRESS){
		node->type->ty     = PTR;
		node->type->size   = type_size(node->type);
		node->type->align  = type_align(node->type);
		node->type->ptr_to = rhs->type;
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

	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_NUM;
	node->val  = val;
	node->type = calloc(1, sizeof(Type));
	node->type->ty    = INT;
	node->type->size  = type_size(node->type);
	node->type->align = type_align(node->type);
	return node;
}



