typedef _Bool bool;
bool true = 1;
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
	for(i = 0;i < size;i++){
		if((*str == multi_eq[i]) && (*(str+1) == '=')){
			*single_flag = false;
			return true;
		}
	}
	
	//Is repeat symbol? (<<,>>,&&,||,++,--)
	size = sizeof(repeat_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
			*single_flag = false;
			return true;
		}
	}

	//Is multi symbol? (->)
	size = sizeof(multi_symbol)/sizeof(char)/2;
	for(i = 0;i < size;i += 2){
		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
			*single_flag = false;
			return true;
		}
	}

	//Is single symbol? (+,-,*,/,%,<,>,',.)
	size = sizeof(single_symbol)/sizeof(char);
	for(i = 0;i < size;i++){
		if(*str == single_symbol[i]){
			*single_flag = true;
			return true;
		}
	}

	return false;
}

int main(){
	int single_flag = 0;
	char *str = "[300]";

	while(*str){
		if(is_symbol(str, &single_flag)){
			if(single_flag){
				str++;
			}else{
				str+=2;
			}
			printf("remain:%s\n", str);
		}else{
			str++;
		}
	}

	return 0;
}

