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

struct test{int a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;}
