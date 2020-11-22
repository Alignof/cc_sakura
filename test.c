int main() {
	int i=2;
	int x=1;


	switch(i){
		case 0:
			x = 2;
			printf("i == 0\n");
			break;
		case 1:
			x = 3;
			printf("i == 1\n");
			break;
		case 2:
			x = 4;
			printf("i == 2\n");
			break;
	}
/*
	for(i=0;i<3;i++){
		switch(i){
			case 0:
				x = 2;
				printf("i == 0\n");
				break;
			case 1:
				x = 3;
				printf("i == 1\n");
				break;
			case 2:
				x = 4;
				printf("i == 2\n");
				break;
		}
	}
*/

	return x;
}
