int main(){
    _Bool  b = 1;
    char   c = 2;
    int    i = 3;
    size_t s = 4;
    int   *p = 5;

    b = (_Bool)  c;
    b = (_Bool)  i;
    b = (_Bool)  s;
    b = (_Bool)  p;

    c = (char)   b;
    c = (char)   i;
    c = (char)   s;
    c = (char)   p;

    i = (int)    b;
    i = (int)    c;
    i = (int)    s;
    i = (int)    p;

    s = (size_t) b;
    s = (size_t) c;
    s = (size_t) i;
    s = (size_t) p;

    p = (int *)  b;
    p = (int *)  c;
    p = (int *)  i;
    p = (int *)  s;
    return 0;
}
