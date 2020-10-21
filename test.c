/*
int main(){
	int i;
	int max=0;

	scanf("%d",&max);
	for(i=1;i<=max;i++){
		if(i%3==0 && i%5==0)
			printf("FizzBuzz\n");
		else if(i%3==0)
			printf("Fizz\n");
		else if(i%5==0)
			printf("Buzz\n");
		else
			printf("%d\n",i);
	}
	return 0;
}
*/

struct test{
	char a;
	int  b;
	int  c;
};

int main(){
	char *hello = "hello";

	if(hello[1] == 'e'){
		printf("same!\n");
	}else{
		printf("different!\n");
	}

	return 0;
}
