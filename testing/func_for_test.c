#include <stdio.h>
#include <stdlib.h>

void alloc4(int **p,int a,int b,int c,int d){
	*p=calloc(4,sizeof(int));
	(*p)[0]=a;
	(*p)[1]=b;
	(*p)[2]=c;
	(*p)[3]=d;
}

int main(void){
	int i;
	int *p;

	alloc4(&p,1,2,4,8);
	for(i=0;i<4;i++)
		printf("%d:%d\n",i+1,p[i]);

}
