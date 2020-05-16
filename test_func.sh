assert() {
	input="$1"

	echo "$input"

	./cc_sakura "$input" > tmp.s
	gcc -c tmp.s src/func.c
	gcc -o tmp tmp.o func.o
	./tmp
	
	echo ""
#	actual="$?"
#	echo "$input => $actual"
}

assert "func();"
assert "addtest(1,2);"
assert "addtest(23,27);"
assert "a=2;b=3;addtest(a,b);"
assert "a=2;b=3;addtest(a,a+b);"

echo done.
