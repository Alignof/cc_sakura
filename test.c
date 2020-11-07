int global = 7;

int *f(int *x){
	 *x += 1;
	 global += 1;

	 return x;
}

int main(){
	 int x = 3;

	 x = (*f(&x))++;

	// 12
	return global + x;
}
