/*

struct test{
	char momone;
	char kinako;
	char shion;
	char aoi;
	char suigyoku;
	char syuka;
};

int main(){
	int sum = 0;
	struct test xanadu;
	struct test *ptr;
	ptr = &xanadu;

	xanadu.momone	= 1;
	xanadu.kinako	= 2;
	xanadu.shion	= 3;
	xanadu.aoi	= 4;
	xanadu.suigyoku	= 5;
	xanadu.syuka	= 6;


	sum = sum + ptr->momone;
	sum = sum + ptr->kinako;
	sum = sum + ptr->shion;
	sum = sum + ptr->aoi;
	sum = sum + ptr->suigyoku;
	sum = sum + ptr->syuka;

	// expect 21
	return sum;
}

struct test{
	int a;
	int b;
};

int main(){
	struct test x;
	struct test *y;
	struct test **z;

	y=&x;
	z=&y;
	(*z)->a=2;
	(*z)->b=3;
	return (*z)->a + (*z)->b;
}
*/

int main(){int a[4]; *a=1; *(a+1)=2; return *(a+1);}
