//struct A {int a; int b; int c;}; int main(){struct A a[5]; return a + 3 - a;}// expect 3
int main(){int a[5]; return a + 3 - a;}// expect 3
