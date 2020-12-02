// typedef enum{
// 	TK_TYPE,
// 	TK_RESERVED,
// 	TK_IDENT,
// 	TK_NUM,
// 	TK_IF,
// 	TK_ELSE,
// 	TK_SWITCH,
// 	TK_CASE,
// 	TK_DEFAULT,
// 	TK_DO,
// 	TK_WHILE,
// 	TK_FOR,
// 	TK_SIZEOF,
// 	TK_BLOCK,
// 	TK_STR,
// 	TK_BREAK,
// 	TK_CONTINUE,
// 	TK_TYPEDEF,
// 	TK_EXTERN,
// 	TK_RETURN,
// 	TK_THREAD_LOCAL,
// 	TK_COMPILER_DIRECTIVE,
// 	TK_EOF,
// }TokenKind;
// 
// typedef enum{
// 	// lhs <-- symbol --> rhs
// 	ND_ADD, 	//  +
// 	ND_SUB, 	//  -
// 	ND_MUL, 	//  *
// 	ND_DIV, 	//  /
// 	ND_MOD, 	//  %
// 	ND_GT, 		//  >
// 	ND_GE, 		//  >=
// 	ND_LT, 		//  <
// 	ND_LE, 		//  <=
// 	ND_EQ, 		//  ==
// 	ND_NE, 		//  !=
// 	ND_AND, 	//  &&
// 	ND_OR, 		//  ||
// 	ND_ASSIGN, 	//  =
// 	ND_COMPOUND, 	//  +=, -=, *=, /=
// 
// 	// symbol --> rhs
// 	ND_POSTID, 	//  a++, a--
// 	ND_DOT,		//  struc.member
// 	ND_ARROW,	//  struc_ptr->member
// 
// 	// lhs <-- symbol
// 	ND_PREID, 	//  ++a, --a
// 	ND_NOT, 	//  !a
// 	ND_ADDRESS, 	//  &a
// 	ND_DEREF, 	//  *a
// 
// 	// other
// 	ND_LVAR, 	//  local variable
// 	ND_GVAR, 	//  global variable
// 	ND_LARRAY, 	//  local array
// 	ND_GARRAY, 	//  global array
// 	ND_STR, 	//  "string"
// 	ND_NUM, 	//  integer
// 	ND_TERNARY,	//  cond ? if_true : if_false
// 	ND_IF, 		//  if
// 	ND_ELSE, 	//  else
// 	ND_IFELSE, 	//  if-else
// 	ND_SWITCH, 	//  switch
// 	ND_CASE, 	//  case or default
// 	ND_WHILE, 	//  while
// 	ND_DOWHILE, 	//  do-while
// 	ND_FOR, 	//  for
// 	ND_BLOCK, 	//  {}
// 	ND_ARG, 	//  function argument;
// 	ND_CALL_FUNC, 	//  func();
// 	ND_RETURN, 	//  return
// 	ND_BREAK, 	//  break
// 	ND_CONTINUE, 	//  continue
// 	ND_TYPE, 	//  int, double, char...
// 	ND_NULL_STMT, 	//  NULL statement (;) 
// }NodeKind;
// 
// typedef enum{
// 	VOID,
// 	BOOL,
// 	CHAR,
// 	INT,
// 	PTR,
// 	ARRAY,
// 	STRUCT,
// 	ENUM,
// }TypeKind;
// 
// typedef enum{
// 	PRE_INC,
// 	PRE_DEC,
// 	POST_INC,
// 	POST_DEC,
// }IncDecKind;
// 
// typedef enum{
// 	LB_LABEL,
// 	LB_CASE,
// 	LB_DEFAULT,
// }LabelKind;
// 
// typedef struct Token  Token;
// typedef struct Node   Node;
// typedef struct LVar   LVar;
// typedef struct GVar   GVar;
// typedef struct Struc  Struc;
// typedef struct Enum   Enum;
// typedef struct Member Member;
// typedef struct Func   Func;
// typedef struct Label  Label;
// typedef struct Str    Str;
// typedef struct Type   Type;
// typedef struct Def_Type Def_Type;
// 
// // code token
// struct Token{
// 	TokenKind kind;
// 	Token *next;
// 	int val;
// 	char *str;
// 	int len;
// };
// 
// // type of variable
// struct Type{
// 	TypeKind ty;
// 	Type	 *ptr_to;
// 	int	 size;
// 	int	 align;
// 	int      index_size;
// 	int      is_extern;
// 	int      is_thread_local;
// 	int      len;
// 	char     *name;
// };
// 
// // defined type
// struct Def_Type{
// 	char     *name;
// 	int      name_len;
// 	char     *tag;
// 	int      tag_len;
// 	Type     *type;
// 	Def_Type *next;
// };
// 
// // tree object
// struct Node{
// 	NodeKind kind;
// 	Node *lhs;
// 	Node *rhs;
// 	Node *next;
// 	Node *block_code;
// 	Type *type;
// 	int  val;
// 	char *str;
// 	int  offset;
// };
// 
// // function
// struct Func{
// 	//int argc;
// 	int stack_size;
// 	char *name;
// 	Type *type;
// 	Node *args;
// 	Node *code[300];
// 	Func *next;
// };
// 
// // string
// struct Str{
// 	int len;
// 	int label_num;
// 	char *str;
// 	Str *next;
// };
// 
// // global variable
// struct GVar{
// 	int len;
// 	int memsize;
// 	char *name;
// 	Type *type;
// 	GVar *next;
// 	Node *init;
// };
// 
// // local variable
// struct LVar{
// 	int len;
// 	int offset;
// 	char *name;
// 	Type *type;
// 	LVar *next;
// }; 
// 
// // Labels
// struct Label{
// 	int       id;
// 	Node      *cond;
// 	Label     *next;
// 	LabelKind kind;
// }; 
// 
// // struct
// struct Struc{
// 	int    len;
// 	int    memsize;
// 	char   *name;
// 	Member *member;
// 	Struc  *next;
// };
// 
// // enum
// struct Enum{
// 	int    len;
// 	char   *name;
// 	Member *member;
// 	Enum   *next;
// };
// 
// // (struct|enum) member
// struct Member{
// 	int    len;
// 	int    offset;
// 	int    memsize;
// 	char   *name;
// 	Type   *type;
// 	Member *next;
// };
// 
// 
// // global variable
// int      llid;
// int      lvar_count;
// int      alloc_size;
// char     *user_input;
// char     filename[100];
// Token    *token;
// Func     *func_list[200];
// LVar     *locals;
// GVar     *globals;
// Str      *strings;
// Struc    *structs;
// Enum     *enumerations;
// Def_Type *defined_types;
// Label    *labels_head;
// Label    *labels_tail;
// LVar     *outside_lvar;
// Struc    *outside_struct;
// Enum     *outside_enum;
// Def_Type *outside_deftype;
// 
// int label_if;
// int label_loop;
// int label_if_num;
// int label_loop_num;
// //================standard library=====================
// typedef struct _IO_FILE FILE;
// typedef void   _IO_lock_t;
// typedef void*  __off_t;
// 
// struct _IO_FILE{
// 	int _flags;           /* High-order word is _IO_MAGIC; rest is flags. */
// 
// 	/* The following pointers correspond to the C++ streambuf protocol. */
// 	char *_IO_read_ptr;   /* Current read pointer */
// 	char *_IO_read_end;   /* End of get area. */
// 	char *_IO_read_base;  /* Start of putback+get area. */
// 	char *_IO_write_base; /* Start of put area. */
// 	char *_IO_write_ptr;  /* Current put pointer. */
// 	char *_IO_write_end;  /* End of put area. */
// 	char *_IO_buf_base;   /* Start of reserve area. */
// 	char *_IO_buf_end;    /* End of reserve area. */
// 
// 	/* The following fields are used to support backing up and undo. */
// 	char *_IO_save_base; /* Pointer to start of non-current get area. */
// 	char *_IO_backup_base;  /* Pointer to first valid character of backup area */
// 	char *_IO_save_end; /* Pointer to end of non-current get area. */
// 
// 	struct _IO_marker *_markers;
// 
// 	struct _IO_FILE *_chain;
// 
// 	int _fileno;
// 	int _flags2;
// 
// 	__off_t _old_offset; /* This used to be _offset but it's too small.  */
// 
// 	/* 1+column number of pbase(); 0 is unknown. */
// 	//unsigned short _cur_column;
// 	//signed char _vtable_offset;
// 	int  _cur_column;
// 	char _vtable_offset;
// 	char _shortbuf[1];
// 
// 	_IO_lock_t *_lock;
// };
// 
// FILE *stderr;
// 
// typedef _Bool bool;
// bool true  = 1;
// bool false = 0;
// //=========================================================
// 
// 
// 
// //================temporary definition=====================
// typedef void* size_t;
// 
// int  SEEK_SET = 0;
// int  SEEK_END = 2;
// int  FUNC_NUM = 100;
// extern _Thread_local int errno;
// //=========================================================
// 
// 
// 
// Member *register_struc_member(int *asize_ptr){
// 	int size_of_type;
// 	int INSIDE_FILE   = 0;
// 	Member *new_memb  = __NULL;
// 	Member *memb_head = __NULL;
// 
// 	while(1){
// /*
// 		if(!(token->kind == TK_TYPE || find_defined_type(token, INSIDE_FILE))){
// 			error_at(token->str, "not a type.");
// 		}
// 
// 		new_memb = calloc(1,sizeof(Member));
// 
// 		// parse member type
// 		new_memb->type    = parse_type();
// 		new_memb->memsize = new_memb->type->size;
// 
// 		// add member name
// 		Token *def_name  = consume_ident();
// 		new_memb->name   = def_name->str;
// 		new_memb->len    = def_name->len;
// 
// */
// 		// Is array index
// 		int isize = -1;
// 		int index_num;
// 		Type *newtype;
// 
// 		while(consume("[")){
// 			/*
// 			if(isize == -1){
// 				isize = token->val;
// 			}else{
// 				isize *= token->val;
// 			}
// 			index_num = token->val;
// 			token = token->next;
// 
// 			newtype = calloc(1, sizeof(Type));
// 			newtype->ty         = ARRAY;
// 			newtype->ptr_to     = new_memb->type;
// 			newtype->index_size = index_num;
// 			newtype->size  = type_size(newtype);
// 			newtype->align = type_align(newtype);
// 			new_memb->type = newtype;
// 
// 			*/
// 			expect("]");
// 		}
// 
// /*
// 		// align member offset
// 		int padding = 0;
// 		if(new_memb->type->ty == ARRAY){
// 			size_of_type = 8;
// 		}else if (new_memb->type->ty == STRUCT){
// 			size_of_type = new_memb->memsize;
// 		}else{
// 			size_of_type = new_memb->type->size;
// 		}
// 
// 		if(memb_head){
// 			int prev_tail    = (memb_head) ? (memb_head->offset + memb_head->type->size) : 0;
// 			padding          = (prev_tail % new_memb->type->align) ? (new_memb->type->align - (prev_tail % new_memb->type->align)) : 0;
// 			new_memb->offset = prev_tail + padding;
// 		}else{
// 			new_memb->offset = 0;
// 		}
// 		(*asize_ptr) += size_of_type + padding;
// 
// 		new_memb->next = memb_head;
// 		memb_head      = new_memb;
// 
// 		expect(";");
// 		if(consume("}"))break;
// */
// 	}
// 
// 	(*asize_ptr) = ((*asize_ptr)%8) ? (*asize_ptr)/8*8+8 : (*asize_ptr);
// 	return memb_head;
// }
int main(){int i=0; while(i<10){if(i==5){break;}i++;} return i;}
