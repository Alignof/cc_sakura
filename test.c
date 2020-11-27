int main(){
	enum Color{Red, Green, Blue} test = Green;
	int  result = 13;

	switch(test){
		case Red:
			result = 0;
			break;
		case Green:
			result = 1;
			break;
		case Blue:
			result = 2;
			break;
	}

	return result;
}
