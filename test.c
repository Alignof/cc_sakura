typedef struct test Test;
Test{
	int a;
	int b;
};

int main(){
	Test x;
	x.a=2;
	x.b=3;
	return x.a + x.b;
}

