extern struct __sFILE64;
typedef struct __sFILE64 __FILE;
struct _reent {
  int _errno;			/* local copy of errno */

  /* FILE is a big struct and may change over time.  To try to achieve binary
     compatibility with future versions, put stdin,stdout,stderr here.
     These are pointers into member __sf defined below.  */
  __FILE *_stdin;
  __FILE *_stdout;
  __FILE *_stderr;

  // ommit
};

extern struct _reent *__getreent(void);
#define _REENT (__getreent())
#define	stderr (_REENT->_stderr)
extern int *__errno (void);
#define errno (*__errno())
int main(void){
    fprintf(stderr, "hello error world!: %d\n", errno);
    return 0;
}

