assert() {
	expected="$1"
	input="$2"

	./cc_sakura "$input" > tmp.s
	gcc -c tmp.s src/func.c
	gcc -o tmp tmp.o func.o
	./tmp
	
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

assert 127 "func();"
assert 127 "addtest(1,2);"

echo OK
