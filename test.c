struct rgb{
	int red;
	int green;
	int blue;
};

struct point{ 
	int x;
	int y;
	struct rgb color;
	int dummy;
};

int main(){
	struct point test;

	printf("address of test.x		is %p\n", &(test.x));
	printf("address of test.y		is %p\n", &(test.y));
	printf("address of test.color		is %p\n", &(test.color));
	printf("address of test.dummy		is %p\n", &(test.dummy));
	printf("address of test.color.red	is %p\n", &(test.color.red));
	printf("address of test.color.green	is %p\n", &(test.color.green));
	printf("address of test.color.blue	is %p\n", &(test.color.blue));

	return 0;
}

