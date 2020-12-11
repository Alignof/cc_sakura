int main(){
	int i=-1;
	int x[10];
	while(i<10){
		i++;
		if(i == 5){
			x[i]=13;
			continue;
		}
		x[i]=i;
	}
	return x[5]+x[3];
}

