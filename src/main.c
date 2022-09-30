#include "cc_sakura.h"

int   llid;
int   label_num;
int   IGNORE_SCOPE;
int   CONSIDER_SCOPE;
int   label_loop_end;
int   aligned_stack_size;
char  *user_input;
char  filename[100];
Func  *func_list[FUNC_NUM];
Label *labels_head;
Label *labels_tail;

char *read_file(char *path){
	FILE *fp;
	char *buf;

	strcpy(filename, path);
	if ((fp = fopen(path, "r")) == NULL) {
		fprintf(stderr, "File open error.\n");
		exit(1);
	}

	// get file size
	if(fseek(fp, 0, SEEK_END) == -1){
        printf("%s: fseek:%s", path, strerror(errno));
	}

	size_t size = ftell(fp);

	if(fseek(fp, 0, SEEK_SET) == -1){
        printf("%s: fseek:%s", path, strerror(errno));
	}

	buf = calloc(sizeof(char), size+2);
	fread(buf, size, 1, fp);

	if(size == 0 || buf[size-1] != '\n'){
		buf[size++] = '\n';
	}

	buf[size] = '\0';
	fclose(fp);

	return buf;
}

void get_code(int argc, char **argv){
	if(argc == 2){
		user_input = read_file(argv[1]);
	}else if(argc == 3){
		if(!strcmp(argv[1], "-cl")){
			user_input = argv[2];
			strcpy(filename, "command line");
		}else{
			fprintf(stderr, "Incorrect option\n");
			exit(1);
		}
	}else{
		fprintf(stderr, "Incorrect number of arguments\n");
		exit(1);
	}
}

void set_gvar(GVar *gvar){
	if(gvar->type->is_extern == 1){
		return;
	}

	if(gvar->type->is_thread_local == 1){
		printf(".section .tbss,\"awT\",@nobits\n");
		printf("%.*s:\n	.zero	%d\n", gvar->len, gvar->name, gvar->memsize);
		return;
	}

	printf(".globl %.*s\n", gvar->len, gvar->name);
	printf("%.*s:\n", gvar->len, gvar->name);
	if(gvar->init){
		if(gvar->init->kind == ND_BLOCK){
			Node *init = gvar->init->rhs;
			while(init){
				gen_gvar_label(gvar, init);
				init = init->block_code;
			}
			if(gvar->init->offset) printf("        .zero   %d\n", gvar->init->offset);
		}else{
			gen_gvar_label(gvar, gvar->init);
		}
	}else{
		printf("	.zero	%d\n", gvar->memsize);
	}
}

int main(int argc, char **argv){
	IGNORE_SCOPE   = 0;
	CONSIDER_SCOPE = 1;

	// get source code
	get_code(argc, argv);

	// tokenize
	token = tokenize_main(user_input);

	// make syntax tree
	program();

	if(func_list == NULL){
		fprintf(stderr, "function is not found.");
	}

	// generate code
	gen_main();

	return 0;
}

