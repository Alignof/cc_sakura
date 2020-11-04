#include "cc_sakura.h"

// int alloc_size;
// Token *token;
// LVar *locals;
// Func *func_list[100];

Node *compound_assign(TypeKind type, Node *dst, Node *src){
	Node *calc = new_node(type, dst, src);
	Node *new  = new_node(ND_COMPOUND, dst, calc);
	return new;
}

Node *dot_arrow(TypeKind type, Node *node){
	// struc.aaa.bbb.ccc;
	// struc->aaa->bbb->ccc;
	// (lvar <- node -> dot) <- node -> dot
	Node *new = new_node(type, node, NULL);
	Token *memb_name  = consume_ident();
	Member* memb_list;

	if(node->kind == ND_ADDRESS || node->kind == ND_DEREF){
		memb_list = node->rhs->type->member;
	}else{
		memb_list = node->type->member;
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, memb_name->len)){
			new->rhs  = new_node_num(memb_list->offset);
			new->type = memb_list->type;
			break;
		}
		memb_list = memb_list->next;
	}

	return new;
}

/*
Node *dot(Node *node){
	// struc.aaa.bbb.ccc;
	// (lvar <- node -> dot) <- node -> dot
	Node *new = new_node(ND_DOT, node, NULL);
	Token* memb_name  = consume_ident();
	Member* memb_list;

	if(node->kind == ND_ADDRESS || node->kind == ND_DEREF){
		memb_list = node->rhs->type->member;
	}else{
		memb_list = node->type->member;
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, memb_name->len)){
			new->rhs  = new_node_num(memb_list->offset);
			new->type = memb_list->type;
			break;
		}
		memb_list = memb_list->next;
	}

	return new;
}

Node *arrow(Node *node){
	// struc->aaa->bbb->ccc;
	// (lvar <- node -> dot) <- node -> dot
	Node *new = new_node(ND_ARROW, node, NULL);
	Token* memb_name  = consume_ident();
	Member* memb_list;

	if(node->kind == ND_ADDRESS || node->kind == ND_DEREF){
		memb_list = node->rhs->type->member;
	}else{
		memb_list = node->type->member;
	}

	while(memb_list){
		if(memb_list->len == memb_name->len && !memcmp(memb_name->str, memb_list->name, memb_name->len)){
			new->rhs  = new_node_num(memb_list->offset);
			new->type = memb_list->type;
			break;
		}
		memb_list = memb_list->next;
	}

	return new;
}
*/

