int main(){
	int a = 0;
	int b = 0;

	do{
		a -= 1;
		b += a;
		if(a){
			continue;
		}

		break;
		a+=100;
	}while(a+3);

	return -a;// expect 3
}

