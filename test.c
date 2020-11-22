int main() {
	int i;
	int x=1;


	for(i=0;i<4;i++){
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
			default:
				x = 10;
				printf("default!\n");
		}
	}

	return x;
}
