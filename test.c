typedef _Bool bool;
bool true  = 1;
bool false = 0;

// bool is_symbol(char *str,  bool *single_flag){
// 	int i;
// 	int size;
// 	char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
// 	char repeat_symbol[] = "<>&|+-";
// 	char multi_symbol[]  = "->";
// 	char multi_eq[]      = "<=>!+*-/";
// 
// 	printf("%s\n", single_symbol);
// 
// 	//Is multi equal? (<=,==,!=,>=)
// 	size = sizeof(multi_eq)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		if((*str == multi_eq[i]) && (*(str+1) == '=')){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 
// 	//Is repeat symbol? (<<,>>,&&,||,++,--)
// 	size = sizeof(repeat_symbol)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		if(*str == repeat_symbol[i] && *(str+1) == repeat_symbol[i]){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 
// 	//Is multi symbol? (->)
// 	size = sizeof(multi_symbol)/sizeof(char)/2;
// 	for(i = 0;i < size;i += 2){
// 		if(*str == multi_symbol[i] && *(str+1) == multi_symbol[i+1]){
// 			*single_flag = false;
// 			return true;
// 		}
// 	}
// 
// 	//Is single symbol? (+,-,*,/,%,<,>,',.)
// 	size = sizeof(single_symbol)/sizeof(char);
// 	for(i = 0;i < size;i++){
// 		printf("%c\n", single_symbol[i]);
// 		if(*str == single_symbol[i]){
// 			*single_flag = true;
// 			return true;
// 		}
// 	}
// 
// 	return false;
// }
// 
// int main(){
// 	char arr[] = "+1";
// 	bool is_single_token;
// 
// 	printf("size of arr:%d\n", sizeof(arr));
// 	printf("arr:%s\n", arr);
// 	if(is_symbol(arr, &is_single_token)){
// 		printf("found. single flag is %d\n", (int)is_single_token);
// 	}else{
// 		printf("not found.\n");
// 	}
// 
// 	return 0;
// }


int main(){
	char arr[] = "+123456";
 	char single_symbol[] = "+-*/%&()'<>=,;.[]?:!";
 	char repeat_symbol[] = "<>&|+-";
	bool is_single_token;

	printf("arr:%s\n", arr);
	printf("size of arr:%d\n", sizeof(arr));

	return 0;
}
