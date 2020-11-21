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

struct test{int a; int b; int c[10];}; int main(){struct test x; x.a=1; x.b=2; x.c[0]=3; x.c[2]=4; return x.a + x.b + x.c[0] + x.c[2];}
