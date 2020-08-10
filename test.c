int main(){
	int i;
<<<<<<< HEAD
	int a;
	int pow;

/*
	a=1;
	//scanf("%d",&pow);
	pow=5;
	for(i=0;i<pow;i=i+1)
		a=a*2;
	
	printf("2^%d=%d\n",pow,a);
*/
	printf("hello world!\n");
=======
	int three;
	int five;

	three=0;
	five=0;
	for(i=0;i<100;i=i+1){
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

>>>>>>> fix
	return 0;
}
