#include "cc_sakura.h"

LVar     *locals;
GVar     *globals;
Struc    *structs;
Enum     *enumerations;
Def_Type *defined_types;
LVar     *outside_lvar;
Struc    *outside_struct;
Enum     *outside_enum;
Def_Type *outside_deftype;

Type *set_type(Type *type, Token *tok){
	Enum  *enum_found  = NULL;
	Struc *struc_found = NULL;

	switch(type->ty){
		case VOID:
		case BOOL:
		case CHAR:
		case INT:
		case LONG:
		case PTR:
		case ARRAY:
			break;
		case STRUCT:
			// find with tag name
			struc_found = find_struc(tok, IGNORE_SCOPE);
			type->len   = tok->len;
			type->name  = tok->str;
			if(struc_found){
				type->ty   = STRUCT;
				type->size = struc_found->memsize;
				// unname enum
				if(struc_found->member == NULL && consume("{")){
					struc_found->member = register_struc_member(&(struc_found->memsize));
				}
			}else{
				Struc *new_struc = calloc(1,sizeof(Struc));
				new_struc->len   = tok->len;
				new_struc->name  = tok->str;
				// normal declare
				if(consume("{")){
					declare_struct(new_struc);
					type->ty        = STRUCT;
					type->size      = structs->memsize;
				// in typedef
				}else{
					type->ty        = STRUCT;
					new_struc->next = structs;
					structs         = new_struc;
				}
			}

			break;
		case ENUM:
			if(tok){
				enum_found = find_enum(tok, IGNORE_SCOPE);
			}

			if(enum_found){
				type->ty = ENUM;
				if(enum_found->member == NULL && consume("{")){
					enum_found->member = register_enum_member();
				}
			}else{
				Enum *new_enum = calloc(1,sizeof(Struc));
				if(tok){
					new_enum->len   = tok->len;
					new_enum->name  = tok->str;
				}
				if(consume("{")){
					if(enum_found) error_at(token->str, "multiple definition");
					declare_enum(new_enum);
					type->ty        = ENUM;
				}else{
					new_enum->next  = enumerations;
					enumerations    = new_enum;
					type->ty        = ENUM;
				}
			}
			break;
	}

	return type;
}

Type *parse_type(void){
	Type *type = calloc(1, sizeof(Type));
	int is_const   = 0;
	int star_count = 0;

	// const
	if(consume_reserved_word("const", TK_CONST)){
		is_const = 1;
	}

	// check type
	if(consume_reserved_word("void", TK_TYPE)){
		type->ty = VOID;
		type = set_type(type, NULL);
	}else if(consume_reserved_word("_Bool", TK_TYPE)){
		type->ty = BOOL;
		type = set_type(type, NULL);
	}else if(consume_reserved_word("char", TK_TYPE)){
		type->ty = CHAR;
		type = set_type(type, NULL);
	}else if(consume_reserved_word("int", TK_TYPE)){
		type->ty = INT;
		type = set_type(type, NULL);
	}else if(consume_reserved_word("long", TK_TYPE)){
		type->ty = LONG;
		type = set_type(type, NULL);
	}else if(consume_reserved_word("struct", TK_TYPE)){
		type->ty = STRUCT;
		type = set_type(type, consume_ident());
	}else if(consume_reserved_word("enum", TK_TYPE)){
		type->ty = ENUM;
		type = set_type(type, consume_ident());
	}else{
		Token *tok = consume_ident();
		Def_Type *def_found = find_defined_type(tok, IGNORE_SCOPE);
		if(def_found){
			tok->str = def_found->tag;
			tok->len = def_found->tag_len;
			type     = set_type(def_found->type, tok);
		}else{
			error_at(tok->str, "unknown type.");
		}
	}

	type->size     = type_size(type);
	type->align    = type_align(type);
	type->is_const = is_const;


	// count asterisk
	while(token->kind == TK_RESERVED && *(token->str) == '*'){
		star_count++;
		token = token->next;
	}

	// add ptr
	type = insert_ptr_type(type, star_count);
	return type;
}

Type *insert_ptr_type(Type *prev, int star_count){
	Type *newtype;
	if(star_count == 0) return prev;

	for(int i = 0;i<star_count;i++){
		newtype = calloc(1, sizeof(Type));
		newtype->ty     = PTR;
		newtype->size   = type_size(newtype);
		newtype->align  = type_align(newtype);
		newtype->ptr_to = prev;
		newtype->is_extern       = prev->is_extern;
		newtype->is_thread_local = prev->is_thread_local;
		prev = newtype;
	}

	if(consume_reserved_word("const", TK_CONST)){
		newtype->is_const = 1;
	}

	return newtype;
}

