typedef struct Test Test;
struct Test{
	Test *next;
	char *str;
	int len;
	char dummy;
	int value;
};

Test *gtest;

void prepare(){
	Test *test = gtest;
	for(int i=1;i<8;i++){
		test->value  = i;
		test->next = calloc(1, sizeof(Test));
		test = test->next;
	}
}

void expand_next(){
	Test *test = gtest;
	printf("test0: %d\n", gtest->value);
	printf("test1: %d\n", gtest->next->value);
	printf("test2: %d\n", gtest->next->next->value);

	while(test){
		printf("%d\n", test->value);
		test=test->next;
	}
}

int main(){
	gtest = calloc(1, sizeof(Test));
	prepare();
	expand_next();

	return 0;
}
