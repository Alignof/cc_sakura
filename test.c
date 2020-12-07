//int foo(char a){int d;d = 3;char c;c = a+d;return c;} int main(){char f;f=3;return foo(f)*4+150;}
int foo(){ return 2;} int bar(){ return 7;} int main() {int a; int b; int c; a = 0;b = 5;c = 2;if(a){b = foo();}else{c = bar();} return 162+b+c;}
