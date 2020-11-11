#include "cc_sakura.h"

int type_size(Type *type){
	int array_size;
	switch(type->ty){
		case CHAR:
			return 1;
		case INT:
			return 4;
		case PTR:
			return 8;
		case ARRAY:
			array_size = 1;
			while(type){
				if(type->ty == ARRAY){
					array_size *= type->index_size;
				}else{
					array_size *= type_size(type);
				}

				type = type->ptr_to;
			}

			return array_size;
		case STRUCT:
			return 8;
		default:
			error_at(token->str, "unknown type");
	}

	return -1;
}

int align_array_size(int isize, Type *array_type){
	int array_size = isize*type_size(array_type);
	return (array_size%8) ? array_size/8*8+8 : array_size;
}


Type *get_pointer_type(Type *given){
	while(given->ptr_to != NULL) given = given->ptr_to;
	return given;
}

Node *pointer_calc(Node *node, Type *lhs_type, Type *rhs_type){
	Type *ptrtype;


	node->type = (lhs_type->ty > rhs_type->ty)? lhs_type : rhs_type;
	Node *pointer_size = calloc(1, sizeof(Node));
	pointer_size->kind = ND_NUM;
	pointer_size->type = calloc(1, sizeof(Type));
	pointer_size->type->ty = INT;


	if(lhs_type->ty >= PTR  &&  lhs_type->ptr_to!=NULL){
		ptrtype = lhs_type->ptr_to;
		pointer_size->val = type_size(ptrtype);
		node->rhs = new_node(ND_MUL, node->rhs, pointer_size);
	}else if(rhs_type->ty >= PTR  &&  rhs_type->ptr_to!=NULL){
		ptrtype = rhs_type->ptr_to;
		pointer_size->val = type_size(ptrtype);
		node->lhs = new_node(ND_MUL, node->lhs, pointer_size);
	}

	return node;
}
