/*
struct rgb{
	int red;
	int green;
	int blue;
};

struct point{ 
	int x;
	int y;
	struct rgb *color;
};

int main(){
	struct point test;

	test.col->red   = 2;
	test.col->green = 3;
	test.col->blue  = 4;

	// expect 9
	return test.color->red + test.color->green + test.color->blue;
}
*/

struct test{int a; int b;}; int main(){struct test x; struct test *y; y=&x; y->a=2; y->b=3; return y->a + y->b;}
