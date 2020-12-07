//struct A {int a; int b; int c;}; int main(){struct A a[5]; return a + 3 - a;}// expect 3
int main(){int i; int k; int x[10][10]; for(i=1;i<=9;i++){ for(k=1;k<=9;k++){ x[k][i]=i*k; }} return x[8][9];}// 72 expected
