void pow(int *numbers){
	int i;
	for(i = 0;i < 12;i++){
		numbers[i] = i*i;
	}

	return;
}

int main(){
	int i;
	int numbers[12];

	pow(numbers);

	for(i=0;i<12;i++){
		printf("%d:%d\n", i, numbers[i]);
	}

	return 0;
}

