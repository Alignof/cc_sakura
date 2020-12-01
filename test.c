/*
int count;

int solve(int n, int col, int *hist){
	if (col == n){
		count += 1;
		return 0;
	}

	int i = 0;
	int j = 0;
	for (;i < n;i++){
		for (j = 0; j < col && hist[j] != i && (hist[j] - i) != col - j && (hist[j] - i) != j - col; j++){}
		if (j < col) continue;
		hist[col] = i;
		solve(n, col + 1, hist);
	}
	return 0;
}

int main(){
	int hist[12];
	int i;
	for (i = 1; i < 12; i++){
		count = 0;
		solve(i, 0, hist);
		printf("%d queen(s): ", i);
		printf("%d", count);
		puts("");
	}
	return 0;
}

*/

void disp(int *numbers){
	int i;
	for(i = 0;i < 6;i++){
		printf("%d:%d\n", i, numbers[5-i]);
	}

	return;
}

int main(){
	int numbers[12] = {0,1,2,3,4,5,6};

	disp(numbers);
	return 0;
}

