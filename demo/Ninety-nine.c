int main(){
	int i;
	int k;
	int x[10][10];

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			x[k][i] = i*k;
		}
	}

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			printf("%2d ",x[k][i]);
		}
		printf("\n");
	}

	return 0;
}

