/**/
enum A{B,C,D};
int f(enum A b){
	switch(b){
		case B: return 1;
		case C: return 5;
		case D: return 8;
	}
}
int main(void){
	return (f(B) - 1) || (f(C) - 5) || (f(D) - 8);
}

