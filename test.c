/*
int i=0;
void increment(void){
	i++;

	return;
}

int main(){
	increment();
	return i;
}
*/


typedef struct test{
	int a;
	int b;
}Test;

int main(){
	Test x;
	x.a=2;
	x.b=3;
	return x.a + x.b;
}
