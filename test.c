int a[10][10];

int foo(int p[10][10]){
        int q;
        q = ((p+=1)-1)[0][0];
        // q=100, p[0][0] = 74
        return q+p[0][0];
}

int main(){
        a[0][0] = 100;
        a[1][0] = 74;
        return foo(a);// expected 174
}
