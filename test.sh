#!/bin/bash
assert() {
	expected="$1"
	input="$2"

	./cc_sakura "$input" > tmp.s
	gcc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

assert 0  "int main(){0;}"
assert 42 "int main(){42;}"

assert 21 "int main(){5+20-4;}"
assert 41 "int main(){12 + 34 - 5;}"

assert 47 "int main(){5+6*7;}"
assert 15 "int main(){5*(9-6);}"
assert 4  "int main(){(3+5)/2;}"
assert 17 "int main(){(-3+5)+15;}"
assert 21 "int main(){(-3*-2)+15;}"

assert 0  "int main(){5<4;}"
assert 1  "int main(){5>4;}"

assert 1  "int main(){12 == 12;}"
assert 0  "int main(){12 == 11;}"
assert 1  "int main(){12 != 13;}"
assert 0  "int main(){12 != 12;}"

assert 8  "int main(){5+3;6+2;}"
assert 5  "int main(){int a;int b;a=3;b=2;a+b;}"
assert 5  "int main(){int a;a=8;a=a-3;a;}"
assert 25 "int main(){int a;int b;int c;int d; a=3;b=2;c=12;d=17;(d-c)*(a+b);}"

assert 5  "int main(){int abc; int def; abc=3;def=2;abc+def;}"
assert 6  "int main(){int kinako;int momone; kinako=3;momone=2;momone*kinako;}"

assert 5  "int main(){return 2+3;}"
assert 5  "int main(){int a;int b; a=13;b=8;return a-b;}"

assert 1  "int main(){int a; a=0;if(3>2) a=1;a;}"
assert 0  "int main(){int a; a=0;if(3<2) a=1;a;}"
assert 7  "int main(){int a; a=1+2;if(3>2) a=10-3;a;}"
assert 3  "int main(){int a; a=1+2;if(3<2) a=10-3;a;}"
assert 1  "int main(){int a;int b;int c; a=2;b=3;c=a+b;if(a<b) c=b-a;c;}"
assert 5  "int main(){int a;int b;int c; a=2;b=3;c=a+b;if(a>b) c=b-a;c;}"

assert 5  "int main(){int a; if(2>3) a=3-2; else a=2+3;a;}"
assert 1  "int main(){int a; if(2<3) a=3-2; else a=2+3;a;}"
assert 9  "int main(){int a;int b;int c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;}"
assert 2  "int main(){int a;int b;int c; a=2;b=3;if(a<b) c=b-a/a; else c=a+b*b-a;c;}"

assert 0  "int main(){int a; a=10;while(a>0) a=a-1;a;}"
assert 10 "int main(){int a; a=10;while(a<0) a=a-1;a;}"

assert 2  "int main(){int a;int b;int c; a=2;b=3;c=5;if(a>b){a=a+b;a=a+c;} a;}"
assert 13 "int main(){int a;int b;int c; a=2;b=3;c=5;if(a<b){a=a+b;a=a+b+c;} a;}"

assert 9  "int func(){return 9;} int main(){int b; b=func();b;}"
assert 9  "int func(){int a; a=9;return a;} int main(){int b; b=func();b;}"
assert 3  "int func(){int a; a=9;return a;} int main(){int b;int c; b=3;c=func();b;}"

assert 1  "int func(int a){return a;} int main(){int b;b=func(1);b;}"
assert 1  "int func(int a){return a;} int main(){int a;a=func(1);a;}"

assert 5  "int add(int a,int b){return a+b;} int main(){add(2,3);}"
assert 5  "int add(int a,int b){return a+b;} int main(){int a;int b; a=2;b=3;add(a,b);}"
assert 9  "int add(int a,int b,int c){return a+b+c;} int main(){int a;int b;int c; a=2;b=3;c=4;add(a,b,c);}"

assert 55 "int fibo(int num){if(num==0){return 0;}if(num==1){return 1;} return fibo(num-1)+fibo(num-2);} int main(){fibo(10);}"

assert 10 "int main(){int a; int b; a=0;b=1;b=&a;a=10;*b;}"
assert 2  "int main(){int a; int b;int c; a=2;b=3;c=&b+8;*c;}"
assert 3  "int main(){int x; int *y; y=&x;*y=3;return x;}"
assert 3  "int main(){int x; int *y; int **z; y=&x;z=&y;**z=3;return x;}"

echo OK