Node *incdec(Node *node, IncDecKind idtype){
	/*
	 * a++;
	 * a <-- (ND_POSTID) --> a = a+1;
	 *
	 * --a;
	 * a = a-1; <-- (ND_PREID) --> a;
	 */

	Node *new = calloc(1,sizeof(Node));
	Node *plmi_one = calloc(1,sizeof(Node));

	// increment or decrement
	if(idtype == PRE_INC || idtype == POST_INC){
		plmi_one = new_node(ND_ASSIGN, node, new_node(ND_ADD,node,new_node_num(1)));
	}else{
		plmi_one = new_node(ND_ASSIGN, node, new_node(ND_SUB,node,new_node_num(1)));
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

Node *init_formula(Node *node, Node *init_val){
	switch(init_val->kind){
		case ND_STR:
			if(node->type->ty == PTR){
				node = new_node(ND_ASSIGN, node, init_val);
			}else if(node->type->ty == ARRAY){
				if(node->type->index_size == init_val->offset+1 || node->type->index_size == -1){
					node = array_str(node, init_val);
				}else{
					error_at(token->str, "Invalid array size");
				}
			}else{
				error_at(token->str, "Invalid assign");
			}
			break;
		default:
			node = new_node(ND_ASSIGN, node, init_val);
			break;
	}

	return node;
}

Node *array_str(Node *arr, Node *init_val){
	int ctr	  = 0;
	int isize = arr->type->index_size;
	Node *head;
	Node *src;
	Node *dst = calloc(1, sizeof(Node));

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(ctr < init_val->offset){
		src = array_index(clone, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, new_node_num(*(init_val->str + ctr)));
			head = dst;
		}else{
			dst->next = new_node(ND_ASSIGN, src, new_node_num(*(init_val->str + ctr)));
			dst = dst->next;
		}
		ctr++;
	}

	// '\0'
	dst->next = new_node(ND_ASSIGN, array_index(clone, new_node_num(init_val->offset)), new_node_num('\0'));
	dst = dst->next;
	ctr++;

	// ommitted
	if(isize == -1){
		if(arr->kind == ND_LARRAY){
			int asize = align_array_size(ctr, arr->type->ptr_to->ty);
			alloc_size+=asize;
			arr->offset = ((locals)?(locals->offset):0) + asize;
			clone->offset = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
		}else{
			globals->memsize = align_array_size(ctr, arr->type->ptr_to->ty);
		}
	}

	return head;
}

Node *array_block(Node *arr){
	int ctr = 0;
	int isize = arr->type->index_size;
	Node *src;
	Node *dst = calloc(1, sizeof(Node));
	Node *head;

	Node *clone = calloc(1, sizeof(Node));
	memcpy(clone, arr, sizeof(Node));
	clone->kind = arr->kind;

	while(token->kind!=TK_BLOCK){
		src = array_index(clone, new_node_num(ctr));
		//Is first?
		if(ctr == 0){
			dst = new_node(ND_ASSIGN, src, expr());
			head = dst;
		}else{
			dst->next = new_node(ND_ASSIGN, src, expr());
			dst = dst->next;
		}
		consume(",");
		ctr++;
	}

	expect("}");
	
	// ommitted
	if(isize == -1){
		if(arr->kind == ND_LARRAY){
			int asize = align_array_size(ctr, arr->type->ptr_to->ty);
			alloc_size+=asize;
			arr->offset = ((locals)?(locals->offset):0) + asize;
			clone->offset = arr->offset;
			locals->offset = arr->offset;
			locals->type->index_size = ctr;
		}else{
			globals->memsize = align_array_size(ctr, arr->type->ptr_to->ty);
		}
	// too many
	}else if(arr->type->index_size < ctr){
		error_at(token->str, "Invalid array size");
	// too little
	}else if(arr->type->index_size > ctr){
		while(ctr != arr->type->index_size){
			src = array_index(clone, new_node_num(ctr));
			dst->next = new_node(ND_ASSIGN, src, new_node_num(0));
			dst = dst->next;

			ctr++;
			consume(",");
		}
	}


	return head;
}

Node *call_function(Node *node, Token *tok){
	expect("(");

	node->kind = ND_CALL_FUNC;
	node->str = (char *)calloc(tok->len, sizeof(char));
	strncpy(node->str, tok->str, tok->len);

	int ctr = 0;
	// have argument?
	if(!(consume(")"))){
		Node *now;
		Node *prev = NULL;
		while(token->kind == TK_NUM || token->kind == TK_IDENT || token->kind == TK_RESERVED ||
			token->kind == TK_SIZEOF || token->kind == TK_STR){

			now = logical();
			now->next = prev;
			prev = now;
			ctr++;

			if(!(consume(","))) break;
		}
		node->next = now;
		node->val = ctr-1;
		expect(")");
	}

	return node;
}

Node *array_index(Node *node, Node *index){
	Node *pointer_size;

	// a[1] == *(a+1)
	node = new_node(ND_ADD, node, index);

	pointer_size = calloc(1, sizeof(Node));
	pointer_size->kind = ND_NUM;
	pointer_size->val  = type_size(get_pointer_type(node->lhs->type->ptr_to));
	pointer_size->type = calloc(1, sizeof(Type));
	node->rhs = new_node(ND_MUL, index, pointer_size);

	node = new_node(ND_DEREF, NULL, node);

	return node;
}

void get_argument(int func_index){
	int arg_counter = 0;
	Node *next;
	Node **args_ptr;

	// get argument
	if(!(consume(")"))){
		// set args node
		args_ptr = &(func_list[func_index]->args);
		next = *args_ptr;
		while(token->kind == TK_NUM || token->kind == TK_TYPE){
			*args_ptr = (Node *)calloc(1, sizeof(Node));
			(*args_ptr)->kind = ND_ARG;
			(*args_ptr)->val = arg_counter;
			(*args_ptr)->next = expr();
			(*args_ptr)->rhs = next;
			// go to next
			next = *args_ptr;

			arg_counter++;

			if(!(consume(","))){
				break;
			}
		}
		args_ptr = NULL;
		func_list[func_index]->args->val = arg_counter-1;
		expect(")");
	}
}
