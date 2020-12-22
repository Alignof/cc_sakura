typedef struct Test Test;
typedef _Bool bool;
struct Test{
	int value;
	char *str;
	Test *next;
};

void prepare(Test *test){
	int i;
	char *name = "hello";
	test->value = 0;
	for(int i=1;i<8;i++){
		test->value  = i;
		test->str    = name;
		test->next   = calloc(1, sizeof(Test));
		test = test->next;
	}
}

void expand_next(Test *test){
	printf("test0: %d\n", test->value);
	printf("test1: %d\n", test->next->value);
	printf("test2: %d\n", test->next->next->value);

	while(test){
		printf("%d\n", test->value);
		test=test->next;
	}
	printf("	push rax\n");
}

bool is_ascii(char c){
	return 0 <= c && c <= 127;
}

int main(){
	Test *test = calloc(1, sizeof(Test));
	prepare(test);
	if(!(is_ascii(*(test->str)))){
		printf("NULL\n");
	}else{
		printf("exist: %c\n", *(test->str));
	}
	expand_next(test);

	return 0;
}

