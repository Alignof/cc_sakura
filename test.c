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

int main(){
	int x;
	int y=2;
	int z=5;

	x = (y==2)  ? ((z==4) ? 8 : 4) : 3;

	return x;
}
