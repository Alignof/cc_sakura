/*
int main(){
	int i;
	int max=0;

	scanf("%d",&max);
	for(i=1;i<=max;i=i+1){
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

int main(){
	int a[5]={0,1,2,3,4};
	printf("%d\n",a[0]);
	printf("%d\n",a[1]);
	printf("%d\n",a[2]);
	printf("%d\n",a[3]);
	printf("%d\n",a[4]);
	return a[4];
}
/*
int main(){
	int a[5];
	a[4]=4;
	a[3]=3;
	a[2]=2;
	a[1]=1;
	a[0]=0;
	return a[4];
}
*/
