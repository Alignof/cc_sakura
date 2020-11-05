int main(){
	int i;
	int x[4] = {0,1,2,3};
	int y[4] = {0,1,2,3};
	int *p   = x;
	int *q   = y;

	for(i=0;i<4;i++){
		*(p++) += *(q++);
	}

	return x[3];
}
