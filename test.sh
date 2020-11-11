#!/bin/bash
assert() {
	if [ $# -eq 3 ]; then
		option="$1"
		expected="$2"
		input="$3"
		./cc_sakura "$option" "$input" > tmp.s
	else
		expected="$1"
		input="$2"
		./cc_sakura "$input" > tmp.s
	fi

	gcc -c tmp.s 
	gcc -o tmp -static tmp.s 
	#gcc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

assert -cl 0  "int main(){0;}"
assert -cl 42 "int main(){42;}"

assert -cl 21 "int main(){5+20-4;}"
assert -cl 41 "int main(){12 + 34 - 5;}"

assert -cl 47 "int main(){5+6*7;}"
assert -cl 15 "int main(){5*(9-6);}"
assert -cl 4  "int main(){(3+5)/2;}"
assert -cl 17 "int main(){(-3+5)+15;}"
assert -cl 21 "int main(){(-3*-2)+15;}"
assert -cl 0 "int main(){(-3*-2)%(5*(9-6)/5);}"

assert -cl 0  "int main(){5<4;}"
assert -cl 1  "int main(){5>4;}"

assert -cl 1  "int main(){12 == 12;}"
assert -cl 0  "int main(){12 == 11;}"
assert -cl 1  "int main(){12 != 13;}"
assert -cl 0  "int main(){12 != 12;}"

assert -cl 1  "int main(){1 && 1;}"
assert -cl 0  "int main(){1 && 0;}"
assert -cl 0  "int main(){0 || 0;}"
assert -cl 1  "int main(){1 || 0;}"

assert -cl 8  "int main(){5+3;6+2;}"
assert -cl 5  "int main(){int a;int b;a=3;b=2;a+b;}"
assert -cl 5  "int main(){int a_1;int b_2;a_1=3;b_2=2;a_1+b_2;}"
assert -cl 5  "int main(){int a;a=8;a=a-3;a;}"
assert -cl 25 "int main(){int a;int b;int c;int d; a=3;b=2;c=12;d=17;(d-c)*(a+b);}"

assert -cl 5  "int main(){int abc; int def; abc=3;def=2;abc+def;}"
assert -cl 6  "int main(){int kinako;int momone; kinako=3;momone=2;momone*kinako;}"

assert -cl 5  "int main(){return 2+3;}"
assert -cl 5  "int main(){int a;int b; a=13;b=8;return a-b;}"

assert -cl 1  "int main(){int a; a=0;if(3>2) a=1;a;}"
assert -cl 0  "int main(){int a; a=0;if(3<2) a=1;a;}"
assert -cl 7  "int main(){int a; a=1+2;if(3>2) a=10-3;a;}"
assert -cl 3  "int main(){int a; a=1+2;if(3<2) a=10-3;a;}"
assert -cl 1  "int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a<b) c=b-a;c;}"
assert -cl 5  "int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a>b) c=b-a;c;}"

assert -cl 5  "int main(){int a; if(2>3) a=3-2; else a=2+3;a;}"
assert -cl 1  "int main(){int a; if(2<3) a=3-2; else a=2+3;a;}"
assert -cl 9  "int main(){int a; int b;int c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;}"
assert -cl 2  "int main(){int a; int b;int c; a=2;b=3;if(a<b) c=b-a/a; else c=a+b*b-a;c;}"

assert -cl 0  "int main(){int a; a=10;while(a>0) a=a-1;a;}"
assert -cl 10 "int main(){int a; a=10;while(a<0) a=a-1;a;}"

assert -cl 10 "int main(){int a; int i; a=0; for(i=0;i<10;i=i+1) a=a+1;a;}"
assert -cl 64 "int main(){int a; int i; a=1; for(i=0;i<6;i=i+1) a=a*2;a;}"

assert -cl 2  "int main(){int a;int b;int c; a=2;b=3;c=5;if(a>b){a=a+b;a=a+c;} a;}"
assert -cl 13 "int main(){int a;int b;int c; a=2;b=3;c=5;if(a<b){a=a+b;a=a+b+c;} a;}"

assert -cl 9  "int func(){return 9;} int main(){int b; b=func();b;}"
assert -cl 9  "int func(){int a; a=9;return a;} int main(){int b; b=func();b;}"
assert -cl 3  "int func(){int a; a=9;return a;} int main(){int b;int c; b=3;c=func();b;}"

assert -cl 1  "int func(int a){return a;} int main(){int b;b=func(1);b;}"
assert -cl 1  "int func(int a){return a;} int main(){int a;a=func(1);a;}"

assert -cl 5  "int add(int a,int b){return a+b;} int main(){add(2,3);}"
assert -cl 5  "int add(int a,int b){return a+b;} int main(){int a;int b; a=2;b=3;add(a,b);}"
assert -cl 9  "int add(int a,int b,int c){return a+b+c;} int main(){int a;int b;int c; a=2;b=3;c=4;add(a,b,c);}"

assert -cl 55 "int fibo(int num){if(num==0){return 0;}if(num==1){return 1;} return fibo(num-1)+fibo(num-2);} int main(){fibo(10);}"

assert -cl 3  "int main(){int x; int *y; y=&x;*y=3;return x;}"
assert -cl 3  "int main(){int x; int *y; int **z; y=&x;z=&y;**z=3;return x;}"

assert -cl 4  "int main(){int x; sizeof(x);}"
assert -cl 8  "int main(){int *x; sizeof(x);}"
assert -cl 8  "int main(){int x; sizeof(&x);}"
assert -cl 4  "int main(){int x; sizeof(x+2);}"
assert -cl 8  "int main(){int *x; sizeof(x+2);}"
assert -cl 8  "int main(){int *x; sizeof((x));}"
assert -cl 4  "int main(){char x[4]; sizeof((x));}"
assert -cl 16 "int main(){int x[4]; sizeof((x));}"
assert -cl 64 "int main(){int x[4][4]; sizeof((x));}"
assert -cl 16 "int main(){int x[4][4]; sizeof((x[0]));}"

assert -cl 1  "int main(){int a[4]; *a=1; return *a;}"
assert -cl 1  "int main(){int a[4]; *a=1; *a=1; return *a;}"
assert -cl 2  "int main(){int a[4]; *a=1; *(a+1)=2; return *(a+1);}"
assert -cl 1  "int main(){int a[4]; int *p; *a=1; return *a;}"
assert -cl 1  "int main(){int a[4]; int *p; p=a; *p=1; return *a;}"
assert -cl 3  "int main(){int a[4]; *a=1; *(a+1)=2; int *p; p=a; return *p + *(p+1);}"

assert -cl 1  "int main(){int a[4]; a[0]=1; return a[0];}"
assert -cl 3  "int main(){int a[4]; a[0]=1; a[1]=2; return a[0]+a[1];}"
assert -cl 10  "int main(){int a[5]; int sum; int i; sum=0; i=0; while(i<5){a[i]=i; i=i+1;} i=0; while(i<5){sum=sum+a[i];i=i+1;} return sum;}"

assert -cl 0  "int a; int main(){a;}"
assert -cl 0  "int a[10]; int main(){a[5];}"
assert -cl 2  "int a; int b; int main(){a=2;a;}"
assert -cl 5  "int a; int b; int main(){a=2;b=3;a+b;}"
assert -cl 5  "int a; int b; int main(){int a;a=2;b=3;a+b;}"

assert -cl 2  "int main(){char a;a=2;return a;}"
assert -cl 25 "int main(){char a;char b;char c;char d; a=3;b=2;c=12;d=17;(d-c)*(a+b);}"
assert -cl 9  "int main(){char a;char b;char c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;}"
assert -cl 3  "int main(){char x; char *y; char **z; y=&x;z=&y;**z=3;return x;}"
assert -cl 4  "int main(){char x; sizeof(x+2);}"
assert -cl 3  "int main(){char a[4]; *a=1; *(a+1)=2; char *p; p=a; return *p + *(p+1);}"

assert -cl 101  'int main(){char *x; x="hello"; x[1];}'
assert -cl 108  'int main(){char *x; x="hello"; *(x+2);}'

assert -cl 5  'int main(){int i; int x[10];/* set counter */ for(i=0;i<10;i=i+1) x[i]=i; return x[5];}'
assert -cl 5  "int main(){int a=8;a=a-3;a;}"
assert -cl 108 'int main(){char *x="hello"; *(x+2);}'
assert -cl 108 'int main(){char x[]="hello"; *(x+2);}'
assert -cl 108 'int main(){char x[6]="hello"; *(x+2);}'
assert -cl 4 'int main(){int a[]={0,1,2,3,4}; return a[4];}'
assert -cl 4 'int main(){int a[5]={0,1,2,3,4}; return a[4];}'
assert -cl 0 'int main(){int a[5]={0,1,2}; return a[4];}'
assert -cl 4 'int add(int x,int y){return x+y;} int main(){int a[5]={0,1,2,add(1,3),4}; return a[3];}'
assert -cl 72 'int main(){int i; int k; int x[10][10]; for(i=1;i<=9;i++){ for(k=1;k<=9;k++){ x[k][i]=i*k; }} return x[8][9];}'
assert -cl 72 'int x[10][10]; int main(){int i; int k; for(i=1;i<=9;i++){ for(k=1;k<=9;k++){ x[k][i]=i*k; }} return x[8][9];}'
assert -cl 5 "int main(){int x[2][3]; int *y; x[1][2]=5; y=x[1]; y[2];}"
assert -cl 8 "int main(){int x[2][3]; int *y; int *z; x[1][1]=5; x[1][2]=3; y=x[1]; z=y; return *(y+1) + z[2];}"

assert -cl 5  "int a=8; int main(){a=a-3;a;}"
assert -cl 108 'char *x="hello"; int main(){*(x+2);}'
assert -cl 108 'char x[]="hello"; int main(){*(x+2);}'
assert -cl 108 'char x[6]="hello"; int main(){*(x+2);}'
assert -cl 4 'int a[]={0,1,2,3,4}; int main(){return a[4];}'
assert -cl 4 'int a[5]={0,1,2,3,4}; int main(){return a[4];}'
assert -cl 0 'int a[5]={0,1,2}; int main(){return a[4];}'

assert -cl 7 'int main(){int x=3; int a=x++; return a+x;}'
assert -cl 8 'int main(){int x=3; int a=++x; return a+x;}'
assert -cl 5 'int main(){int x=3; int a=x--; return a+x;}'
assert -cl 4 'int main(){int x=3; int a=--x; return a+x;}'
assert -cl 0 'int main(){int x[4]={0,1,2,3}; int *p; int *q; p=x; q=p++; return *q;}'
assert -cl 1 'int main(){int x[4]={0,1,2,3}; int *p; int *q; p=x; q=++p; return *q;}'
assert -cl 12 'int global = 7; int *f(int *x){*x += 1; global += 1; return x;} int main(){int x=3; x = (*f(&x))++; return global + x;}'

assert -cl 7 'int main(){int x=4; int y=3; x+=y; return x;}'
assert -cl 1 'int main(){int x=4; int y=3; x-=y; return x;}'
assert -cl 9 'int main(){int x=3; int y=3; x*=y; return x;}'
assert -cl 4 'int main(){int x=12; int y=3; x/=y; return x;}'
assert -cl 6 'int main(){int i; int x[4]={0,1,2,3}; int y[4]={0,1,2,3}; int *p=x; int *q=y; for(i=0;i<4;i++){*(p++)+=*(q++);} return x[3];}'
assert -cl 21 'int global = 7; int *f(int *x){*x += 4; global += 3; return x;} int main(){int x=3; *f(&x) += 4; return global + x;}'

assert -cl 97 "int main(){return 'a';}"
assert -cl 1 "int main(){int flag; char *hello=\"hello\"; if(hello[1] == 'e') flag=1; else flag=0; return flag;}"

assert -cl 5 "struct test{int a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;}"
assert -cl 5 "struct test{char a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;}"
assert -cl 5 "struct test{int a; int b;}; int main(){struct test x; struct test *y; y=&x; y->a=2; y->b=3; return y->a + y->b;}"
assert -cl 5 "struct test{int a; int b;}; int main(){struct test x; struct test *y; struct test **z; y=&x; z=&y; (*z)->a=2; (*z)->b=3; return (*z)->a + (*z)->b;}"



echo OK
