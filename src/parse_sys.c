#include "cc_sakura.h"

void error_at(char *loc, char *msg){
	while((user_input < loc) && (loc[-1] == '\n' || loc[-1] == '\t')) loc--;

	char *start = loc;
	while((user_input < start) && (start[-1] != '\n')) start--;

	char *end = loc;
	while(*end != '\n') end++;

	int line_num = 1;
	for(char *c = user_input;c < loc;c++){
		if(*c == '\n') line_num++;
	}

	// consume \t
	while(*start == '\t') start++;

	int indent = fprintf(stderr, "%s:%d ", filename, line_num);
	fprintf(stderr, "%.*s\n", (int)(end-start), start);

	int pos = indent+loc-start;
	fprintf(stderr, "%*s", pos, " ");
	fprintf(stderr, "^ %s\n", msg);
	exit(1);
}

bool check(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		return false;
	}

	return true;
}

bool consume(char *op){
	// judge whether op is a symbol and return judge result
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK) ||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

int string_len(void){
	int len = 0;
	while(token->kind == TK_STR){
		token = token->next;
		len++;
	}

	return len - 1;
}

bool consume_ret(void){
	if((token->kind != TK_RETURN) || (token->len != 6) ||
	    memcmp(token->str, "return", (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

bool consume_reserved_word(char *keyword, TokenKind kind){
	if(token->kind != kind ||
	   token->len  != strlen(keyword) ||
	   memcmp(token->str, keyword, (size_t)token->len)){
		return false;
	}

	token = token->next;
	return true;
}

Token *consume_string(void){
	// null string
	if(token->kind == TK_RESERVED && *(token->str) == '"'){
		return calloc(1, sizeof(Token));
	}
	// judge whether token is a ident and token pointer
	if(token->kind != TK_STR || !(is_ascii(*(token->str)))){
		return NULL;
	}

	Token *ret = token;
	int counter = 0;
	while(token->kind == TK_STR){
		counter++;
		token = token->next;
	}

	ret->len = counter;

	return ret;
}


Token *consume_ident(void){
	// judge whether token is a ident and token pointer
	if(token->kind != TK_IDENT ||!(is_alnum(*(token->str)))){
		return NULL;
	}

	Token *ret = token;
	token = token->next;

	return ret;
}

void expect(char *op){
	// judge whether op is a symbol and move the pointer to the next
	if((token->kind != TK_RESERVED && token->kind != TK_BLOCK)||
	    strlen(op) != token->len || memcmp(token->str, op, (size_t)token->len)){
		error_at(token->str, "not a expected charctor.");
	}
	token = token->next;
}

int expect_number(void){
	// judge whether token is a number and move the pointer to the next and return value
	if(token->kind != TK_NUM){
		error_at(token->str, "not a number");
	}

	int val = token->val;
	token   = token->next;
	return val;
}

void label_register(Node *node, LabelKind kind){
	Label *new_label;
	if(labels_tail){
		labels_tail->next = calloc(1, sizeof(Label));
		new_label         = labels_tail->next;
	}else{
		labels_head = calloc(1, sizeof(Label));
		new_label   = labels_head;
	}

	new_label->kind  = kind;
	new_label->id    = llid;
	node->val        = llid;
	labels_tail      = (labels_tail) ? labels_tail->next : labels_head;

	llid++;

	if(kind == LB_CASE){
		new_label->cond = node->lhs;
	}else if(kind == LB_DEFAULT){
		new_label->cond = node->rhs;
	}
}

Func *find_func(Token *tok){
	for (int i = 0;func_list[i] && i < FUNC_NUM;i++){
		if(func_list[i]->len == tok->len && !memcmp(tok->str, func_list[i]->name, (size_t)tok->len)){
			return func_list[i];
		}
	}
	return NULL;
}

GVar *find_gvar(Token *tok){
	//while var not equal NULL
	for (GVar *var = globals;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return NULL;
}

LVar *find_lvar(Token *tok, int find_range){
	/* find_range
	 * IGNORE_SCOPE   == 0
	 * CONSIDER_SCOPE == 1 
	 */

	int out_of_scope = 0;
	//while var not equal NULL
	for (LVar *var = locals;var;var = var->next){
		if(var == outside_lvar) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return NULL;
}

Str *find_string(Token *tok){
	for (Str *var = strings;var;var = var->next){
		if(var->len == tok->len && !memcmp(tok->str, var->str, (size_t)var->len)){
			return var;
		}
	}
	return NULL;
}

Struc *find_struc(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return NULL;
}

Member *find_struct_member(Type *type, int find_range){
	int out_of_scope = 0;
	int struc_len    = type->len;
	char *struc_name = type->name;

	for (Struc *var = structs;var;var = var->next){
		if(var == outside_struct) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == struc_len && !memcmp(struc_name, var->name, (size_t)var->len)){
			return var->member;
		}
	}
	return NULL;
}

Enum *find_enum(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Enum *var = enumerations;var;var = var->next){
		if(var == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
			return var;
		}
	}
	return NULL;
}

Member *find_enumerator(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Enum *en = enumerations;en;en = en->next){
		if(en == outside_enum) out_of_scope = 1;
		if(find_range && out_of_scope) break;
		for (Member *var = en->member;var;var = var->next){
			if(var->len == tok->len && !memcmp(tok->str, var->name, (size_t)var->len)){
				return var;
			}
		}
	}
	return NULL;
}

Def_Type *find_defined_type(Token *tok, int find_range){
	int out_of_scope = 0;
	for (Def_Type *var = defined_types;var;var = var->next){
		if(var == outside_deftype) out_of_scope = 1;
		if(out_of_scope) break;
		if(var->name_len == len_val(tok->str) && !memcmp(tok->str, var->name, (size_t)var->name_len)){
			return var;
		}
	}
	return NULL;
}

Node *new_node(NodeKind kind, Node *lhs, Node *rhs){
	//create new node(symbol)
	Node *node = calloc(1, sizeof(Node));
	node->type = calloc(1, sizeof(Type));
	node->kind = kind;
	node->lhs  = lhs;
	node->rhs  = rhs;

	if(ND_ADD <= kind && kind <= ND_BIT_OR){
		node->type = (lhs->type->ty > rhs->type->ty)? lhs->type : rhs->type;
	}

	if(kind == ND_SUB){
		if((lhs->type->ty == PTR   && rhs->type->ty == PTR)||
		   (lhs->type->ty == ARRAY && rhs->type->ty == ARRAY)){
			node = new_node(ND_DIV, node, new_node_num(node->type->ptr_to->size));
			return node;
		}
	}

	if(kind == ND_ADD || kind == ND_SUB){
		if(lhs->type->ty == PTR || lhs->type->ty == ARRAY ||
		   rhs->type->ty == PTR || rhs->type->ty == ARRAY ){
			node = pointer_calc(node, lhs->type, rhs->type);
		}
	}

	if(kind == ND_ASSIGN){
		if(lhs->type->ty == BOOL){
			node->rhs = new_node(ND_NE, node->rhs, new_node_num(0));
		}

		if(lhs->type->ty == STRUCT){
			error_at(token->str, "struct assignment is not implemented");
		}
	}

	if(kind == ND_ASSIGN || kind == ND_COMPOUND){
		node->type = lhs->type;
		if(lhs->type->ty > rhs->type->ty){
			node->type = lhs->type;
			node->rhs  = new_node(ND_CAST, NULL, node->rhs);
			node->rhs->type = node->type;
		}
	}

	if(ND_GT <= kind && kind <= ND_NE){
		if(lhs->type->ty > rhs->type->ty){
			node->type = lhs->type;
			node->rhs  = new_node(ND_CAST, NULL, node->rhs);
			node->rhs->type = lhs->type;
		}else if(lhs->type->ty < rhs->type->ty){
			node->type = rhs->type;
			node->lhs  = new_node(ND_CAST, NULL, node->lhs);
			node->lhs->type = rhs->type;
		}else{
			node->type = lhs->type;
		}
	}


	if(kind == ND_DOT || kind == ND_ARROW){
		node->type = lhs->type;
	}

	if(kind == ND_DEREF){
		node->type = node->rhs->type->ptr_to;
	}

	if(kind == ND_ADDRESS){
		node->type->ty     = PTR;
		node->type->size   = type_size(node->type);
		node->type->align  = type_align(node->type);
		node->type->ptr_to = rhs->type;
	}

	if(node->type->is_const){
		if(node->kind == ND_ASSIGN || node->kind == ND_COMPOUND ||
		   node->kind == ND_POSTID || node->kind == ND_PREID){
			error_at(token->str, "changed read-only variable");
		}
	}

	return node;
}

Node *new_node_num(int val){
	//create new node(number)
	Node *node = calloc(1, sizeof(Node));
	node->kind = ND_NUM;
	node->val  = val;
	node->type = calloc(1, sizeof(Type));
	node->type->ty    = INT;
	node->type->size  = type_size(node->type);
	node->type->align = type_align(node->type);
	return node;
}

