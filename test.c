int main(void){
	int x = 0;
	for(int i=0;i < 10;i++){
		for(int k=0;k < 10;k++){
			for(int l=0;l < 10;l++){
				x++;
			}
		}
		for(int k=0;k < 10;k++){
			for(int l=0;l < 10;l++){
				x++;
			}
		}
	}

	return x;
}
