#include "cc_sakura.h"

void call_function(Node *node,Token *tok){
	expect("(");

	node->kind=ND_CALL_FUNC;
	node->str=(char *)calloc(tok->len,sizeof(char));
	strncpy(node->str,tok->str,tok->len);

	// have argument?
	if(!(consume(")"))){
		Node *tmp=node;
		while(token->kind == TK_NUM || token->kind == TK_IDENT || token->kind == TK_RESERVED){
			tmp->vector=equelity();
			tmp=tmp->vector;

			if(!(consume(",")))
				break;
		}
		tmp->vector=NULL;
		expect(")");
	}
}

void array_index(Node *node){
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
}

void pointer_calc(Node *node,Type *lhs_type,Type *rhs_type){
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
}
