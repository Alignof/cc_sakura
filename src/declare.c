#include "cc_sakura.h"

GVar *globals;
// int alloc_size;
// Token *token;
// LVar *locals;
// Func *func_list[100];


Node *declare_global_variable(int star_count, Token* def_name, Type toplv_type){
	// if not token -> error
	if(!def_name) error_at(token->str, "not a variable.");

	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_GVAR;

	GVar *gvar = calloc(1, sizeof(GVar));
	gvar->next = globals;
	gvar->name = def_name->str;
	gvar->len = def_name->len;
	gvar->type = toplv_type;

	// add type list
	Type *newtype;
	newtype = &(gvar->type);
	for(int i = 0;i<star_count;i++){
		newtype->ptr_to = calloc(1, sizeof(Type));
		newtype->ptr_to->ty = newtype->ty;
		newtype->ty = PTR;
		newtype = newtype->ptr_to;
	}

	if(star_count == 0) newtype->ptr_to = calloc(1, sizeof(Type));

	// Is array
	if(consume("[")){
		int isize = -1;
		node->val = -1;
		node->kind = ND_GARRAY;

		if(*(token->str)!=']'){
			// body
			isize = token->val;
			gvar->memsize = align_array_size(token->val, gvar->type.ptr_to->ty);
			token = token->next;
		}

		gvar->type.ptr_to = calloc(1, sizeof(Type));
		gvar->type.ptr_to->ty = gvar->type.ty;
		gvar->type.index_size = isize;
		gvar->type.ty = ARRAY;
		expect("]");
	}else{
		gvar->memsize = type_size(gvar->type.ty);
	}
	
	// globals == new lvar
	globals = gvar;

	node->type = gvar->type;
	node->str = gvar->name;
	node->val = gvar->len;

	return node;
}

Node *declare_local_variable(Node *node, Token *tok, int star_count){
	int i;
	Type *newtype;

	LVar *lvar = find_lvar(tok);
	if(lvar) error_at(token->str, "this variable has already existed.");

	lvar = calloc(1, sizeof(LVar));
	lvar->next = locals;
	lvar->name = tok->str;
	lvar->len = tok->len;
	lvar->type.ty = node->type.ty;

	// add type list
	newtype = &(lvar->type);
	for(i = 0;i<star_count;i++){
		newtype->ptr_to = calloc(1, sizeof(Type));
		newtype->ptr_to->ty = newtype->ty;
		newtype->ty = PTR;
		newtype = newtype->ptr_to;
	}

	if(star_count == 0){
		newtype->ptr_to = NULL;
	}


	// Is array
	if(consume("[")){
		int isize = -1;
		node->val = -1;
		node->kind = ND_LARRAY;

		lvar->type.ptr_to = calloc(1, sizeof(Type));
		lvar->type.ptr_to->ty = lvar->type.ty;
		lvar->type.ty = ARRAY;

		if(*(token->str)!=']'){
			int asize = align_array_size(token->val, lvar->type.ptr_to->ty);
			alloc_size+=asize;
			lvar->offset = ((locals) ? (locals->offset) :0) + asize;
			isize = token->val;
			token = token->next;
		}

		lvar->type.index_size = isize;

		expect("]");
	}else{
		if(locals){
			lvar->offset = (locals->offset)+8;
		}else{
			lvar->offset = 8;
		}
		alloc_size+=8;
	}

	node->type = lvar->type;
	node->offset = lvar->offset;
	// locals == new lvar
	locals = lvar;

	return node;
}


void declare_struct(Struc *new_struc){

	return;
}
