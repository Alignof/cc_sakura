typedef struct Token Token;

typedef enum{
	TK_TYPE,
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_IF,
	TK_ELSE,
	TK_SWITCH,
	TK_CASE,
	TK_DEFAULT,
	TK_DO,
	TK_WHILE,
	TK_FOR,
	TK_SIZEOF,
	TK_ALIGNOF,
	TK_BLOCK,
	TK_STR,
	TK_BREAK,
	TK_CONTINUE,
	TK_TYPEDEF,
	TK_EXTERN,
	TK_RETURN,
	TK_THREAD_LOCAL,
	TK_COMPILER_DIRECTIVE,
	TK_EOF,
}TokenKind;

struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

Token *gtest;
Token *show_all(Token *test);

void prepare(){
	Token *test = gtest;
	for(int i=1;i<8;i++){
		test->val  = i;
		test->next = calloc(1, sizeof(Token));
		test = test->next;
	}
}

void expand_next(){
	Token *test = gtest;
	printf("test0: %d\n", gtest->val);
	printf("test1: %d\n", gtest->next->val);
	printf("test2: %d\n", gtest->next->next->val);

	while(test){
		printf("%d\n", test->val);
		test=test->next;
	}
}

int main(){
	gtest = calloc(1, sizeof(Token));
	prepare();
	//expand_next();
	if(show_all(gtest)){
		printf("true\n");
	}else{
		printf("false\n");
	}

	return 0;
}

Token *show_all(Token *test){
	test->kind;
	test->next;
	test->val;
	test->str;
	test->len;

	return gtest;
}

