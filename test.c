int main(){
	int i;
	int k;
	int x=0;

	for(i=0;i<10;i++){
		for(k=0;k<10;k++){
			if(k==5){
				break;
			}
			x++;
		}
	}

	return x;
}

