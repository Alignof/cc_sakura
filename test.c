int main(){
	int i;
	int k;
	int x[10][10];

/*
	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			x[i][k] = i*k;
		}
	}
*/
	i = 1;
	while(i<=9){
		k=1;
		while(k<=9){
			x[i][k] = i*k;
			k++;
		}
		i++;
	}

	return x[9][7];
}
