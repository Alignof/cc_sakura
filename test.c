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

typedef enum{RED,GREEN,BLUE,}COLOR; int main(void){COLOR c = GREEN; return GREEN;} 
