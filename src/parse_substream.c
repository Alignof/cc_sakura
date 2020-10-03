#include "cc_sakura.h"

GVar *globals;
int alloc_size;
// Token *token;
// LVar *locals;
// Func *func_list[100];

Node *init_formula(Node *node,Node *init_val){
	switch(init_val->kind){
		case ND_STR:
			if(node->type.ty==PTR){
				node->vector=new_node(ND_ASSIGN,node,init_val);
			}else if(node->type.ty==ARRAY){
				if(node->type.index_size == init_val->offset+1 || node->type.index_size == -1)
					node->vector=new_node(ND_ASSIGN,node,init_val);
				else	error_at(token->str,"Invalid array size");
			}else{
				error_at(token->str,"Invalid assign");
			}
			break;
		default:
			node->vector=new_node(ND_ASSIGN,node,init_val);
			break;
	}

	return node;
}

Node *array_block(Node *arr){
	int ctr=0;
	int isize=arr->type.index_size;
	Node *src;
	Node *dst=calloc(1,sizeof(Node));

	Node *clone=calloc(1,sizeof(Node));
	memcpy(clone,arr,sizeof(Node));
	clone->val=0;
	clone->kind=ND_LVAR;

	while(token->kind!=TK_BLOCK){
		src=array_index(clone,new_node_num(ctr));
		//Is first?
		if(ctr==0){
			dst=new_node(ND_ASSIGN,src,expr());
			arr->next=dst;
		}else{
			dst->next=new_node(ND_ASSIGN,src,expr());
			dst=dst->next;
		}
		consume(",");
		ctr++;
	}

	expect("}");
	
	// ommitted
	if(isize == -1){
		int asize=align_array_size(ctr,arr->type.ptr_to->ty);
		alloc_size+=asize+8;
		arr->val=((locals)?(locals->offset):0) + asize;
		locals->type.index_size=ctr;
	// too many
	}else if(arr->type.index_size < ctr){
		error_at(token->str,"Invalid array size");
	// too little
	}else if(arr->type.index_size > ctr){
		while(ctr != arr->type.index_size){
			src=array_index(clone,new_node_num(ctr));
			dst->next=new_node(ND_ASSIGN,src,new_node_num(0));
			dst=dst->next;

			ctr++;
			consume(",");
		}
	}


	return arr;
}

Node *call_function(Node *node,Token *tok){
	expect("(");

	node->kind=ND_CALL_FUNC;
	node->str=(char *)calloc(tok->len,sizeof(char));
	strncpy(node->str,tok->str,tok->len);

	int ctr=0;
	// have argument?
	if(!(consume(")"))){
		Node *now;
		Node *prev=NULL;
		while(token->kind == TK_NUM || token->kind == TK_IDENT || token->kind == TK_RESERVED || token->kind == TK_STR){
			now=logical();
			now->next=prev;
			prev=now;
			ctr++;

			if(!(consume(",")))
				break;
		}
		node->next=now;
		node->val=ctr-1;
		expect(")");
	}

	return node;
}

TypeKind get_pointer_type(Type *given){
	while(given->ty==PTR) given=given->ptr_to;
	return given->ty;
}

Node *array_index(Node *node,Node *index){
	Node *pointer_size;

	// a[1] == *(a+1)
	node=new_node(ND_ADD,node,index);

	pointer_size=calloc(1,sizeof(Node));
	pointer_size->kind=ND_NUM;
	pointer_size->val=type_size(get_pointer_type(&(node->lhs->type.ptr_to->ty)));
	node->rhs=new_node(ND_MUL,index,pointer_size);

	node=new_node(ND_DEREF,NULL,node);
	node->type.ty=INT;

	return node;
}

Node *pointer_calc(Node *node,Type *lhs_type,Type *rhs_type){
	int ptrtype;


	node->type.ty=PTR;
	Node *pointer_size=calloc(1,sizeof(Node));
	pointer_size->kind=ND_NUM;


	if(type_size(lhs_type->ty)==8 && lhs_type->ptr_to!=NULL){
		ptrtype=lhs_type->ptr_to->ty;
		pointer_size->val=type_size(ptrtype);
		node->rhs=new_node(ND_MUL,node->rhs,pointer_size);
	}else if(type_size(rhs_type->ty)==8 && rhs_type->ptr_to!=NULL){
		ptrtype=rhs_type->ptr_to->ty;
		pointer_size->val=type_size(ptrtype);
		node->lhs=new_node(ND_MUL,node->lhs,pointer_size);
	}

	return node;
}

