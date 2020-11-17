struct test{
	int  i1;
	char c1;
	int  i2;
	char c2;
	char c3;
	int  i3;
};

int main(){
	struct test mydata;
	printf("address of i1 is %p\n", &(mydata.i1));
	printf("address of c1 is %p\n", &(mydata.c1));
	printf("address of i2 is %p\n", &(mydata.i2));
	printf("address of c2 is %p\n", &(mydata.c2));
	printf("address of c3 is %p\n", &(mydata.c3));
	printf("address of i3 is %p\n", &(mydata.i3));

	printf("address of mydata is %p\n", &mydata);

	return 0;
}
