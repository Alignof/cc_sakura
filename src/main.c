#include "cc_sakura.h"

int label_begin;
int label_end;
int label_else;
char *user_input;
char filename[100];
Func *func_list[100];

char *read_file(char *path){
	FILE *fp;
	char *buf;

	strcpy(filename,path);
	if ((fp=fopen(path,"r")) == NULL) {
		fprintf(stderr,"File open error.\n");
		exit(1);
	}

	// get file size
	if(fseek(fp, 0L, SEEK_END)==-1)
		error("%s: fseek:%s",path,strerror(errno));
	size_t size=ftell(fp);
	
	if(fseek(fp, 0L, SEEK_SET)==-1)
		error("%s: fseek:%s",path,strerror(errno));

	buf=calloc(1,size+2);
	fread(buf,size,1,fp);

	if(size==0 || buf[size-1]!='\n')
		buf[size++]='\n';

	buf[size]='\0';
	fclose(fp);

	return buf;
}

void get_code(int argc,char **argv){
	if(argc==2){
		user_input=read_file(argv[1]);
	}else if(argc==3){
		if(!strcmp(argv[1],"-cl")){
			user_input=argv[2];
			strcpy(filename,"command line");
		}else{
			fprintf(stderr,"Incorrect option\n");
			exit(1);
		}
	}else{
		fprintf(stderr,"Incorrect number of arguments\n");
		exit(1);
	}
}

int main(int argc,char **argv){
	int i,j;
	int t_size;

	char reg[6][4]={"rdi","rsi","rdx","rcx","r8","r9"};

	// get source code
	get_code(argc,argv);

	// tokenize
	token=tokenize(user_input);
	// make syntax tree
	program();

	if(func_list==NULL)
		fprintf(stderr,"function is not found.");


	// generate code
	printf(".intel_syntax noprefix\n");
	printf(".globl main\n");

	// set global variable
	GVar *start=globals;
	for (GVar *var=start;var;var=var->next){
		t_size=type_size(var->type.ty);
		printf(".comm	_%.*s,%ld,%d\n",var->len,var->name,var->type.index_size,t_size);
	}

	// set string
	for (Str *var=strings;var;var=var->next){
		printf(".LC%d:\n",var->label_num);
		printf("	.string \"%.*s\"\n",var->len,var->str);
	}

	label_begin=0;
	label_end=0;
	label_else=0;
	//generate assembly at first expr
	for(i=0;func_list[i];i++){
		printf("%s:\n",func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n",func_list[i]->stack_size);

		if(func_list[i]->args){
			// push argument stack
			for(j=func_list[i]->args->val;j>=0;j--) printf("	push %s\n",reg[j]);

			// set local variable
			gen(func_list[i]->args);
		}

		for(j=0;func_list[i]->code[j]!=NULL;j++){
			gen(func_list[i]->code[j]);
			printf("\n	pop rax\n");
		}

		// epiroge
		// rax=return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}

