#include "cc_sakura.h"

int type_size(TypeKind type){
	switch(type){
		case CHAR:
			return 1;
		case INT:
			return 4;
		case PTR:
			return 8;
		case ARRAY:
			return 8;
		default:
			error_at(token->str, "unknown type");
	}

	return -1;
}

int align_array_size(int isize, TypeKind array_type){
	int array_size = isize*type_size(array_type);
	return (array_size%8) ? array_size/8*8+8 : array_size;
}


TypeKind get_pointer_type(Type *given){
	while(given->ptr_to != NULL) given = given->ptr_to;
	return given->ty;
}

Node *pointer_calc(Node *node, Type lhs_type, Type rhs_type){
	int ptrtype;


	node->type.ty = PTR;
	Node *pointer_size = calloc(1, sizeof(Node));
	pointer_size->kind = ND_NUM;


	if(type_size(lhs_type.ty) == 8 && lhs_type.ptr_to!=NULL){
		ptrtype = lhs_type.ptr_to->ty;
		pointer_size->val = type_size(ptrtype);
		node->rhs = new_node(ND_MUL, node->rhs, pointer_size);
	}else if(type_size(rhs_type.ty) == 8 && rhs_type.ptr_to!=NULL){
		ptrtype = rhs_type.ptr_to->ty;
		pointer_size->val = type_size(ptrtype);
		node->lhs = new_node(ND_MUL, node->lhs, pointer_size);
	}

	return node;
}
