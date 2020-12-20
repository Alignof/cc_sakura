/*
int main(void){
	int x[2][3][4];

	printf("x[2][3][4]\n");
	printf("x[0][0][0]\t%ld\n", &(x[0][0][0]));
	printf("x[1][0][0]\t%ld\n", &(x[1][0][0]));
	printf("x[0][1][0]\t%ld\n", &(x[0][1][0]));
	printf("x[0][0][1]\t%ld\n", &(x[0][0][1]));
}
*/

int main(){int i; int x[10];for(i=0;i<10;i++){if(i == 5){x[i]=13;continue;}x[i]=i;} return x[5]+x[3];}
