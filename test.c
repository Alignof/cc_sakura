int main(void){
	int x[2][3][4];

	printf("x[2][3][4]\n");
	printf("x[0][0][0]\t%ld\n", &(x[0][0][0]));
	printf("x[1][0][0]\t%ld\n", &(x[1][0][0]));
	printf("x[0][1][0]\t%ld\n", &(x[0][1][0]));
	printf("x[0][0][1]\t%ld\n", &(x[0][0][1]));
}

