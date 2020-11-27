/*
int main(){
	int x=0;
	int y=1;
	int z=2;

	if(x == 0){
		int y=4;
	}
	

	return y+z;
}
*/

int main(){
	int x=0;
	int z=2;
	if(x == 0){
		if(z==2){
			int x;
			int y;
			x=2;
			y=4;
			z=x+y;
			printf("[if] z:%d\n", z);
		}
	}
	printf("[func] z:%d\n", z);
	int y=1;
	return y+z;
}
