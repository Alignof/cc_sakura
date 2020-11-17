/*
int main(){
	int i;
	int k;
	int x[10][10];

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			x[k][i] = i*k;
		}
	}



	return x[8][9];
}
*/

struct test{
	int a;
	int b;
	int c[5];
};

int main(){
	struct test x;

	// x.a=1;
	// x.b=2;
	// x.c[0]=3;
	// return x.a + x.b + x.c[0] + x.c[2];

	x.a    = 1;
	x.b    = 2;
	x.c[0] = 3;
	x.c[1] = 4;
	x.c[2] = 5;
	x.c[3] = 6;
	x.c[4] = 7;

	return x.c[2];
}
