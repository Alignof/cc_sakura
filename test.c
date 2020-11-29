/*
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
*/
int main(){
	int i;
	int k;
	int l;
	int x=0;
	for(i=0;i<5;i++){
		for(k=0;k<10;k++){
			if(k==5){
				break;
			}
			x++;
		}
		for(l=0;l<10;l++){
			if(l==5){
				break;
			}
			x++;
		}
	}
	return x;
}

