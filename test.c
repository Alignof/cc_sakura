typedef struct test Test;

struct test{
	int r;
	int g;
	int b;
	Test *next;
};

int main(void){
	char str[] = "hello"; 

	// 5
	return sizeof(str);
}

