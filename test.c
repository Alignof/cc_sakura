typedef _Bool bool;
bool true  = 1;
bool false = 0;

bool is_symbol(char *str,  bool *single_flag){
	int i;
	int size;
	char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
	char repeat_symbol[] = "<>&|+-";
	char multi_symbol[]  = "->";
	char multi_eq[]      = "<=>!+*-/";

	//Is multi equal? (<=,==,!=,>=)
	size = sizeof(multi_eq)/sizeof(char);
	printf("multi eq size:%d\n", size);
	for(i = 0;i < size;i++){
		if((*str == multi_eq[i]) && (*(str+1) == '=')){
			*single_flag = false;
			return true;
		}
	}

	//Is repeat symbol? (<<,>>,&&,||,++,--)
	size = sizeof(repeat_symbol)/sizeof(char);
	printf("reqeat size:%d\n", size);
	for(i = 0;i < size;i++){
		if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
			*single_flag = false;
			return true;
		}
	}

	//Is multi symbol? (->)
	size = sizeof(multi_symbol)/sizeof(char)/2;
	printf("multi size:%d\n", size);
	for(i = 0;i < size;i += 2){
		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
			*single_flag = false;
			return true;
		}
	}

	//Is single symbol? (+,-,*,/,%,<,>,',.)
	size = sizeof(single_symbol)/sizeof(char);
	printf("single size:%d\n", size);
	printf("single symbol:%s\n", single_symbol);
	for(i = 0;i < size;i++){
		printf("%c <-> %c\n", *str, single_symbol[i]);
		if(*str == single_symbol[i]){
			*single_flag = true;
			return true;
		}
	}

	return false;
}

int main(){
	char *str = "]; int";
	bool flag;

	if(is_symbol(str, &flag)){
		printf("is symbol/ single flag:%d\n", (int)flag);
	}else{
		printf("isn't symbol\n");
	}

	return 0;
}
