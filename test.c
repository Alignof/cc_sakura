typedef struct Token Token;
typedef _Bool bool;
typedef enum{
	TK_TYPE,
	TK_RESERVED,
	TK_IDENT,
	TK_NUM,
	TK_IF,
	TK_ELSE,
	TK_SWITCH,
	TK_CASE,
	TK_DEFAULT,
	TK_DO,
	TK_WHILE,
	TK_FOR,
	TK_SIZEOF,
	TK_BLOCK,
	TK_STR,
	TK_BREAK,
	TK_CONTINUE,
	TK_TYPEDEF,
	TK_EXTERN,
	TK_RETURN,
	TK_THREAD_LOCAL,
	TK_COMPILER_DIRECTIVE,
	TK_EOF,
}TokenKind;

Token *token;
bool true  = 1;
bool false = 0;
char *__NULL = 0;

// code token
struct Token{
	TokenKind kind;
	Token *next;
	int val;
	char *str;
	int len;
};

bool consume_reserved_word(char *keyword, TokenKind kind){
	if(token->kind != kind ||
	   token->len != strlen(keyword) ||
	   memcmp(token->str, keyword, token->len)){
		return false;
	}

	token = token->next;
	return true;
}

int main(){
	Token tok;
	token = &tok;
	token->kind = TK_RETURN;
	token->str  = "return";
	token->len  = 6;
	token->next = __NULL;
	//token->next = __NULL;

	return consume_reserved_word("retern", TK_RETURN);
}
