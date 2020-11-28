struct rgb{
	int r;
	int g;
	int b;
};
struct point{
	int x;
	int y;
	struct rgb *col;
};
int main(){
	struct point test;
	struct point *ptr;

	ptr = &test;
	ptr->col->r = 2;
	ptr->col->g = 3;
	ptr->col->b = 4;
	return ptr->col->r + ptr->col->g + ptr->col->b;
}

