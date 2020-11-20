struct rgb{
	int red;
	int green;
	int blue;
};

struct test{ 
	int x;
	int y;
	struct rgb color;
};

int main(){
	struct test point;

	test.x = 2;
	test.y = 3;

	// expect 5
	return test.x + test.y;
}
