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

char x[6]="hello";
int main(){*(x+2);}
