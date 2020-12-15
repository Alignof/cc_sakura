char reg_ax[8][4] = {"al", "al", "al", "eax","eax","rax","rax","rax"};
int main(){
	int i;
	for(i = 0;i < 8;i++){
		printf("%s\n", reg_ax[i]);
	}
	return 0;
}
