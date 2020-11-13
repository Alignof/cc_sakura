/*
int main(){
	int i;
	int k;
	int x[10][10];

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			x[k][i] = i*k;
		}
	}



	return x[8][9];
}
*/

int main(){int x[2][3][4]; int **y; int **z; x[1][1][1]=5; x[1][2][3]=3; y=x[1]; z=y; return *(y+1)[1] + (z[2]+3);}

