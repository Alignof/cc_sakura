/*
int main(){
	char *psz1 = calloc(100, sizeof(char));
	char *psz2 = "abcdefghijklmnopqrstuvwxyz";
	char *to   = psz1;
	char *from = psz2;
	int  count = 26;

	switch (count % 8) {
		case 0:  do {  *to++ = *from++;
		case 7:        *to++ = *from++;
		case 6:        *to++ = *from++;
		case 5:        *to++ = *from++;
		case 4:        *to++ = *from++;
		case 3:        *to++ = *from++;
		case 2:        *to++ = *from++;
		case 1:        *to++ = *from++;
			} while ((count -= 8) > 0);
	}

	printf("to	:%s\n", psz1);
	printf("from	:%s\n", psz2);
}
*/

int main() {int i=1; int x; switch(i){case 0:x=2;break; case 1:x=3;break; case 2:x=4;break; default:x=5;} return x;}
