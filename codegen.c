#include "cc_sakura.h"

Node *new_node(NodeKind kind,Node *lhs,Node *rhs){
	//create new node(symbol)
	Node *node=calloc(1,sizeof(Node));
	node->kind=kind;
	node->lhs=lhs;
	node->rhs=rhs;
	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node=calloc(1,sizeof(Node));
	node->kind=ND_NUM;
	node->val=val;
	return node;
}

Node *primary(){
	if(consume("(")){
		//jmp expr
		Node *node=expr();
		//check end of caret
		expect(")");
		return node;
	}
	//return new num node
	return new_node_num(expect_number());
}

Node *unary(){
	if(consume("+"))
		//ignore +
		return primary();
	if(consume("-"))
		//convert 0-n
		return new_node(ND_SUB,new_node_num(0),primary());

	return primary();
}

Node *mul(){
	//jmp unary()
	Node *node=unary();

	for(;;){
		// is * and move the pointer next
		if(consume("*")){
			//create new node and jmp unary
			node=new_node(ND_MUL,node,unary());
		}else if(consume("/")){
			node=new_node(ND_DIV,node,unary());
		}else{
			return node;
		}
	}
}

Node *add(){
	//jmp mul()
	Node *node=mul();

	for(;;){
		if(consume("+")){
			node=new_node(ND_ADD,node,mul());
		}else if(consume("-")){
			node=new_node(ND_SUB,node,mul());
		}else{
			return node;
		}
	}
}

Node *relational(){
	Node *node=add();

	for(;;){
		//prefer multi symbol
		if(consume(">=")){
			node=new_node(ND_GE,node,add());
		}else if(consume("<=")){
			node=new_node(ND_LE,node,add());
		}else if(consume(">")){
			node=new_node(ND_GT,node,add());
		}else if(consume("<")){
			node=new_node(ND_LT,node,add());
		}else{
			return node;
		}
		
	}
}

Node *expr(){
	Node *node=relational();

	for(;;){
		if(consume("==")){
			node=new_node(ND_EQ,node,relational());
		}else if(consume("!=")){
			node=new_node(ND_NE,node,relational());
		}else{
			return node;
		}
	}
}


void gen(Node *node){
	if(node->kind==ND_NUM){
		printf("push %d\n",node->val);
		return;
	}

	//check left hand side
	gen(node->lhs);
	//check right hand side
	gen(node->rhs);

	printf("	pop rdi\n");
	printf("	pop rax\n");

	switch(node->kind){
		case ND_ADD:
			printf("	add rax,rdi\n");
			break;
		case ND_SUB:
			printf("	sub rax,rdi\n");
			break;
		case ND_MUL:
			printf("	imul rax,rdi\n");
			break;
		case ND_DIV:
			printf("	cqo\n");
			printf("	idiv rax,rdi\n");
			break;
		case ND_GT:
			printf("	cmp rdi,rax\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_GE:
			printf("	cmp rdi,rax\n");
			printf("	setge al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LT:
			printf("	cmp rax,rdi\n");
			printf("	setl al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_LE:
			printf("	cmp rax,rdi\n");
			printf("	setle al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_EQ:
			printf("	cmp rax,rdi\n");
			printf("	sete al\n");
			printf("	movzb rax,al\n");
			break;
		case ND_NE:
			printf("	cmp rax,rdi\n");
			printf("	setne al\n");
			printf("	movzb rax,al\n");
			break;
	}

	printf("	push rax\n");
}

