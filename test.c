typedef struct Test Test;
struct Test{
	int value;
	Test *next;
};

void prepare(Test *test){
	int i;
	test->value = 0;
	for(int i=1;i<8;i++){
		test->value  = i;
		test->next = calloc(1, sizeof(Test));
		test = test->next;
	}
}

// void expand_next(Test *test){
// 	printf("test0: %d\n", test->value);
// 	printf("test1: %d\n", test->next->value);
// 	printf("test2: %d\n", test->next->next->value);
// 
// 	while(test){
// 		printf("%d\n", test->value);
// 		test=test->next;
// 	}
// 	printf("	push rax\n");
// }
// 
int main(){
	Test *test = calloc(1, sizeof(Test));
	prepare(test);
	if(!test){
		printf("NULL\n");
	}else{
		printf("exist: %d\n", test->value);
	}
	//expand_next(test);

	return 0;
}

