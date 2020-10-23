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
	xanadu.momone	= 1;
	xanadu.kinako	= 2;
	xanadu.shion	= 3;
	xanadu.aoi	= 4;
	xanadu.suigyoku	= 5;
	xanadu.syuka	= 6;

	sum = sum + xanadu.momone;
	sum = sum + xanadu.kinako;
	sum = sum + xanadu.shion;
	sum = sum + xanadu.aoi;
	sum = sum + xanadu.suigyoku;
	sum = sum + xanadu.syuka;

	// expect 21
	return sum;
}
