#include "cc_sakura.h"

Node *global_init(Node *node){
	Node *init_val = NULL;
	if(check("\"")){
		if(node->type->ty == ARRAY){
			consume("\"");
			Token *tok = consume_string();
			expect("\"");
			init_val   = new_node(ND_STR, NULL, NULL);
			init_val->str      = tok->str;
			init_val->len      = tok->len;
			init_val->type->ty = PTR;

			if(node->type->index_size != -1 && init_val->len+1 != node->type->index_size){
				error_at(token->str, "invalid global variable initialize");
			}else if(node->type->index_size != -1 && init_val->len+1 < node->type->index_size){
				init_val->len = node->type->index_size - init_val->len - 1;
			}
		}else{
			init_val = assign();
		}
	}else if(consume("{")){
		int ctr   = 0;
		Node *new = NULL;
		init_val  = new_node(ND_BLOCK, NULL, NULL);
		while(token->kind != TK_BLOCK){
			//Is first?
			if(ctr == 0){
				new = expr();
				init_val->rhs = new;
			}else{
				new->block_code = expr();
				new = new->block_code;
			}

			if(new->kind == ND_STR && node->type->ty == ARRAY){
				if(node->type->index_size != -1 && new->len > node->type->index_size){
					error_at(token->str, "invalid global variable initialize");
				}else if(node->type->ptr_to->index_size != -1 && new->len < node->type->index_size){
					new->offset = node->type->ptr_to->index_size - new->len - 1;
				}
			}
			consume(",");
			ctr++;
		}

		expect("}");

		// too many
		if(node->type->index_size != -1 && node->type->index_size < ctr){
			error_at(token->str, "Invalid array size");
		// too little
		}else if(node->type->index_size > ctr){
			init_val->offset = (node->type->index_size - ctr) * node->type->ptr_to->size;
		}
	}else{
		init_val = assign();
	}

	return init_val;
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
	Type *struc_type;
	Node *new = new_node(type, node, NULL);
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
		memb_list = find_struct_member(struc_type, IGNORE_SCOPE);
	}else{
		memb_list = find_struct_member(struc_type->ptr_to, IGNORE_SCOPE);
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, (size_t)memb_name->len)){
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

	Node *new      = calloc(1,sizeof(Node));
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

Node *init_formula(Node *node){
	int is_const = node->type->is_const;
	node->type->is_const = 0;

	if(consume("{")){
		node = array_block(node);
	}else if(check("\"")){
		node = array_str(node);
	}else{
		node = new_node(ND_ASSIGN, node, assign());
	}

	if(is_const) node->type->is_const = 1;
	return node;
}

Node *array_str(Node *arr){
	int ctr	   = 0;
	int isize  = arr->type->index_size;

	if(arr->type->ty == PTR){
		return new_node(ND_ASSIGN, arr, assign());
	}

	if(arr->type->ty != ARRAY){
		error_at(token->str, "Invalid assign");
	}

	Node *src  = NULL;
	Node *dst  = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, NULL, NULL);

	consume("\"");
	Token *tok = consume_string();
	while(ctr < tok->len){
		src = array_index(arr, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, new_node_num((int)*(tok->str + ctr)));
			node->rhs = dst;
		}else{
			dst->block_code = new_node(ND_ASSIGN, src, new_node_num((int)*(tok->str + ctr)));
			dst = dst->block_code;
		}
		consume(",");
		ctr++;
	}
	expect("\"");

	// '\0'
	dst->block_code = new_node(ND_ASSIGN, array_index(arr, new_node_num(tok->len)), new_node_num('\0'));
	dst = dst->block_code;
	ctr++;

	// ommitted
	if(isize == -1){
		int asize  = arr->type->ptr_to->size * ctr;
		alloc_size += asize;
		arr->offset    = ((locals)?(locals->offset):0) + asize;
		locals->offset = arr->offset;
		locals->type->index_size = ctr;
		locals->type->size  = type_size(locals->type);
		locals->type->align = type_size(locals->type);
	}
	return node;
}

Node *array_block(Node *arr){
	int ctr = 0;
	int isize = arr->type->index_size;
	Node *src;
	Node *dst  = calloc(1, sizeof(Node));
	Node *node = new_node(ND_BLOCK, NULL, NULL);

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(token->kind != TK_BLOCK){
		src = array_index(clone, new_node_num(ctr));
		src->type->is_const = 0;
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
		if(arr->type->ty == ARRAY){
			int asize  = arr->type->ptr_to->size * ctr;
			alloc_size += asize;
			arr->offset    = ((locals)?(locals->offset):0) + asize;
			clone->offset  = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
			locals->type->size  = type_size(locals->type);
			locals->type->align = type_size(locals->type);
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
	node->len  = tok->len;

	// have argument?
	if(consume(")")) return node;

	int ctr   = 0;
	Node *new = NULL;
	while(1){
		if(new == NULL){
			new        = assign();
			node->rhs  = new;
		}else{
			new->block_code = assign();
			new             = new->block_code;
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
	node = new_node(ND_DEREF, NULL, node);

	return node;
}

void get_argument(Func *target_func){
	if(consume_reserved_word("void", TK_TYPE) || check(")")){
		target_func->args = NULL;
		expect(")");
		return;
	}

	// set args node
	Node *new_arg = NULL;
	int arg_counter = 0;

	while(token->kind == TK_CONST || token->kind == TK_NUM ||
	      token->kind == TK_TYPE  || find_defined_type(token, 0)){
		if(new_arg == NULL){
			new_arg       = calloc(1, sizeof(Node));
			new_arg->kind = ND_ARG;
			new_arg->val  = arg_counter;
			new_arg->rhs  = expr();
			target_func->args = new_arg;
		}else{
			new_arg->next       = calloc(1, sizeof(Node));
			new_arg->next->kind = ND_ARG;
			new_arg->next->val  = arg_counter;
			new_arg->next->rhs  = expr();
			new_arg             = new_arg->next;
		}

		// Implicit Type Conversion 
		if(new_arg->rhs->type->ty == ARRAY){
			new_arg->rhs->type->ty = PTR;
			new_arg->rhs->offset   -= new_arg->rhs->type->size;
			new_arg->rhs->offset   += SIZE_PTR;
			locals->offset         = new_arg->rhs->offset;
			locals->type->size     = new_arg->rhs->type->size;
			alloc_size -= new_arg->rhs->type->size;
			alloc_size += SIZE_PTR;
		}

		arg_counter++;
		if(!(consume(","))) break;
	}
	expect(")");
}
