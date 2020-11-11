#include "cc_sakura.h"

int type_size(Type *type){
	switch(type->ty){
		case CHAR:
			return 1;
		case INT:
			return 4;
		case PTR:
			return 8;
		case ARRAY:
			return 8;
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


	node->type->ty = PTR;
	Node *pointer_size = calloc(1, sizeof(Node));
	pointer_size->kind = ND_NUM;
	pointer_size->type = calloc(1, sizeof(Type));
	pointer_size->type->ty = INT;


	if(type_size(lhs_type) == 8 && lhs_type->ptr_to!=NULL){
		ptrtype = lhs_type->ptr_to;
		pointer_size->val = type_size(ptrtype);
		node->rhs = new_node(ND_MUL, node->rhs, pointer_size);
	}else if(type_size(rhs_type) == 8 && rhs_type->ptr_to!=NULL){
		ptrtype = rhs_type->ptr_to;
		pointer_size->val = type_size(ptrtype);
		node->lhs = new_node(ND_MUL, node->lhs, pointer_size);
	}

	return node;
}
