# cc_sakura
[![Build Status](https://travis-ci.org/Takana-Norimasa/cc_sakura.svg?branch=master)](https://travis-ci.org/Takana-Norimasa/cc_sakura)  
C Compiler Sakura  
[https://www.sigbus.info/compilerbook](https://www.sigbus.info/compilerbook)を見ながら勉強していく。

## example

### FizzBuzz  
```c
int main(){
	int i;
	int max=0;

	scanf("%d",&max);
	for(i=1;i<=max;i++){
		if(i%3==0 && i%5==0)
			printf("FizzBuzz\n");
		else if(i%3==0)
			printf("Fizz\n");
		else if(i%5==0)
			printf("Buzz\n");
		else
			printf("%d\n",i);
	}
	return 0;
}
```

### testcode  
```c
./test.sh
int main(){0;} => 0
int main(){42;} => 42
int main(){5+20-4;} => 21
int main(){12 + 34 - 5;} => 41
int main(){5+6*7;} => 47
int main(){5*(9-6);} => 15
int main(){(3+5)/2;} => 4
int main(){(-3+5)+15;} => 17
int main(){(-3*-2)+15;} => 21
int main(){(-3*-2)%(5*(9-6)/5);} => 0
int main(){5<4;} => 0
int main(){5>4;} => 1
int main(){12 == 12;} => 1
int main(){12 == 11;} => 0
int main(){12 != 13;} => 1
int main(){12 != 12;} => 0
int main(){1 && 1;} => 1
int main(){1 && 0;} => 0
int main(){0 || 0;} => 0
int main(){1 || 0;} => 1
int main(){5+3;6+2;} => 8
int main(){int a;int b;a=3;b=2;a+b;} => 5
int main(){int a_1;int b_2;a_1=3;b_2=2;a_1+b_2;} => 5
int main(){int a;a=8;a=a-3;a;} => 5
int main(){int a;int b;int c;int d; a=3;b=2;c=12;d=17;(d-c)*(a+b);} => 25
int main(){int abc; int def; abc=3;def=2;abc+def;} => 5
int main(){int kinako;int momone; kinako=3;momone=2;momone*kinako;} => 6
int main(){return 2+3;} => 5
int main(){int a;int b; a=13;b=8;return a-b;} => 5
int main(){int a; a=0;if(3>2) a=1;a;} => 1
int main(){int a; a=0;if(3<2) a=1;a;} => 0
int main(){int a; a=1+2;if(3>2) a=10-3;a;} => 7
int main(){int a; a=1+2;if(3<2) a=10-3;a;} => 3
int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a<b) c=b-a;c;} => 1
int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a>b) c=b-a;c;} => 5
int main(){int a; if(2>3) a=3-2; else a=2+3;a;} => 5
int main(){int a; if(2<3) a=3-2; else a=2+3;a;} => 1
int main(){int a; int b;int c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;} => 9
int main(){int a; int b;int c; a=2;b=3;if(a<b) c=b-a/a; else c=a+b*b-a;c;} => 2
int main(){int a; a=10;while(a>0) a=a-1;a;} => 0
int main(){int a; a=10;while(a<0) a=a-1;a;} => 10
int main(){int a; int i; a=0; for(i=0;i<10;i=i+1) a=a+1;a;} => 10
int main(){int a; int i; a=1; for(i=0;i<6;i=i+1) a=a*2;a;} => 64
int main(){int a;int b;int c; a=2;b=3;c=5;if(a>b){a=a+b;a=a+c;} a;} => 2
int main(){int a;int b;int c; a=2;b=3;c=5;if(a<b){a=a+b;a=a+b+c;} a;} => 13
int func(){return 9;} int main(){int b; b=func();b;} => 9
int func(){int a; a=9;return a;} int main(){int b; b=func();b;} => 9
int func(){int a; a=9;return a;} int main(){int b;int c; b=3;c=func();b;} => 3
int func(int a){return a;} int main(){int b;b=func(1);b;} => 1
int func(int a){return a;} int main(){int a;a=func(1);a;} => 1
int add(int a,int b){return a+b;} int main(){add(2,3);} => 5
int add(int a,int b){return a+b;} int main(){int a;int b; a=2;b=3;add(a,b);} => 5
int add(int a,int b,int c){return a+b+c;} int main(){int a;int b;int c; a=2;b=3;c=4;add(a,b,c);} => 9
int fibo(int num){if(num==0){return 0;}if(num==1){return 1;} return fibo(num-1)+fibo(num-2);} int main(){fibo(10);} => 55
int main(){int x; int *y; y=&x;*y=3;return x;} => 3
int main(){int x; int *y; int **z; y=&x;z=&y;**z=3;return x;} => 3
int main(){int x; sizeof(x);} => 4
int main(){int *x; sizeof(x);} => 8
int main(){int x; sizeof(&x);} => 8
int main(){int x; sizeof(x+2);} => 4
int main(){int *x; sizeof(x+2);} => 8
int main(){int *x; sizeof((x));} => 8
int main(){int a[4]; *a=1; return *a;} => 1
int main(){int a[4]; *a=1; *a=1; return *a;} => 1
int main(){int a[4]; *a=1; *(a+1)=2; return *(a+1);} => 2
int main(){int a[4]; int *p; *a=1; return *a;} => 1
int main(){int a[4]; int *p; p=a; *p=1; return *a;} => 1
int main(){int a[4]; *a=1; *(a+1)=2; int *p; p=a; return *p + *(p+1);} => 3
int main(){int a[4]; a[0]=1; return a[0];} => 1
int main(){int a[4]; a[0]=1; a[1]=2; return a[0]+a[1];} => 3
int main(){int a[5]; int sum; int i; sum=0; i=0; while(i<5){a[i]=i; i=i+1;} i=0; while(i<5){sum=sum+a[i];i=i+1;} return sum;} => 10
int a; int main(){a;} => 0
int a[10]; int main(){a[5];} => 0
int a; int b; int main(){a=2;a;} => 2
int a; int b; int main(){a=2;b=3;a+b;} => 5
int a; int b; int main(){int a;a=2;b=3;a+b;} => 5
int main(){char a;a=2;return a;} => 2
int main(){char a;char b;char c;char d; a=3;b=2;c=12;d=17;(d-c)*(a+b);} => 25
int main(){char a;char b;char c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;} => 9
int main(){char x; char *y; char **z; y=&x;z=&y;**z=3;return x;} => 3
int main(){char x; sizeof(x+2);} => 4
int main(){char a[4]; *a=1; *(a+1)=2; char *p; p=a; return *p + *(p+1);} => 3
int main(){char *x; x="hello"; x[1];} => 101
int main(){char *x; x="hello"; *(x+2);} => 108
int main(){int i; int x[10];/* set counter */ for(i=0;i<10;i=i+1) x[i]=i; return x[5];} => 5
int main(){int a=8;a=a-3;a;} => 5
int main(){char *x="hello"; *(x+2);} => 108
int main(){char x[]="hello"; *(x+2);} => 108
int main(){char x[6]="hello"; *(x+2);} => 108
int main(){int a[]={0,1,2,3,4}; return a[4];} => 4
int main(){int a[5]={0,1,2,3,4}; return a[4];} => 4
int main(){int a[5]={0,1,2}; return a[4];} => 0
int add(int x,int y){return x+y;} int main(){int a[5]={0,1,2,add(1,3),4}; return a[3];} => 4
int a=8; int main(){a=a-3;a;} => 5
char *x="hello"; int main(){*(x+2);} => 108
char x[]="hello"; int main(){*(x+2);} => 108
char x[6]="hello"; int main(){*(x+2);} => 108
int a[]={0,1,2,3,4}; int main(){return a[4];} => 4
int a[5]={0,1,2,3,4}; int main(){return a[4];} => 4
int a[5]={0,1,2}; int main(){return a[4];} => 0
int main(){int x=3; int a=x++; return a+x;} => 7
int main(){int x=3; int a=++x; return a+x;} => 8
int main(){int x=3; int a=x--; return a+x;} => 5
int main(){int x=3; int a=--x; return a+x;} => 4
int main(){return 'a';} => 97
int main(){int flag; char *hello="hello"; if(hello[1] == 'e') flag=1; else flag=0; return flag;} => 1
struct test{int a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;} => 5
OK
```
