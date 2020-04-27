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

assert 0 "0;"
assert 42 "42;"

assert 21 "5+20-4;"
assert 41 "12 + 34 - 5; "

assert 47 "5+6*7;"
assert 15 "5*(9-6);"
assert 4  "(3+5)/2;"
assert 17 "(-3+5)+15;"
assert 21 "(-3*-2)+15;"

assert 0  "5<4;"
assert 1  "5>4;"

assert 1  "12 == 12;"
assert 0  "12 == 11;"
assert 1  "12 != 13;"
assert 0  "12 != 12;"

assert 8  "5+3;6+2;"
assert 5  "a=3;b=2;a+b;"
assert 25 "a=3;b=2;c=12;d=17;(d-c)*(a+b);"

assert 5 "abc=3;def=2;abc+def;"
assert 6 "kinako=3;momone=2;momone*kinako;"
assert 11 "abc=3;def=2;a=4;abc+def*a;"
assert 11 "abc=3;def=2;abd=4;abc+def*abd;"
assert 11 "abc=3;def=2;ab=4;abc+def*ab;"

echo OK
