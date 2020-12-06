
//================standard library=====================
typedef struct _IO_FILE FILE;
typedef void   _IO_lock_t;
typedef void*  __off_t;

struct _IO_FILE{
	int _flags;           /* High-order word is _IO_MAGIC; rest is flags. */

	/* The following pointers correspond to the C++ streambuf protocol. */
	char *_IO_read_ptr;   /* Current read pointer */
	char *_IO_read_end;   /* End of get area. */
	char *_IO_read_base;  /* Start of putback+get area. */
	char *_IO_write_base; /* Start of put area. */
	char *_IO_write_ptr;  /* Current put pointer. */
	char *_IO_write_end;  /* End of put area. */
	char *_IO_buf_base;   /* Start of reserve area. */
	char *_IO_buf_end;    /* End of reserve area. */

	/* The following fields are used to support backing up and undo. */
	char *_IO_save_base; /* Pointer to start of non-current get area. */
	char *_IO_backup_base;  /* Pointer to first valid character of backup area */
	char *_IO_save_end; /* Pointer to end of non-current get area. */

	struct _IO_marker *_markers;

	struct _IO_FILE *_chain;

	int _fileno;
	int _flags2;

	__off_t _old_offset; /* This used to be _offset but it's too small.  */

	/* 1+column number of pbase(); 0 is unknown. */
	//unsigned short _cur_column;
	//signed char _vtable_offset;
	int  _cur_column;
	char _vtable_offset;
	char _shortbuf[1];

	_IO_lock_t *_lock;
};

typedef _Bool bool;
typedef int size_t;
typedef char uint8_t;
extern _Thread_local int errno;
bool true  = 1;
bool false = 0;
extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */
int  SEEK_SET = 0;
int  SEEK_END = 2;


int x;
int y;
int ms = 20;
int row;
int column;
int size;
int index_start = 0;
uint8_t *head;
bool no_visualize = 0;
int MEMORY_SIZE = 10000;
char *code;

void within_range(uint8_t *now){
	if(now-head<0 || now>head+MEMORY_SIZE){
		fprintf(stderr, "pointer out of range");
	}
}

void create_flame(){
	int i;

	printf("\033[%d;%dH",++x,y);
	printf("#");
	for(i=1;i<column-30;i++)
		printf("=");

	printf("#\n");
}
	
bool is_token(char c){
	int i;
	char tokens[]="><+-,.[]";
	for(i=0;i<8;i++){
		if(tokens[i]==c) return true;
	}
	return false;
}

void display_code(int now,char *output){
	int index=0;
	bool flag = false;

	//show source
	printf("\033[%d;%dH",++x,y);
	printf("code\n");
	create_flame();
	printf("\033[%d;%dH",++x,y+2);
	while(index < size){
		if(is_token(code[index])){
			if(index==now){
				printf("\033[47m");
				printf("%c",code[index]);
				printf("\033[49m");
			}else{
				printf("%c",code[index]);
			}

			if((index+1)%(column-33)==0){
				printf("\n");
				printf("\033[%d;%dH",++x,y+2);
			}
		}
		index++;

	}
	create_flame();
	
	//show output
	printf("\033[%d;%dH",++x,y);
	printf("\033[%d;%dH",++x,y);
	printf("output:%s\n",output);

}

void display_array(uint8_t *memory,char *output){
	int i;
	int address = memory-head;
	int box_num = (column-4)/5;
	uint8_t *pointer;
	uint8_t *pointer_start;

	x=2;
	y=2;

	//std::system("clear");

	if(address==(index_start+box_num-1)){
		index_start++;
	}else if(address==index_start && address!=0){
		index_start--;
	}

	//show memory
	printf("\033[%d;%dH",x,y+2);
	for(i=index_start;i<(index_start+box_num);i++){
		printf("+%3d",i);
	}
	printf("+\n");
	
	printf("\033[%d;%dH",++x,y+2);
	pointer_start=head+sizeof(uint8_t*)*index_start;
	for(pointer=pointer_start; pointer<(pointer_start+box_num); pointer++){
		printf("|%3d",*(pointer));
	}
	printf("|\n");
	
	printf("\033[%d;%dH",++x,y+2);
	for(i=0;i<box_num;i++){
		printf("+---");
	}
	printf("+\n");
	
	//show pointer
	printf("\033[%d;%dH",++x,y+2);
	for(i=0;i<address-index_start;i++){
		printf("    ");
	}
	printf("  ^\n");
}

