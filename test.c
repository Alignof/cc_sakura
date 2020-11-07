/*
int main(){
	int x[10][10];

	return x[0][0];
}
*/

int main(){
	int x[4]={0,1,2,3};
	int *p;
	int *q;

	p=x;
	q=++p;
	return *q;
}
