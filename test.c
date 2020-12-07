int *f(int *p){return p;} int main(){int a[4]; a[0] = 1; f(a)[0]++; f(a)[1] = 172; return a[1]+a[0];} // expect 174
