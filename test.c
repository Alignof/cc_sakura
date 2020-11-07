int main(){
	int i;
	int j;
	int x[10][10];

	for(i=1;i<=10;i++){
		for(j=1;j<=10;j++){
			x[i][j]=i*j;
		}
	}

	return x[3][2];
	
}
