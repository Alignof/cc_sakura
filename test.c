int fibo(int num){
	if(num==0) return 0;
	if(num==1) return 1;

	return fibo(num-1)+fibo(num-2);
}

int main(){
	/* calc fibonacci sequence*/
	return fibo(10);
}
