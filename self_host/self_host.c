
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


// bool isblock(char *str){
// 	return (*str == '{') || (*str == '}');
// }
// 
// bool at_eof(void){
// 	return token->kind == TK_EOF;
// }
// 
// int is_alnum(char c){
// 	return	(('a' <=  c) && (c <=  'z')) ||
// 		(('A' <=  c) && (c <=  'Z')) ||
// 		(('0' <=  c) && (c <=  '9')) ||
// 		(c == '_');
// }
// 
// int len_val(char *str){
// 	int counter = 0;
// 	for(;is_alnum(*str);str++){
// 		counter++;
// 	}
// 
// 	return counter;
// }
// 
// bool issymbol(char *str,  bool *single_flag){
// 	int i;
// 	int size;
// 	char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
// 	char repeat_symbol[] = "<>&|+-";
// 	char multi_symbol[]  = "->";
// 	char multi_eq[]      = "<=>!+*-/";
// 	
// 	//Is multi equal? (<=,==,!=,>=)
// 	size = sizeof(multi_eq)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		if((*str == multi_eq[i]) && (*(str+1) == '=')){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 	
// 	//Is repeat symbol? (<<,>>,&&,||,++,--)
// 	size = sizeof(repeat_symbol)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 
// 	//Is multi symbol? (->)
// 	size = sizeof(multi_symbol)/sizeof(char)/2;
// 	for(i = 0;i < size;i += 2){
// 		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 
// 	//Is single symbol? (+,-,*,/,%,<,>,',.)
// 	size = sizeof(single_symbol)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		if(*str == single_symbol[i]){
// 			*single_flag = true;
// 			return true;
// 		}
// 	}
// 
// 	return false;
// }
// 
// Token *new_token(TokenKind kind, Token *cur, char *str){
// 	Token *new = calloc(1, sizeof(Token));
// 	new->kind = kind;
// 	//Remaining characters
// 	new->str = str;
// 	new->len = 1;
// 	cur->next = new;
// 	return new;
// }
// 
// bool consume_reserved(char **p, char *str, int len, Token **now, TokenKind tk_kind){
// 	if(strncmp(*p, str, len) !=  0 || is_alnum((*p)[len])){
// 		return false;
// 	}
// 
// 	*now = new_token(tk_kind, *now, *p);
// 	(*now)->len = len;
// 	(*now)->str = *p;
// 	*p += len;
// 
// 	return true;
// }
// 
// Token *tokenize(char *p){
// 	bool is_single_token;
// 	Token head;
// 	head.next = __NULL;
// 
// 	//set head pointer to cur
// 	Token *now = &head;
// 
// 	while(*p){
// 		if(isspace(*p)){
// 			p++;
// 			continue;
// 		}
// 
// 		if((*p == '/') && (*(p+1) == '/')){
// 			while(*p != '\n') p++;
// 			continue;
// 		}
// 
// 		if((*p == '/') && (*(p+1) == '*')){
// 			while(!((*(p-1) == '*') && (*p == '/'))) p++;
// 			p++;
// 			continue;
// 		}
// 
// 		//Is character literal?
// 		if(*p == '\''){
// 			p++;// consume single quote
// 			if(*p == '\\'){
// 				p++;// consume back slash
// 
// 				//Is LF? (\n)
// 				if(*p == 'n'){
// 					now = new_token(TK_NUM, now, p++);
// 					now->val = 10;
// 				//Is NUL? (\0)
// 				}else if(*p == '0'){
// 					now = new_token(TK_NUM, now, p++);
// 					now->val = 0;
// 				}else if(*p == '\\'){
// 					now = new_token(TK_NUM, now, p++);
// 					now->val = 92;
// 				}
// 			}else{
// 				now = new_token(TK_NUM, now, p);
// 				now->val = *p++;
// 			}
// 			// consume single quote
// 			p++;
// 			continue;
// 		}
// 
// 		//Is number?
// 		if(isdigit(*p)){
// 			if(now->kind == TK_IDENT){
// 				now = new_token(TK_IDENT, now, p++);
// 				now->len = 1;
// 			}else{
// 				//add number token
// 				now = new_token(TK_NUM, now, p);
// 				//set number
// 				now->val = strtol(p, &p, 10);
// 			}
// 			continue;
// 		}
// 
// 		//judge single token or multi token or isn't token
// 		if(issymbol(p, &is_single_token)){
// 			now = new_token(TK_RESERVED, now, p);
// 			if(is_single_token){
// 				p++;
// 			}else{
// 				p += 2;
// 				now->len = 2;
// 			}
// 			continue;
// 		}
// 
// 		if(consume_reserved(&p, "void",     4, &now, TK_TYPE))	   continue;
// 		if(consume_reserved(&p, "_Bool",    5, &now, TK_TYPE))	   continue;
// 		if(consume_reserved(&p, "char",     4, &now, TK_TYPE))	   continue;
// 		if(consume_reserved(&p, "int",	    3, &now, TK_TYPE))	   continue;
// 		if(consume_reserved(&p, "struct",   6, &now, TK_TYPE))     continue;
// 		if(consume_reserved(&p, "enum",     4, &now, TK_TYPE))     continue;
// 		if(consume_reserved(&p, "if",	    2, &now, TK_IF))	   continue;
// 		if(consume_reserved(&p, "else",	    4, &now, TK_ELSE))	   continue;
// 		if(consume_reserved(&p, "switch",   6, &now, TK_SWITCH))   continue;
// 		if(consume_reserved(&p, "case",     4, &now, TK_CASE))	   continue;
// 		if(consume_reserved(&p, "default",  7, &now, TK_DEFAULT))  continue;
// 		if(consume_reserved(&p, "for",	    3, &now, TK_FOR))	   continue;
// 		if(consume_reserved(&p, "do",	    2, &now, TK_DO))       continue;
// 		if(consume_reserved(&p, "while",    5, &now, TK_WHILE))    continue;
// 		if(consume_reserved(&p, "break",    5, &now, TK_BREAK))    continue;
// 		if(consume_reserved(&p, "continue", 8, &now, TK_CONTINUE)) continue;
// 		if(consume_reserved(&p, "sizeof",   6, &now, TK_SIZEOF))   continue;
// 		if(consume_reserved(&p, "typedef",  7, &now, TK_TYPEDEF))  continue;
// 		if(consume_reserved(&p, "return",   6, &now, TK_RETURN))   continue;
// 
// 		// compiler directive
// 		if(consume_reserved(&p, "__NULL",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
// 		//if(consume_reserved(&p, "define",   6, &now, TK_COMPILER_DIRECTIVE)) continue;
// 		//if(consume_reserved(&p, "include",  7, &now, TK_COMPILER_DIRECTIVE)) continue;
// 
// 
// 		//Is block? '{' or '}'
// 		if(isblock(p)){
// 			now = new_token(TK_BLOCK, now, p);
// 			now->len = 1;
// 			now->str = p;
// 			p++;
// 			continue;
// 		}
// 
// 		//Is string?
// 		if(*p == '"'){
// 			if(*(p-1) == '\''){
// 				now = new_token(TK_RESERVED, now, p++);
// 			}else{
// 				p++;
// 				while(!(*(p-1) != '\\' && *p == '"')){
// 					now = new_token(TK_STR, now, p++);
// 				}
// 				p++;
// 			}
// 			continue;
// 		}
// 
// 		//Is escape?
// 		if(*p == '\\' && *(p+1) == '\\'){
// 			now = new_token(TK_IDENT, now, p++);
// 			p++;
// 			continue;
// 		}
// 		
// 		//Is valiable?
// 		if(is_alnum(*p)){
// 			while(is_alnum(*p)){
// 				now = new_token(TK_IDENT, now, p++);
// 				now->len = 1;
// 			}
// 			continue;
// 		}
// 
// 		error_at(p, "can not tokenize.");
// 	}
// 
// 	//add EOF token
// 	new_token(TK_EOF, now, p);
// 	return head.next;
// }
// 
// char *read_file(char *path){
// 	FILE *fp;
// 	char *buf;
// 
// 	strcpy(filename, path);
// 	if ((fp = fopen(path, "r")) == __NULL) {
// 		fprintf(stderr, "File open error.\n");
// 		exit(1);
// 	}
// 
// 	// get file size
// 	if(fseek(fp, 0, SEEK_END) == -1){
// 		error("%s: fseek:%s", path, strerror(errno));
// 	}
// 
// 	size_t size = ftell(fp);
// 	
// 	if(fseek(fp, 0, SEEK_SET) == -1){
// 		error("%s: fseek:%s", path, strerror(errno));
// 	}
// 
// 	buf = calloc(1, size+2);
// 	fread(buf, size, 1, fp);
// 
// 	if(size == 0 || buf[size-1] != '\n'){
// 		buf[size++] = '\n';
// 	}
// 
// 	buf[size] = '\0';
// 	fclose(fp);
// 
// 	return buf;
// }
// 
// void get_code(int argc, char **argv){
// 	if(argc == 2){
// 		user_input = read_file(argv[1]);
// 	}else if(argc == 3){
// 		if(!strcmp(argv[1], "-cl")){
// 			user_input = argv[2];
// 			strcpy(filename, "command line");
// 		}else{
// 			fprintf(stderr, "Incorrect option\n");
// 			exit(1);
// 		}
// 	}else{
// 		fprintf(stderr, "Incorrect number of arguments\n");
// 		exit(1);
// 	}
// }


int main(int argc, char **argv){
	int i;
	int j;

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

	llid           = 0;
	label_if_num   = 0;
	label_loop_num = 0;
	labels_head    = __NULL;
	labels_tail    = __NULL;

	//generate assembly at first expr
	for(i = 0;func_list[i];i++){
		printf("%s:\n", func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n", func_list[i]->stack_size);

		if(func_list[i]->args){
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
			// gen code
			if(func_list[i]->code[j]->kind != ND_NULL_STMT){
				gen(func_list[i]->code[j]);
				printf("\n	pop rax\n");
			}
		}

		// epiroge
		// rax = return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}


