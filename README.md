# cc\_sakura
![C/C++ CI](https://github.com/Takana-Norimasa/cc_sakura/workflows/C/C++%20CI/badge.svg)  
C Compiler Sakura  
a small self-hosting C compiler.  

## Build
```zsh
# build
$ git clone https://github.com/Takana-Norimasa/cc_sakura.git
$ cd cc_sakura
$ make install

# test
$ make test

# self-hosting test
$ cd self_host/
$ make self_host
```

## Special thanks
- Rui Ueyama ([@.rui314](https://github.com/rui314))  
- hikalium ([@.hikalium](https://github.com/hikalium))  
- hsjoihs ([@.hsjoihs](https://github.com/hsjoihs))  
- azarashi ([@.azarashi2931](https://github.com/azarashi2931))  
- [security camp 2020](https://www.security-camp.or.jp/camp/)  

thank you so much!




## Example

### FizzBuzz  
```c
int main(){
	int i;
	int max=0;

	scanf("%d",&max);
	for(i=1;i<=max;i++){
		if(i%3==0 && i%5==0){
			printf("FizzBuzz\n");
		}else if(i%3==0){
			printf("Fizz\n");
		}else if(i%5==0){
			printf("Buzz\n");
		}else{
			printf("%d\n",i);
		}
	}
	return 0;
}
```

### 2d array
```c
int main(){
	int i;
	int k;
	int x[10][10];

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			x[k][i] = i*k;
		}
	}

	for(i=1;i<=9;i++){
		for(k=1;k<=9;k++){
			printf("%2d ",x[k][i]);
		}
		printf("\n");
	}

	return 0;
}
```

### N queen
```c
int count;
int solve(int n, int col, int *hist){
	if (col == n) { count += 1; return 0;}
	int i = 0;
	int j = 0;
	for (; i < n; i++) {
		for (j = 0; j < col && hist[j] != i && (hist[j] - i) != col - j && (hist[j] - i) != j - col; j++) {
		}

		if (j < col) continue;
		hist[col] = i; solve(n, col + 1, hist);
	}
	return 0;
}

int main(){
	int hist[12]; int i;
	for (i = 1; i < 12; i++) {
		count = 0; solve(i, 0, hist); printf("%d queen(s): ", i);
		printf("%d\n", count);
	}
	return 0;
}
```

### Duff's device
```c
int main(){
	char *psz1 = calloc(100, sizeof(char));
	char *psz2 = "abcdefghijklmnopqrstuvwxyz";
	char *to   = psz1;
	char *from = psz2;
	int  count = 26;

	switch (count % 8) {
		case 0:  do {  *to++ = *from++;
		case 7:        *to++ = *from++;
		case 6:        *to++ = *from++;
		case 5:        *to++ = *from++;
		case 4:        *to++ = *from++;
		case 3:        *to++ = *from++;
		case 2:        *to++ = *from++;
		case 1:        *to++ = *from++;
			} while ((count -= 8) > 0);
	}

	printf("to	:%s\n", psz1);
	printf("from	:%s\n", psz2);
}
```

### struct
```c
struct test{ 
	char momone;
	char kinako;
	char shion;
	char aoi;
	char suigyoku;
	char syuka;
};

int main(){
	int sum = 0;
	struct test xanadu;
	struct test *ptr;
	ptr = &xanadu;

	xanadu.momone	= 1;
	xanadu.kinako	= 2;
	xanadu.shion	= 3;
	xanadu.aoi	= 4;
	xanadu.suigyoku	= 5;
	xanadu.syuka	= 6;

	sum += ptr->momone;
	sum += ptr->kinako;
	sum += ptr->shion;
	sum += ptr->aoi;
	sum += ptr->suigyoku;
	sum += ptr->syuka;

	// expect 21
	return sum;
}
```

### testcode  
```c
./test.sh
int main(){0;} => 0
int main(){42;} => 42
int main(){5+20-4;} => 21
int main(){12 + 34 - 5;} => 41
int main(){5+6*7;} => 47
int main(){5*(9-6);} => 15
int main(){(3+5)/2;} => 4
int main(){(-3+5)+15;} => 17
int main(){(-3*-2)+15;} => 21
int main(){(-3*-2)%(5*(9-6)/5);} => 0
int main(){5<4;} => 0
int main(){5>4;} => 1
int main(){12 == 12;} => 1
int main(){12 == 11;} => 0
int main(){12 != 13;} => 1
int main(){12 != 12;} => 0
int main(){!(12 == 11);} => 1
int main(){!(12 != 12);} => 1
int main(){1 && 1;} => 1
int main(){1 && 0;} => 0
int main(){0 || 0;} => 0
int main(){1 || 0;} => 1
int main(){!(1 && 1);} => 0
int main(){!(1 && 0);} => 1
int main(){!(0 || 0);} => 1
int main(){!(1 || 0);} => 0
int main(){5+3;6+2;} => 8
int main(){int a;int b;a=3;b=2;a+b;} => 5
int main(){int a_1;int b_2;a_1=3;b_2=2;a_1+b_2;} => 5
int main(){int a;a=8;a=a-3;a;} => 5
int main(){int a;int b;int c;int d; a=3;b=2;c=12;d=17;(d-c)*(a+b);} => 25
int main(){int abc; int def; abc=3;def=2;abc+def;} => 5
int main(){int kinako;int momone; kinako=3;momone=2;momone*kinako;} => 6
int main(){return 2+3;} => 5
int main(){int a;int b; a=13;b=8;return a-b;} => 5
int main(){int a; a=0;if(3>2) a=1;a;} => 1
int main(){int a; a=0;if(3<2) a=1;a;} => 0
int main(){int a; a=1+2;if(3>2) a=10-3;a;} => 7
int main(){int a; a=1+2;if(3<2) a=10-3;a;} => 3
int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a<b) c=b-a;c;} => 1
int main(){int a; int b;int c; a=2;b=3;c=a+b;if(a>b) c=b-a;c;} => 5
int main(){int a=0; return !a;} => 1
int main(){int a=9; return !a;} => 0
int main(){int a; if(2>3) a=3-2; else a=2+3;a;} => 5
int main(){int a; if(2<3) a=3-2; else a=2+3;a;} => 1
int main(){int a; if(!(2<3)) a=3-2; else a=2+3;a;} => 5
int main(){int a; int b;int c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;} => 9
int main(){int a; int b;int c; a=2;b=3;if(a<b) c=b-a/a; else c=a+b*b-a;c;} => 2
int main(){int a; a=10;while(a>0) a=a-1;a;} => 0
int main(){int a; a=10;while(a<0) a=a-1;a;} => 10
int main(){int a; int i; a=0; for(i=0;i<10;i=i+1) a=a+1;a;} => 10
int main(){int a; int i; a=1; for(i=0;i<6;i=i+1) a=a*2;a;} => 64
int main(){int i; for(i=0;i<10;i++){if(i==5) break;} return i;} => 5
int main(){int i=0; while(i<10){if(i==5){break;}i++;} return i;} => 5
int main(){int i; int k; int l; int x=0; for(i=0;i<5;i++){for(k=0;k<10;k++){if(k==5){break;} x++;}for(l=0;l<10;l++){if(l==5){break;} x++;}} return x;} => 50
int main(){int i; int x[10];for(i=0;i<10;i++){if(i == 5){x[i]=13;continue;}x[i]=i;} return x[5]+x[3];} => 16
int main(){int i=-1; int x[10]; while(i<10){i++;if(i == 5){x[i]=13;continue;}x[i]=i;} return x[5]+x[3];} => 16
int main(){int i; int k; int x=0; for(i=0;i<10;i++){for(k=0;k<10;k++){if(k==5){break;} x++;}} return x;} => 50
int main(){int i=1; int x; switch(i){case 0:x=2;break; case 1:x=3;break; case 2:x=4;break; default:x=5;} return x;} => 3
int main(){int i=1; int x; switch(i){case 0:x=2;break; case 1:x=3; case 2:x=4;break; default:x=5;} return x;} => 4
int main(){int i=8; int x; switch(i){case 0:x=2;break; case 1:x=3;break; case 2:x=4;break; default:x=5;} return x;} => 5
int main(){int i; int x=1; for(i=0; i<4; i++){switch(i){case 0:x=2;break; case 1:x=3;break; case 2:x=4;break; default:x=10;}} return x;} => 10
int main(){int i;for(i=0;i<12;i++){while(i<0);while(i<0);if(i==6) break;}return i;} => 6
int main(){int a;int b;int c; a=2;b=3;c=5;if(a>b){a=a+b;a=a+c;} a;} => 2
int main(){int a;int b;int c; a=2;b=3;c=5;if(a<b){a=a+b;a=a+b+c;} a;} => 13
int main(){int x; int y=1; x =(y==1)?2:3; return x;} => 2
int main(){int x; int y=1; x =(y==5)?2:3; return x;} => 3
int main(){int x; int y=2; int z=5; x=(y==2) ? ((z==4)?8:4) : 3; return x;} => 4
int func(){return 9;} int main(){int b; b=func();b;} => 9
int func(){int a; a=9;return a;} int main(){int b; b=func();b;} => 9
int func(){int a; a=9;return a;} int main(){int b;int c; b=3;c=func();b;} => 3
int func(int a){return a;} int main(){int b;b=func(1);b;} => 1
int func(int a){return a;} int main(){int a;a=func(1);a;} => 1
int i=0; void increment(void){i++; return;} int main(){increment(); return i;} => 1
int add(int a,int b){return a+b;} int main(){add(2,3);} => 5
int add(int a,int b){return a+b;} int main(){int a;int b; a=2;b=3;add(a,b);} => 5
int add(int a,int b,int c){return a+b+c;} int main(){int a;int b;int c; a=2;b=3;c=4;add(a,b,c);} => 9
int fibo(int num){if(num==0){return 0;}if(num==1){return 1;} return fibo(num-1)+fibo(num-2);} int main(){fibo(10);} => 55
int main(){int x; int *y; y=&x;*y=3;return x;} => 3
int main(){int x; int *y; int **z; y=&x;z=&y;**z=3;return x;} => 3
int main(){int x; sizeof(x);} => 4
int main(){int *x; sizeof(x);} => 8
int main(){int x; sizeof(&x);} => 8
int main(){int x; sizeof(x+2);} => 4
int main(){int *x; sizeof(x+2);} => 8
int main(){int *x; sizeof((x));} => 8
int main(){char x[4]; sizeof((x));} => 4
int main(){int x[4]; sizeof((x));} => 16
int main(){int x[4][4]; sizeof((x));} => 64
int main(){int x[4][4]; sizeof((x[0]));} => 16
int main(){return sizeof(char);} => 1
int main(){return sizeof(int);} => 4
int main(){return sizeof(char *);} => 8
int main(){return sizeof(int **);} => 8
int main(){return sizeof(__NULL);} => 8
int main(){return sizeof(*__NULL);} => 1
int main(){char x[]="hello"; return sizeof(x);} => 6
int main(){int x[]={0,1,2}; return sizeof(x);} => 12
int main(){int x[5]={0,1,2}; return sizeof(x);} => 20
int main(){int a[4]; *a=1; return *a;} => 1
int main(){int a[4]; *a=1; *a=1; return *a;} => 1
int main(){int a[4]; *a=1; *(a+1)=2; return *(a+1);} => 2
int main(){int a[4]; int *p; *a=1; return *a;} => 1
int main(){int a[4]; int *p; p=a; *p=1; return *a;} => 1
int main(){int a[4]; *a=1; *(a+1)=2; int *p; p=a; return *p + *(p+1);} => 3
int main(){int a[4]; a[0]=1; return a[0];} => 1
int main(){int a[4]; a[0]=1; a[1]=2; return a[0]+a[1];} => 3
int main(){int a[5]; int sum; int i; sum=0; i=0; while(i<5){a[i]=i; i=i+1;} i=0; while(i<5){sum=sum+a[i];i=i+1;} return sum;} => 10
int a; int main(){a;} => 0
int a[10]; int main(){a[5];} => 0
int a; int b; int main(){a=2;a;} => 2
int a; int b; int main(){a=2;b=3;a+b;} => 5
int a; int b; int main(){int a;a=2;b=3;a+b;} => 5
int main(){char a;a=2;return a;} => 2
int main(){char a;char b;char c;char d; a=3;b=2;c=12;d=17;(d-c)*(a+b);} => 25
int main(){char a;char b;char c; a=2;b=3;if(a>b) c=b-a/a; else c=a+b*b-a;c;} => 9
int main(){char x; char *y; char **z; y=&x;z=&y;**z=3;return x;} => 3
int main(){char x; sizeof(x+2);} => 4
int main(){char a[4]; *a=1; *(a+1)=2; char *p; p=a; return *p + *(p+1);} => 3
int main(){char *x; x="hello"; x[1];} => 101
int main(){char *x; x="hello"; *(x+2);} => 108
int main(){int i; int x[10];/* set counter */ for(i=0;i<10;i=i+1) x[i]=i; return x[5];} => 5
int main(){int a=8;a=a-3;a;} => 5
int main(){char *x="hello"; *(x+2);} => 108
int main(){char x[]="hello"; *(x+2);} => 108
int main(){char x[6]="hello"; *(x+2);} => 108
int main(){int a[]={0,1,2,3,4}; return a[4];} => 4
int main(){int a[5]={0,1,2,3,4}; return a[4];} => 4
int main(){int a[5]={0,1,2}; return a[4];} => 0
int add(int x,int y){return x+y;} int main(){int a[5]={0,1,2,add(1,3),4}; return a[3];} => 4
int main(){int i; int k; int x[10][10]; for(i=1;i<=9;i++){ for(k=1;k<=9;k++){ x[k][i]=i*k; }} return x[8][9];} => 72
int x[10][10]; int main(){int i; int k; for(i=1;i<=9;i++){ for(k=1;k<=9;k++){ x[k][i]=i*k; }} return x[8][9];} => 72
int main(){int x[2][3]; int *y; x[1][2]=5; y=x[1]; y[2];} => 5
int main(){int x[2][3]; int *y; int *z; x[1][1]=5; x[1][2]=3; y=x[1]; z=y; return *(y+1) + z[2];} => 8
int main(){int x[2][3][4]; x[1][1][1]=5; x[1][2][3]=3; return x[1][1][1] + x[1][2][3];} => 8
int a=8; int main(){a=a-3;a;} => 5
char *x="hello"; int main(){*(x+2);} => 108
char x[]="hello"; int main(){*(x+2);} => 108
char x[6]="hello"; int main(){*(x+2);} => 108
int a[]={0,1,2,3,4}; int main(){return a[4];} => 4
int a[5]={0,1,2,3,4}; int main(){return a[4];} => 4
int a[5]={0,1,2}; int main(){return a[4];} => 0
char reg_ax[8][4] = {"al", "al", "al", "eax","rax","rax","rax","eax"};int main(){return reg_ax[1][0];} => 97
int main(){int x=3; int a=x++; return a+x;} => 7
int main(){int x=3; int a=++x; return a+x;} => 8
int main(){int x=3; int a=x--; return a+x;} => 5
int main(){int x=3; int a=--x; return a+x;} => 4
int main(){int x[4]={0,1,2,3}; int *p; int *q; p=x; q=p++; return *q;} => 0
int main(){int x[4]={0,1,2,3}; int *p; int *q; p=x; q=++p; return *q;} => 1
int global = 7; int *f(int *x){*x += 1; global += 1; return x;} int main(){int x=3; x = (*f(&x))++; return global + x;} => 12
int main(){int x=4; int y=3; x+=y; return x;} => 7
int main(){int x=4; int y=3; x-=y; return x;} => 1
int main(){int x=3; int y=3; x*=y; return x;} => 9
int main(){int x=12; int y=3; x/=y; return x;} => 4
int main(){int i; int x[4]={0,1,2,3}; int y[4]={0,1,2,3}; int *p=x; int *q=y; for(i=0;i<4;i++){*(p++)+=*(q++);} return x[3];} => 6
int global = 7; int *f(int *x){*x += 4; global += 3; return x;} int main(){int x=3; *f(&x) += 4; return global + x;} => 21
int main(){return 'a';} => 97
int main(){return '\0';} => 0
int main(){return '\t';} => 9
int main(){return '\n';} => 10
int main(){return '\\';} => 92
int main(){int flag; char *hello="hello"; if(hello[1] == 'e') flag=1; else flag=0; return flag;} => 1
struct test{int a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;} => 5
struct test{char a; int b;}; int main(){struct test x; x.a=2; x.b=3; return x.a + x.b;} => 5
struct test{int a; int b;}; int main(){struct test x; struct test *y; y=&x; y->a=2; y->b=3; return y->a + y->b;} => 5
struct test{int a; int b;}; int main(){struct test x; struct test *y; struct test **z; y=&x; z=&y; (*z)->a=2; (*z)->b=3; return (*z)->a + (*z)->b;} => 5
struct test{int a; int b; int c[10];}; int main(){struct test x; x.a=1; x.b=2; x.c[0]=3; x.c[2]=4; return x.a + x.b + x.c[0] + x.c[2];} => 10
struct rgb{int r; int g; int b;}; struct point{int x; int y; struct rgb col;}; int main(){struct point test; test.col.r=2; test.col.g=3; test.col.b=4; return test.col.r + test.col.g + test.col.b;} => 9
struct rgb{int r; int g; int b;}; struct point{int x; int y; struct rgb *col;}; int main(){struct point test; test.col->r=2; test.col->g=3; test.col->b=4; return test.col->r + test.col->g + test.col->b;} => 9
struct rgb{int r; int g; int b;}; struct point{int x; int y; struct rgb *col;}; int main(){struct point test; struct point *ptr; ptr=&test; ptr->col->r=2; ptr->col->g=3; ptr->col->b=4; return ptr->col->r + ptr->col->g + ptr->col->b;} => 9
enum Color{Red, Green, Blue}; int main(){return Blue;} => 2
enum Color{Red, Green, Blue}; int main(){enum Color test; test=Blue; return test;} => 2
enum Color{Red, Green, Blue}; int main(){int Blue = 17; return Blue;} => 17
int main(){enum Color{Red, Green, Blue}; return Blue;} => 2
int main(){enum Color{Red, Green, Blue}; enum Color test; test=Blue; return test;} => 2
int main(){enum Color{Red, Green, Blue}; enum Color test=Green; int result=13; switch(test){case Red:result=0;break; case Green:result=1;break; case Blue:result=2;break;} return result;} => 1
int main(){enum Color{Red, Green, Blue} test=Blue; int result=13; switch(test){case Red:result=0;break; case Green:result=1;break; case Blue:result=2;break;} return result;} => 2
int main(){int x=0; int y=1; int z=2; if(x == 0){int y=4;}else{int y=11;} return y+z;} => 3
int main(){int x=0; int z=2; if(x == 0){int y=4;}else{int y=11;} int y=1; return y+z;} => 3
int main(){int x=0; int z=2; if(x == 0){if(z==2){int x=2; int y=4; z=x+y;}} int y=1; return y+z;} => 7
typedef char moji; int main(void){moji head='a'; return head;} => 97
typedef char moji; int main(void){moji head='a'; return sizeof(moji);} => 1
typedef int suuji; suuji main(void){suuji x = 3; return sizeof(suuji) + x;} => 7
typedef int suuji; typedef int* int_ptr; suuji main(void){suuji x=3; int_ptr ptr=&x; return *ptr;} => 3
typedef int suuji; typedef int* int_ptr; typedef int** int_ptr_ptr; suuji main(void){suuji x=3; int_ptr y=&x; int_ptr_ptr z=&y; return **z;} => 3
typedef enum Color{Red, Green, Blue}Color; int main(){Color test; test=Blue; return test;} => 2
typedef enum Color Color; Color{Red, Green, Blue}; int main(){Color test; test=Blue; return test;} => 2
typedef enum{RED,GREEN,BLUE,}COLOR; int main(void){COLOR c = GREEN; return GREEN;} => 1
typedef struct test{int a; int b;}Test; int main(){Test x; x.a=2; x.b=3; return x.a + x.b;} => 5
typedef struct test Test; Test{int a; int b;}; int main(){Test x; x.a=2; x.b=3; return x.a + x.b;} => 5
typedef struct test Test; struct test{int r; int g; int b; Test *next;}; int main(void){Test x; Test y; x.r=1; x.g=2; x.b=3; y.r=4; y.g=5; y.b=6; x.next = &y; return x.next->r;} => 4
int main(){_Bool x = 3; return sizeof(x);} => 1
int main(){_Bool x = 3; return x;} => 1
int main(){_Bool x = 3; x++; return x;} => 1
int main(){_Bool x = 3; x--; return x;} => 0
int main(){_Bool x = 3; x+=3; return x;} => 1
int main(){_Bool x = 3; x-=1; return x;} => 0
int main(){_Bool x = 3; x-=4; return x;} => 1
int main(){_Bool x = 3; return x+3;} => 4
int main(){int x=5; ; return x;} => 5
int main(){int i=0; int x=0; for(;i<10;i++){x++;}return x ;} => 10
int main(){return _Alignof(int); } => 4
int main(){int x; return _Alignof(x); } => 4
int main(){int  a[456]; return _Alignof(a); } => 4
int main(){char a[456]; return _Alignof(a); } => 1
int main(){struct rgb{int r; int g; int b;}; struct rgb x; return _Alignof(x); } => 4
struct rgb{int r; int g; int b;}; struct point{int x; int y; struct rgb *col;}; int main(){struct point x; return _Alignof(x); } => 8
struct rgb{int r; int g; int b;}; struct point{int x; int y; struct rgb *col;}; int main(){struct point x; return _Alignof(struct point); } => 8
int main(){return sizeof(size_t);} => 8
int main(){size_t isize = 8; return sizeof(isize);} => 8
OK
```
