#include "cc_sakura.h"

LVar *locals;
GVar  *globals;
Struc *structs;
// int alloc_size;
// Token *token;
// LVar *locals;
// Func *func_list[100];

void insert_type_list(Type *newtype, int star_count){
	for(int i = 0;i<star_count;i++){
		newtype->ptr_to = calloc(1, sizeof(Type));
		newtype->ptr_to->ty = newtype->ty;
		newtype->ty = PTR;
		newtype = newtype->ptr_to;
	}
}

Node *declare_global_variable(int star_count, Token* def_name, Type *toplv_type){
	// if not token -> error
	if(!def_name) error_at(token->str, "not a variable.");

	int index_num;
	Type *newtype;
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_GVAR;

	GVar *gvar = calloc(1, sizeof(GVar));
	gvar->next = globals;
	gvar->name = def_name->str;
	gvar->len  = def_name->len;
	gvar->type = toplv_type;

	// add type list
	insert_type_list(gvar->type, star_count);

	// Is array
	if(check("[")){
		int isize  = -1;
		node->val  = -1;
		node->kind = ND_GARRAY;
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				// body
				if(isize == -1){
					isize = token->val;
				}else{
					isize *= token->val;
				}
				index_num = token->val;
				token = token->next;
			}

			newtype = calloc(1, sizeof(Type));
			newtype->ty         = ARRAY;
			newtype->ptr_to     = gvar->type;
			newtype->index_size = index_num;
			gvar->type = newtype;
			expect("]");
		}
		gvar->memsize = align_array_size(isize, gvar->type->ptr_to);
	}else{
		gvar->memsize = type_size(gvar->type);
	}

	// globals == new lvar
	globals = gvar;

	node->type = gvar->type;
	node->str  = gvar->name;
	node->val  = gvar->len;

	return node;
}

Node *declare_local_variable(Node *node, Token *tok, int star_count){
	LVar *lvar = find_lvar(tok);
	if(lvar) error_at(token->str, "this variable has already existed.");

	lvar = calloc(1, sizeof(LVar));
	lvar->next = locals;
	lvar->name = tok->str;
	lvar->len  = tok->len;
	lvar->type = node->type;

	// add type list
	insert_type_list(lvar->type, star_count);

	// Is array
	if(check("[")){
		Type *newtype;
		int index_num;
		int asize = 0;
		int isize = -1;
		node->kind = ND_LARRAY;
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				if(isize == -1){
					isize = token->val;
				}else{
					isize *= token->val;
				}
				
				index_num = token->val;
				token     = token->next;
			}

			newtype = calloc(1, sizeof(Type));
			newtype->ty         = ARRAY;
			newtype->ptr_to     = lvar->type;
			newtype->index_size = index_num;
			lvar->type = newtype;

			expect("]");
		}

		asize = align_array_size(isize, get_pointer_type(lvar->type));
		alloc_size += asize;
		lvar->offset = ((locals) ? (locals->offset) : 0) + asize;
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
	int asize	  = 0;
	int star_count	  = 0;
	Member *new_memb  = NULL;
	Member *memb_head = NULL;

	while(1){
		if(token->kind != TK_TYPE){
			error_at(token->str, "not a type.");
		}

		new_memb = calloc(1,sizeof(Member));
		new_memb->type = calloc(1,sizeof(Type));

		// check type
		if(consume_reserved_word("int", TK_TYPE))	  new_memb->type->ty = INT;
		else if(consume_reserved_word("char", TK_TYPE))   new_memb->type->ty = CHAR;
		else if(consume_reserved_word("struct", TK_TYPE)) new_memb->type->ty = STRUCT;

		// count asterisk
		while(token->kind == TK_RESERVED && *(token->str) == '*'){
			star_count++;
			token = token->next;
		}

		// add type list
		insert_type_list(new_memb->type, star_count);

		// add member name
		Token *def_name  = consume_ident();
		new_memb->name   = def_name->str;
		new_memb->len    = def_name->len;

		// Is array index
		int isize = -1;
		int index_num;
		Type *newtype;
		while(consume("[")){
			if(isize == -1){
				isize = token->val;
			}else{
				isize *= token->val;
			}
			index_num = token->val;
			token = token->next;

			newtype = calloc(1, sizeof(Type));
			newtype->ty         = ARRAY;
			newtype->ptr_to     = new_memb->type;
			newtype->index_size = index_num;
			new_memb->type = newtype;

			expect("]");
		}

		int size_of_type = type_size(new_memb->type);
		new_memb->offset = ((memb_head)? memb_head->offset : 0) + size_of_type;
		asize += size_of_type;

		new_memb->next = memb_head;
		memb_head      = new_memb;

		expect(";");
		if(consume("}")) break;
	}
	
	asize = (asize%8) ? asize/8*8+8 : asize;
	new_struc->memsize = asize;
	new_struc->member  = memb_head;
	new_struc->next    = structs;
	structs = new_struc;
}
