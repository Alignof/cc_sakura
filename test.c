struct rgb {
    int r;
    int g;
    int b;
};
struct point {
    int x;
    int y;
    struct rgb *col;
};
int main() {
    struct point test;
    struct rgb c;
    test.col = &c;
    test.col -> r = 2;
    test.col -> g = 3;
    test.col -> b = 4;
    return test.col -> r + test.col -> g + test.col -> b;
}