void processor(){
	char output[100000];
	int nest=0;
	int index=0;
	int len_out=0;
	char c;
	uint8_t *memory;

	// ms to us
	ms *= 1000;
	memory = calloc(MEMORY_SIZE, sizeof(uint8_t));
	head = memory;

	while(index<size){
		switch(code[index]){
			case '>':
				within_range(++memory);
				break;
			case '<':
				within_range(--memory);
				break;
			case '+':
				(*memory)++;
				break;
			case '-':
				(*memory)--;
				break;
			case '.':
				//std::cout << "out";
				output[len_out]=*memory;
				len_out++;
				printf("%c\n", *memory);
				break;
			case ',':
				scanf("%c\n", memory);
				break;
			case '[':
				nest=1;
				if(*memory==0){
					while(code[index]!=']' || nest!=0){
						index++;
						if(code[index]=='[') nest++;
						if(code[index]==']') nest--;
					}
				}
				break;
			case ']':
				nest=1;
				if(*memory!=0){
					while(code[index]!='[' || nest!=0){
						index--;
						if(code[index]=='[') nest--;
						if(code[index]==']') nest++;
					}
				}
				break;
			default:
				index++;
				continue;
		}

		//visualize
		if(!no_visualize){
			display_array(memory,output);
			display_code(index,output);
		}

		index++;

		if(!no_visualize) usleep(ms);
	}
}

char *read_file(char *path){
	FILE *fp;
	char *buf;

	if ((fp = fopen(path, "r")) == __NULL) {
		fprintf(stderr, "File open error.\n");
		exit(1);
	}

	// get file size
	if(fseek(fp, 0, SEEK_END) == -1){
		error("%s: fseek:%s", path, strerror(errno));
	}

	size = ftell(fp);
	
	if(fseek(fp, 0, SEEK_SET) == -1){
		error("%s: fseek:%s", path, strerror(errno));
	}

	buf = calloc(1, size+2);
	fread(buf, size, 1, fp);

	if(size == 0 || buf[size-1] != '\n'){
		buf[size++] = '\n';
	}

	buf[size] = '\0';
	fclose(fp);

	return buf;
}

int main(int argc,char *argv[]){
	char *filename;
	if(argc==3){
		filename=argv[2];
		if(strcmp(argv[1],"--no-visualize")==0 || strcmp(argv[1],"-n")==0){
			no_visualize=true;
		}else if(strncmp(argv[1],"--speed=",8)==0 || strncmp(argv[1],"-s=",3)==0){
			char *str=argv[1];
			while(*(str++) != '=');
			ms = strtol(str,&str,10);
		}else{
			exit(1);
		}
	}else if(argc==2){
		if(strcmp(argv[1],"--help")==0 || strcmp(argv[1],"-h")==0){
			printf("Brainwash -Brainfuck interpreter and visualizer- \n");
			printf("Usage:./Brainwash -(h|n|s) terget_file \n");
			printf("	--help(-h) :show this help\n");
			printf("	--no-visualize(-n) :only print result\n");
			printf("	--speed=(-s=) :run speed[ms]\n\n");
			printf("Author:Takana Norimasa \n");
			printf("Repository:https://github.com/Takana-Norimasa/Brainwash \n");
			return 0;
		}
		filename=argv[1];
	}else{
		fprintf(stderr, "argument error");
		exit(1);
	}

	code = read_file(filename);
	processor();
}
