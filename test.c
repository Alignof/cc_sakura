/*
typedef struct test Test;

struct test{
	int r;
	int g;
	int b;
	Test *next;
};

int main(void){
	Test x; 
	Test y;

	x.r=1;
	x.g=2;
	x.b=3;

	y.r=4;
	y.g=5;
	y.b=6;

	x.next = &y;

	// 4
	return x.next->r;
}
*/

int add(int a, int b,int c,int d){
	return a+b+c+d;
}
int sum(int a, int b, int c){
	return a+b+c;
}
int pow(int a){
	return a*a;
}
int main(void){
	int a=6;
	int b=5;
	int c=4;
	int d=3;
	int e=2;
	int f=1;
	int g=0;

	// 21
	return add(a, b, c, sum(d, e, pow(f)));
}
