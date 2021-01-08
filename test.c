int puts(const char *str);
int atoi(const char *str);
int f(int a){int (*arr[2])(const char *str);arr[0] = &puts;arr[1] = &atoi;return arr[a]("123");}
int main(){f(0); return f(1);}
