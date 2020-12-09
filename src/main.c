#include "cc_sakura.h"

int   llid;
int   label_num;
int   label_loop_end;
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
	if(fseek(fp, 0L, SEEK_END) == -1){
		error("%s: fseek:%s", path, strerror(errno));
	}

	size_t size = ftell(fp);
	
	if(fseek(fp, 0L, SEEK_SET) == -1){
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
                printf("%.*s:\n	.zero %d\n", gvar->len, gvar->name, gvar->memsize);
                return;
        }

	Node *init = NULL;
	Type *type = get_pointer_type(gvar->type);
        if(gvar->init){
                printf("%.*s:\n", gvar->len, gvar->name);
                init = gvar->init;
                if(gvar->init->kind == ND_BLOCK){
                        while(init){
                                if(type->ty < INT){
                                        printf("	.byte	%d\n", init->val);
                                }else{
                                        printf("	.long	%d\n", init->val);
                                }
                                init = init->block_code;
                        }
                }else if(gvar->init->kind == ND_STR){
                        if(gvar->type->ty == PTR){
                                printf("	.quad	.LC%d\n", init->val);
                        }else if(gvar->type->ty == ARRAY){
                                printf("	.string \"%.*s\"\n", init->len, init->str);
                                if(init->offset) printf("        .zero   %d\n", init->offset);
                        }
                }else{
                        if(type->ty < INT){
                                printf("	.byte	%d\n", init->val);
                        }else{
                                printf("	.long	%d\n", init->val);
                        }
                }
        }else{
                printf("%.*s:\n	.zero %d\n", gvar->len, gvar->name, gvar->memsize);
        }
}

int main(int argc, char **argv){
	int i, j;

	// get source code
	get_code(argc, argv);

	// tokenize
	token = tokenize(user_input);
	// make syntax tree
	program();

	if(func_list == NULL){
		fprintf(stderr, "function is not found.");
	}


	// generate code
	printf(".intel_syntax noprefix\n");

	// set global variable
	printf(".data\n");
	GVar *start = globals;
	for (GVar *var = start;var;var = var->next){
		set_gvar(var);
	}

	// set string
	for (Str *var = strings;var;var = var->next){
		printf(".LC%d:\n", var->label_num);
		printf("	.string \"%.*s\"\n", var->len, var->str);
	}

	llid           = 0;
	label_num      = 0;
	label_loop_end = 0;
	labels_head    = NULL;
	labels_tail    = NULL;

	//generate assembly at first expr
	printf(".text\n");
	for(i = 0;func_list[i];i++){
		printf(".globl %s\n", func_list[i]->name);
		printf("%s:\n", func_list[i]->name);
		printf("	push rbp\n");
		printf("	mov rbp,rsp\n");
		printf("	sub rsp,%d\n", func_list[i]->stack_size);

		if(func_list[i]->args){
			// set local variable
			gen(func_list[i]->args);
		}

		for(j = 0;func_list[i]->code[j] != NULL;j++){
			// gen code
			gen(func_list[i]->code[j]);
		}

		// epiroge
		// rax = return value
		printf("	mov rsp,rbp\n");
		printf("	pop rbp\n");
		printf("	ret\n\n");
	}

	return 0;
}

