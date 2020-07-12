#include "cc_sakura.h"

Node *call_function(Node *node,Token *tok){
	expect("(");

	node->kind=ND_CALL_FUNC;
	node->str=(char *)calloc(tok->len,sizeof(char));
	strncpy(node->str,tok->str,tok->len);

	// have argument?
	if(!(consume(")"))){
		Node *now=node;
		while(token->kind == TK_NUM || token->kind == TK_IDENT || token->kind == TK_RESERVED){
			now->vector=equelity();
			now=now->vector;

			if(!(consume(",")))
				break;
		}
		now->vector=NULL;
		expect(")");
	}

	return node;
}

Node *array_index(Node *node){
	Node *pointer_size;
	// Is array index
	expect("[");

	// a[1] == *(a+1)
	node=new_node(ND_ADD,node,mul());

	pointer_size=calloc(1,sizeof(Node));
	pointer_size->kind=ND_NUM;
	pointer_size->val=8;
	node->rhs=new_node(ND_MUL,node->rhs,pointer_size);

	node=new_node(ND_DEREF,new_node_num(0),node);
	node->type.ty=INT;

	expect("]");

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
			(*args_ptr)->vector=expr();
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
	if(!def_name) error(token->str,"not a variable.");

	GVar *gvar=calloc(1,sizeof(GVar));
	gvar->next=globals;
	gvar->name=def_name->str;
	gvar->len=def_name->len;
	gvar->type.alloc_size=(star_count)?8:4;

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
		gvar->type.alloc_size=(token->val)*8;
		gvar->type.ty=ARRAY;
		token=token->next;
		expect("]");
	}
	
	// locals == new lvar
	globals=gvar;
	expect(";");
}

Node *declare_local_variable(Node *node,Token *tok,int star_count){
	int i;
	Type *newtype;

	node=calloc(1,sizeof(Node));
	node->kind=ND_LVAR;
	LVar *lvar=find_lvar(tok);

	if(lvar) error(token->str,"this variable has already existed.");

	lvar=calloc(1,sizeof(LVar));
	lvar->next=locals;
	lvar->name=tok->str;
	lvar->len=tok->len;
	lvar_count++;

	// add type list
	newtype=&(lvar->type);
	for(i=0;i<star_count;i++){
		newtype->ty=PTR;
		newtype->ptr_to=calloc(1,sizeof(Type));
		newtype=newtype->ptr_to;
	}

	if(star_count==0) newtype->ptr_to=calloc(1,sizeof(Type));
	newtype->ty=INT;

	if(locals)
		lvar->offset=(locals->offset)+8;
	else
		lvar->offset=8;

	// Is array
	if(consume("[")){
		lvar_count+=(token->val)-1;
		lvar->type.alloc_size=(token->val)*8;
		lvar->offset+=(lvar->type.alloc_size)-8;
		token=token->next;
		expect("]");

		lvar->type.ty=ARRAY;
	}

	node->type=lvar->type;
	node->offset=lvar->offset;
	// locals == new lvar
	locals=lvar;

	return node;
}
