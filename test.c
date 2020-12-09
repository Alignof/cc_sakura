/*
   char reg_ax[8][4] = {"al", "al", "al", "eax","rax","rax","rax","eax"};
   int main(){
           printf("%s\n", reg_ax[4]);
           return;
   }
 */

/*
char str[12] = "hello";
int main(){
        printf("%s\n", str);
        return 0;
}
*/

int global = 7;
int *f(int *x){*x += 1; global += 1; return x;}
int main(){int x=3; x = (*f(&x))++; return global + x;}