void get_argument(int func_index){
	int arg_counter=0;
	Node *next;
	Node **args_ptr;

	// get argument
	if(!(consume(")"))){
		// set args node
		args_ptr=&(func_list[func_index]->args);
		next=*args_ptr;
		while(token->kind == TK_NUM || token->kind == TK_TYPE){
			*args_ptr=(Node *)calloc(1,sizeof(Node));
			(*args_ptr)->kind=ND_ARG;
			(*args_ptr)->val=arg_counter;
			(*args_ptr)->next=expr();
			(*args_ptr)->rhs=next;
			// go to next
			next=*args_ptr;

			arg_counter++;

			if(!(consume(",")))
				break;
		}
		args_ptr=NULL;
		func_list[func_index]->args->val=arg_counter-1;
		expect(")");
	}
}

void declare_global_variable(int star_count,Token* def_name){
	// if not token -> error
	if(!def_name) error_at(token->str,"not a variable.");

	GVar *gvar=calloc(1,sizeof(GVar));
	gvar->next=globals;
	gvar->name=def_name->str;
	gvar->len=def_name->len;
	gvar->type.index_size=(star_count)?8:type_size(gvar->type.ty);

	// add type list
	Type *newtype;
	newtype=&(gvar->type);
	for(int i=0;i<star_count;i++){
		newtype->ty=PTR;
		newtype->ptr_to=calloc(1,sizeof(Type));
		newtype=newtype->ptr_to;
	}

	if(star_count==0) newtype->ptr_to=calloc(1,sizeof(Type));
	newtype->ty=INT;

	// Is array
	if(consume("[")){
		gvar->type.index_size=(token->val)*type_size(gvar->type.ty);
		gvar->type.ty=ARRAY;
		token=token->next;
		expect("]");
	}
	
	// globals == new lvar
	globals=gvar;
	expect(";");
}

Node *declare_local_variable(Node *node,Token *tok,int star_count){
	int i;
	Type *newtype;

	LVar *lvar=find_lvar(tok);
	if(lvar) error_at(token->str,"this variable has already existed.");

	lvar=calloc(1,sizeof(LVar));
	lvar->next=locals;
	lvar->name=tok->str;
	lvar->len=tok->len;
	lvar->type.ty=node->type.ty;

	// add type list
	newtype=&(lvar->type);
	for(i=0;i<star_count;i++){
		newtype->ptr_to=calloc(1,sizeof(Type));
		newtype->ptr_to->ty=newtype->ty;
		newtype->ty=PTR;
		newtype=newtype->ptr_to;
	}

	if(star_count==0) newtype->ptr_to=calloc(1,sizeof(Type));


	// Is array
	if(consume("[")){
		int isize=-1;
		node->val=-1;
		node->kind=ND_LARRAY;

		if(*(token->str)!=']'){
			// body
			int asize=align_array_size(token->val,lvar->type.ptr_to->ty);
			alloc_size+=asize;
			lvar->offset=((locals)?(locals->offset):0) + asize;
			isize=token->val;
			token=token->next;
		}

		// pointer
		lvar->type.ptr_to=calloc(1,sizeof(Type));
		lvar->type.ptr_to->ty=lvar->type.ty;
		lvar->type.ty=ARRAY;
		lvar->type.index_size=isize;

		expect("]");
	}else{
		if(locals)
			lvar->offset=(locals->offset)+8;
		else
			lvar->offset=8;
		alloc_size+=8;
	}

	node->type=lvar->type;
	node->offset=lvar->offset;
	// locals == new lvar
	locals=lvar;

	return node;
}

int align_array_size(int isize,TypeKind array_type){
	int array_size=isize*type_size(array_type);
	return (array_size%8)?array_size/8*8+8:array_size;
}
