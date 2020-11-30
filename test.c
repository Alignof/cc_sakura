/*
typedef struct test Test;

struct Test{
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


enum Color{Red, Green, Blue}; int main(){return Blue;}
