int main() {
	int i;
	int x=1;

	for(i=0;i<4;i++){
		switch(i){
			case 0:
				x = 2;
				break;
			case 1:
				x = 3;
				break;
			case 2:
				x = 4;
				break;
			default:
				x = 10;
		}
	}

	return x;
}