Node *declare_global_variable(int star_count, Token* def_name, Type *toplv_type){
	// if not token -> error
	if(!def_name) error_at(token->str, "not a variable.");

	int index_num;
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_GVAR;

	GVar *gvar = calloc(1, sizeof(GVar));
	gvar->next = globals;
	gvar->len  = def_name->len;
	gvar->name = def_name->str;
	toplv_type->size  = type_size(toplv_type);
	toplv_type->align = type_align(toplv_type);

	// add type list
	gvar->type = insert_ptr_type(gvar->type, star_count);

	// Is array
	if(check("[")){
		node->val     = -1;
		Type *newtype = calloc(1, sizeof(Type));
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				index_num = token->val;
				token = token->next;
			}

			newtype->ptr_to = calloc(1, sizeof(Type));
			newtype->ptr_to->ty              = ARRAY;
			newtype->ptr_to->index_size      = index_num;
			newtype->ptr_to->is_extern       = toplv_type->is_extern;
			newtype->ptr_to->is_thread_local = toplv_type->is_thread_local;
			newtype = newtype->ptr_to;

			if(gvar->type == NULL){
				gvar->type = newtype;
			}
			expect("]");
		}
		newtype->ptr_to = toplv_type;
	}else{
		gvar->type      = toplv_type;
	}

	gvar->type->size = type_size(gvar->type);
	gvar->memsize    = gvar->type->size;

	// globals == new gvar
	globals = gvar;
	node->type = gvar->type;
	node->str  = gvar->name;
	node->val  = gvar->len;

	return node;
}

Node *declare_local_variable(Node *node, Token *tok, int star_count){
	LVar *lvar = find_lvar(tok, CONSIDER_SCOPE);
	if(lvar) error_at(token->str, "this variable has already existed.");

	lvar = calloc(1, sizeof(LVar));
	lvar->next = locals;
	lvar->name = tok->str;
	lvar->len  = tok->len;

	// Is array
	if(check("[")){
		Type *newtype = calloc(1, sizeof(Type));
		int index_num;
		while(consume("[")){
			index_num = -1;
			if(!check("]")){
				index_num = token->val;
				token     = token->next;
			}

			newtype->ptr_to = calloc(1, sizeof(Type));
			newtype->ptr_to->ty         = ARRAY;
			newtype->ptr_to->index_size = index_num;
			newtype = newtype->ptr_to;

			if(lvar->type == NULL){
				lvar->type = newtype;
			}
			expect("]");
		}
		newtype->ptr_to = node->type;
	}else{
		lvar->type      = node->type;
	}

	lvar->type->size  = type_size(lvar->type);
	lvar->type->align = type_align(lvar->type);
	lvar->offset      = ((locals) ? (locals->offset) : 0) + lvar->type->size;

	node->type   = lvar->type;
	node->offset = lvar->offset;
	alloc_size   += lvar->type->size;
	locals = lvar;

	return node;
}

Member *register_struc_member(int *asize_ptr){
	int size_of_type;
	Member *new_memb  = NULL;
	Member *memb_head = NULL;

	while(1){
		if(!(token->kind == TK_TYPE || find_defined_type(token, IGNORE_SCOPE))){
			error_at(token->str, "not a type.");
		}

		new_memb = calloc(1,sizeof(Member));

		// parse member type
		Type *memb_type  = parse_type();

		// add member name
		Token *def_name  = consume_ident();
		new_memb->name   = def_name->str;
		new_memb->len    = def_name->len;

		// Is array
		if(check("[")){
			int index_num;
			Type *newtype = calloc(1, sizeof(Type));
			while(consume("[")){
				index_num = -1;
				if(!check("]")){
					index_num = token->val;
					token     = token->next;
				}

				newtype->ptr_to = calloc(1, sizeof(Type));
				newtype->ptr_to->ty         = ARRAY;
				newtype->ptr_to->index_size = index_num;
				newtype = newtype->ptr_to;

				if(new_memb->type == NULL){
					new_memb->type = newtype;
				}
				expect("]");
			}
			newtype->ptr_to = memb_type;
		}else{
			new_memb->type  = memb_type;
		}
		new_memb->type->size  = type_size(new_memb->type);
		new_memb->type->align = type_align(new_memb->type);

		int padding = 0;
		new_memb->memsize = new_memb->type->size;
		size_of_type      = new_memb->memsize;

		if(memb_head){
			int prev_tail    = (memb_head) ? (memb_head->offset + memb_head->type->size) : 0;
			padding          = (prev_tail % new_memb->type->align) ? (new_memb->type->align - (prev_tail % new_memb->type->align)) : 0;
			new_memb->offset = prev_tail + padding;
		}else{
			new_memb->offset = 0;
		}
		(*asize_ptr) += size_of_type + padding;

		new_memb->next = memb_head;
		memb_head      = new_memb;

		expect(";");
		if(consume("}")) break;
	}

	return memb_head;
}

void declare_struct(Struc *new_struc){
	int asize = 0;

	new_struc->member  = register_struc_member(&asize);
	new_struc->memsize = asize;
	new_struc->next    = structs;
	structs = new_struc;
}

Member *register_enum_member(void){
	int counter = 0;
	Member *new_memb  = NULL;
	Member *memb_head = NULL;

	while(1){
		new_memb = calloc(1,sizeof(Member));

		if(token->kind != TK_IDENT) error_at(token->str, "expected ‘,’ or ‘}’");
		// add member name
		Token *def_name  = consume_ident();
		new_memb->name   = def_name->str;
		new_memb->len    = def_name->len;

		if(consume("=")){
			if(token->kind != TK_NUM){
				error_at(token->str, "enumerator value is not an integer constant");
			}

			counter	         = token->val;
			new_memb->offset = counter;
			token            = token->next;
		}else{
			new_memb->offset = counter;
			counter++;
		}

		new_memb->next   = memb_head;
		memb_head        = new_memb;

		if(consume(","));
		if(consume("}")) break;
	}

	return memb_head;
}

void declare_enum(Enum *new_enum){
	new_enum->member = register_enum_member();
	new_enum->next   = enumerations;
	enumerations     = new_enum;
}
