assert() {
	input="$1"

	echo "$input"

	./cc_sakura "$input" > tmp.s
	gcc -c tmp.s 
	gcc -c -o src/obj/func_for_test.o src/func_for_test.c
	gcc -o tmp tmp.o src/obj/func_for_test.o
	./tmp
	
	echo ""
#	actual="$?"
#	echo "$input => $actual"
}

assert "main(){func();}"
assert "main(){addtest(1,2);}"
assert "main(){addtest(23,27);}"
assert "main(){a=2;b=3;addtest(a,b);}"
assert "main(){a=2;b=3;addtest(a,a+b);}"
assert "main(){a=2;b=3;c=7;addtest(a,b);}"


echo done.
