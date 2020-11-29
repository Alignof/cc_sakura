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
}NodeKind;

typedef enum{
	VOID,
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
	Member   *member;
	int	 size;
	int	 align;
	int      index_size;
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
	Node *vector;
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
	Node *code[100];
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
Func     *func_list[100];
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
int if_depth;
int loop_depth;

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
//=========================================================



//================temporary definition=====================
int  SEEK_SET = 0;
int  SEEK_END = 2;
char errno;

typedef void* size_t;
//=========================================================

char *read_file(char *path){
	FILE *fp;
	char *buf;

	strcpy(filename, path);
	if ((fp = fopen(path, "r")) == __NULL) {
		fprintf(stderr, "File open error.\n");
		exit(1);
	}

	// get file size
	if(fseek(fp, 0, SEEK_END) == -1){
		error("%s: fseek:%s", path, strerror(errno));
	}

	size_t size = ftell(fp);
	
	if(fseek(fp, 0, SEEK_SET) == -1){
		error("%s: fseek:%s", path, strerror(errno));
	}

	buf = calloc(1, size+2);
	fread(buf, size, 1, fp);

	if(size == 0 || buf[size-1] != '\n'){
		buf[size++] = '\n';
	}

	buf[size] = '\0';
	fclose(fp);

	return buf;
}

void get_code(int argc, char **argv){
	if(argc == 2){
		user_input = read_file(argv[1]);
	}else if(argc == 3){
		if(!strcmp(argv[1], "-cl")){
			user_input = argv[2];
			strcpy(filename, "command line");
		}else{
			fprintf(stderr, "Incorrect option\n");
			exit(1);
		}
	}else{
		fprintf(stderr, "Incorrect number of arguments\n");
		exit(1);
	}
}

int main(int argc, char **argv){
	int i;
	int j;

	char *reg[6];
	reg[0] = "rdi";
	reg[1] = "rsi";
	reg[2] = "rdx";
	reg[3] = "rcx";
	reg[4] = "r8";
	reg[5] = "r9";

	// get source code
	get_code(argc, argv);

	// tokenize
	token = tokenize(user_input);

	// make syntax tree
	program();

	if(func_list == __NULL){
		fprintf(stderr, "function is not found.");
	}


	// generate code
	printf(".intel_syntax noprefix\n");
	printf(".globl main\n");

	// set global variable
	GVar *start = globals;
	for (GVar *var = start;var;var = var->next){
		int comm_align = (var->memsize >=  32) ? 32 : var->memsize/8*8;
		printf(".comm	_%.*s, %d, %d\n", var->len, var->name, var->memsize, comm_align);
	}

	// set string
	for (Str *var = strings;var;var = var->next){
		printf(".LC%d:\n", var->label_num);
		printf("	.string \"%.*s\"\n", var->len, var->str);
	}

	llid        = 0;
	label_loop  = 0;
	loop_depth  = 0;
	label_if    = 0;
	if_depth    = 0;
	labels_head = __NULL;
	labels_tail = __NULL;

	//generate assembly at first expr
	for(i = 0;func_list[i];i++){
		printf("%s:\n", func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n", func_list[i]->stack_size);

		if(func_list[i]->args){
			// push argument stack
			for(j = func_list[i]->args->val;j >= 0;j--) printf("	push %s\n", reg[j]);

			// set local variable
			gen(func_list[i]->args);
		}

		// global init (main)
		if(strncmp(func_list[i]->name, "main", 4) == 0){
			GVar *start = globals;
			for (GVar *var = start;var;var = var->next){
				if(var->init) expand_next(var->init);
			}
		}

		for(j = 0;func_list[i]->code[j] != __NULL;j++){
			if_depth   = 0;
			loop_depth = 0;

			// gen code
			gen(func_list[i]->code[j]);
			printf("\n	pop rax\n");

			label_if   += if_depth;
			label_loop += loop_depth;
		}

		// epiroge
		// rax = return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}


