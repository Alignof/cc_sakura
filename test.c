/*
int global = 7;

int *f(int *x){
	 *x += 4;
	 global += 3;

	 return x;
}

int main(){
	 int x=3;

	 (*f(&x))++;

	// 18
	return global + x;
}

*/
int main(){
	int i;
	int x[4] = {0,1,2,3};
	int y[4] = {0,1,2,3};
	int *p   = x;
	int *q   = y;

	p += 3;

	return *p;
}
