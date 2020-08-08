int receivecoin(){
	return 1;
}

int main(){
	int count;
	int price;
	
	count=0;
	price=16;

	while(count<price){
		if(receivecoin()) count=count+1;
	}

	return count;
}
