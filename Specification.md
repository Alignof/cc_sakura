# Specification 
2020 10.09 Takana Norimasa

## enums
Tokenkind, Nodekind, Typekind.

### Tokenkind
parsed tokens kind.

| name		| description			| example		|
| :--		| :--				| :--			|
| TK\_TYPE	| type of function or variable	| int, char...		|
| TK\_RESERVED	| some symbol			| =, +, ==...		|
| TK\_IDENT	| variable or function name	| width, a\_3, len...	|
| TK\_NUM	| number			| 0, 255, -1...		|
| TK\_IF	| if				| if			|
| TK\_ELSE	| else				| else			|
| TK\_WHILE	| while				| while			| 
| TK\_FOR	| for   			| for			|
| TK\_SIZEOF	| sizeof			| sizeof		| 
| TK\_BLOCK	| code block			| {}			|
| TK\_STR	| string			| "hello"		|
| TK\_RETURN	| return			| return		|
| TK\_EOF	| end of file			|			|

### Nodekind
syntax tree node kind.

| name		| description			| example		|
| :--		| :--				| :--			|
| ND\_ADD	| add symbol      		| +			|
| ND\_SUB	| sub symbol			| -			|
| ND\_MUL	| multiple symbol		| *			|
| ND\_DIV	| divite symbol			| /			|
| ND\_MOD	| modulo symbol			| %			|
| ND\_INC	| increment			| ++			|
| ND\_DEC	| decrement			| --			|
| ND\_ADDRESS	| get address			| &a			|
| ND\_DEREF	| dereference			| \*a			|
| ND\_GT	| greater than			| >			|
| ND\_GE	| greater than equal		| >=			|
| ND\_LT	| less than			| <			|
| ND\_LE	| less than equal		| <=			|
| ND\_EQ	| equal				| ==			|
| ND\_NE	| not equal			| !=			|
| ND\_AND	| and				| &&			|
| ND\_OR	| or				| \|\|			|
| ND\_ASSIGN	| assign			| =			|
| ND\_LVAR	| local variable 		| (local variable)	|
| ND\_GVAR	| global variable		| (global variable)	|
| ND\_LARRAY	| local array 			| (local array)		|
| ND\_GARRAY	| global array			| (global array)	|
| ND\_STR	| string			| "string"		|
| ND\_NUM	| number			| 0, 255, -1...		|
| ND\_IF	| if     			| if			|
| ND\_ELSE	| else   			| else			|
| ND\_IFELSE	| if-else			| if-else		|
| ND\_WHILE	| while  			| while			|
| ND\_FOR	| for    			| for			|
| ND\_BLOCK	| code block			| {}			|
| ND\_ARG	| function argument		| function argument   	|
| ND\_CALL\_FUNC| function call			| func();		|
| ND\_RETURN	| return			| return		|
| ND\_TYPE	| type of variable		| int, double, char...	|


### Typekind
type of variable kind.

| name		| description			| bit(byte)			|
| :--		| :--				| :--				|
| CHAR		| char				| 8  (1byte)			|
| INT		| int				| 32 (4byte)			|
| PTR		| int \*, char \*...		| 64 (8byte)			|
| ARRAY		| int a[], char a[]...		| 8 \* size (n byte)		|


## structs
Token, Node, LVar, GVar, Func, Type, Str...

### Token
struct of parsed token.
| type/name		| description			| example			|
| :--			| :--				| :--				|
| TokenKind kind	| kind of token			| TK\_NUM			|
| Token \*next   	| next chained list		| (next address of Token)	|
| int val       	| value of immediate		| 1970				|
| char \*str     	| name				| "1970 + year..."		|
| int len       	| name of length		| 4 				|


### Node
struct of syntax tree node.
| type/name		| description			| example			|
| :--			| :--				| :--				|
| NodeKind kind		| kind of node			| ND\_ASSIGN			|
| Node \*lhs    	| node of left hand side	| (left hand node address)	|
| Node \*rhs    	| node of right hand side	| (right hand node address)	|
| Node \*next   	| **see table below**		| (next argument chain)		|
| Node \*vector 	| **see table below**		| NULL				|
| Type type		| node type 			| struct Type			|
| int val		| **see table below**		| 0				|
| int offset		| local variable offset		| 0				|
| char \*str    	| name  			| NULL				|


#### node->vector
| Nodekind		| node-\>vector means				|
| :--			| :--						|
| ND\_LVAR		| chain list of initialize formula -> (next) 	|
| ND\_FOR		| exit conditions -> code or block code		|
| ND\_BLOCK		| chain of block code 				|



#### node->next
| Nodekind		| node-\>next means			|
| :--			| :--					|
| ND\_ASSIGN		| chain of initialize formula		|
| ND\_AND		| chain of arguments			|
| ND\_OR		| chain of arguments			|
| ND\_EQ		| chain of arguments			|
| ND\_NE		| chain of arguments			|
| ND\_GE		| chain of arguments			|
| ND\_GT		| chain of arguments			|
| ND\_LE		| chain of arguments			|
| ND\_LT		| chain of arguments			|
| ND\_ADD		| chain of arguments			|
| ND\_SUB		| chain of arguments			|
| ND\_MUL		| chain of arguments			|
| ND\_DIV		| chain of arguments			|
| ND\_MOD		| chain of arguments			|
| ND\_DEREF		| chain of arguments			|
| ND\_ADDRESS		| chain of arguments			|
| ND\_STR		| chain of arguments			|
| ND\_SIZEOF		| chain of arguments			|
| ND\_LVAR		| chain of arguments			|
| ND\_LARRAY		| chain of arguments			|
| ND\_GVAR		| chain of arguments			|
| ND\_GARRAY		| chain of arguments			|
| ND\_NUM		| chain of arguments			|


#### node->val
| Nodekind		| node-\>val means			|
| :--			| :--					|
| ND\_NUM		| immediate, size of type		|
| ND\_STR		| string label				|
| ND\_SIZEOF		| size of type				|
| ND\_GVAR		| length of name			|
| ND\_CALL\_FUNC	| number of argument 			|




















