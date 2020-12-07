//int foo(char a){int d;d = 3;char c;c = a+d;return c;} int main(){char f;f=3;return foo(f)*4+150;}
//int main(){int a[10][5];int *q;q = *(a+1); *q=174; return **(a+1);}
int main(){int a[10][5]; int *q=a[1]; *q=174; return a[1][0];}
