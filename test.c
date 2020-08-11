int main(){
	int i;
	int max;
	int three;
	int five;

	three=0;
	five=0;
	scanf("%d",&max);
	for(i=0;i<max;i=i+1){
		if(three+five == 8){
			printf("FizzBuzz\n");
			three=0;
			five=0;
		}else if(three==3){
			printf("Fizz\n");
			three=0;
		}else if(five==5){
			printf("Buzz\n");
			five=0;
		}else{
			printf("%d\n",i);
		}

		three=three+1;
		five=five+1;
	}
/*
	int a;
	a=10;

	while(a>0)
		a=a-1;
	return a;
*/
	return 0;
}
