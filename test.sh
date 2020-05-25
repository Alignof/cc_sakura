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

assert 0  "main(){0;}"
assert 42 "main(){42;}"

assert 21 "main(){5+20-4;}"
assert 41 "main(){12 + 34 - 5;}"

assert 47 "main(){5+6*7;}"
assert 15 "main(){5*(9-6);}"
assert 4  "main(){(3+5)/2;}"
assert 17 "main(){(-3+5)+15;}"
assert 21 "main(){(-3*-2)+15;}"

assert 0  "main(){5<4;}"
assert 1  "main(){5>4;}"

assert 1  "main(){12 == 12;}"
assert 0  "main(){12 == 11;}"
assert 1  "main(){12 != 13;}"
assert 0  "main(){12 != 12;}"

assert 8  "main(){5+3;6+2;}"
assert 5  "main(){a=3;b=2;a+b;}"
assert 5  "main(){a=8;a=a-3;a;}"
assert 25 "main(){a=3;b=2;c=12;d=17;(d-c)*(a+b);}"

assert 5  "main(){abc=3;def=2;abc+def;}"
assert 6  "main(){kinako=3;momone=2;momone*kinako;}"

assert 5  "main(){return 2+3;}"
assert 5  "main(){a=13;b=8;return a-b;}"

assert 1  "main(){a=0;if(3>2) a=1;a;}"
assert 0  "main(){a=0;if(3<2) a=1;a;}"
assert 7  "main(){a=1+2;if(3>2) a=10-3;a;}"
assert 3  "main(){a=1+2;if(3<2) a=10-3;a;}"
assert 1  "main(){a=2;b=3;c=a+b;if(a<b) c=b-a;c;}"
assert 5  "main(){a=2;b=3;c=a+b;if(a>b) c=b-a;c;}"

assert 5  "main(){if(2>3) a=3-2; else a=2+3;a;}"
assert 1  "main(){if(2<3) a=3-2; else a=2+3;a;}"
assert 9  "main(){a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;}"
assert 2  "main(){a=2;b=3;if(a<b) c=b-a/a; else c=a+b*b-a;c;}"

assert 0  "main(){a=10;while(a>0) a=a-1;a;}"
assert 10 "main(){a=10;while(a<0) a=a-1;a;}"

assert 2  "main(){a=2;b=3;c=5;if(a>b){a=a+b;a=a+c;} a;}"
assert 13 "main(){a=2;b=3;c=5;if(a<b){a=a+b;a=a+b+c;} a;}"

assert 0  "func(){return 0;} main(){func();}"
assert 9  "func(){return 9;} main(){b=func();b;}"
assert 9  "func(){a=9;return a;} main(){b=func();b;}"
assert 3  "func(){a=9;return a;} main(){b=3;c=func();b;}"

echo OK
