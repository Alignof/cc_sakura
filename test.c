struct A{int a;}; int main(){struct A arr[5]; void *p = arr; int *q = p; q[3] = 174; return arr[3].a;}
