# Internal specifications of cc\_sakura
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
| TK\_BREAK	| break				| break 		|
| TK\_CONTINUE	| continue			| continue		|
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
| ND\_GT	| greater than			| >			|
| ND\_GE	| greater than equal		| >=			|
| ND\_LT	| less than			| <			|
| ND\_LE	| less than equal		| <=			|
| ND\_EQ	| equal				| ==			|
| ND\_NE	| not equal			| !=			|
| ND\_AND	| and				| &&			|
| ND\_OR	| or				| \|\|			|
| ND\_ASSIGN	| assignment			| =			|
| ND\_COMPOUND	| compound assignment		| +=, -=, \*=, /=	|
| ND\_POSTID	| post increment/decrement	| a++, a--		|
| ND\_DOT	| direct member selection	| struc.member		|
| ND\_ARROW	| direct member selection	| struc.member		|
| ND\_PREID	| pre increment/decrement	| ++a, --a		|
| ND\_ADDRESS	| get address			| &a			|
| ND\_DEREF	| dereference			| \*a			|
| ND\_LVAR	| local variable 		| (local variable)	|
| ND\_GVAR	| global variable		| (global variable)	|
| ND\_LARRAY	| local array 			| (local array)		|
| ND\_GARRAY	| global array			| (global array)	|
| ND\_STR	| string			| "string"		|
| ND\_NUM	| number			| 0, 255, -1...		|
| ND\_TERNARY	| ternary operator		| (cond)? true : false	|
| ND\_IF	| if     			| if			|
| ND\_ELSE	| else   			| else			|
| ND\_IFELSE	| if-else			| if-else		|
| ND\_WHILE	| while  			| while			|
| ND\_FOR	| for    			| for			|
| ND\_BLOCK	| code block			| {}			|
| ND\_ARG	| function argument		| function argument   	|
| ND\_CALL\_FUNC| function call			| func();		|
| ND\_RETURN	| return			| return		|
| ND\_BREAK	| break loop			| break 		|
| ND\_CONTINUE	| jump to the top of loop	| continue		|
| ND\_TYPE	| type of variable		| int, double, char...	|


### Typekind
type of variable kind.

| name		| description			| bit(byte)			|
| :--		| :--				| :--				|
| CHAR		| char				| 8  (1byte)			|
| INT		| int				| 32 (4byte)			|
| PTR		| int \*, char \*...		| 64 (8byte)			|
| ARRAY		| int a[], char a[]...		| 8 \* size (n byte)		|
| STRUC		| struct struc{int a; int b;};	| 8 \* sum size (n byte)	|

### IncDeckind
type of increment/decrement.

| name		| description			| example		|
| :--		| :--				| :--			|
| PRE\_INC	| pre  increment		| ++p 			| 
| PRE\_DEC	| post increment		| p++ 			| 
| POST\_INC	| pre  decrement		| --p 			| 
| POST\_DEC	| post decrement		| p-- 			| 

## structs
Token, Node, LVar, GVar, Func, Struc, Member, Type, Str...

### Token
struct of parsed token.
| type/name		| description				| example			|
| :--			| :--					| :--				|
| TokenKind kind	| kind of token				| TK\_NUM			|
| Token \*next   	| next chained list			| (next address of Token)	|
| int val       	| value of immediate			| 1970				|
| char \*str     	| pointer at the head of the name	| "1970 + year..."		|
| int len       	| name of length			| 4 				|


### Node
struct of syntax tree node.
| type/name		| description			| example			|
| :--			| :--				| :--				|
| NodeKind kind		| kind of node			| ND\_ASSIGN			|
| Node \*lhs    	| node of left hand side	| (left hand node address)	|
| Node \*rhs    	| node of right hand side	| (right hand node address)	|
| Node \*next   	| **see table below**		| (next argument chain)		|
| Node \*vector 	| **see table below**		| NULL				|
| Type type		| node type 			| (struct Type)			|
| int val		| **see table below**		| 0				|
| int offset		| local variable offset		| 0				|
| char \*str    	| name  			| NULL				|


#### node->vector
| Nodekind		| node-\>vector means				|
| :--			| :--						|
| ND\_LVAR		| chain list of initialize formula -> (next) 	|
| ND\_LARRAY		| chain list of initialize formula -> (next) 	|
| ND\_GARRAY		| chain list of initialize formula -> (next) 	|
| ND\_FOR		| exit conditions -> code or block code		|
| ND\_BLOCK		| chain of block code 				|
| ND\_TERNARY		| else expression 				|




#### node->next
| Nodekind		| node-\>next means			|
| :--			| :--					|
| ND\_ASSIGN		| chain of initialize formula		|
| ND\_CALL\_FUNC	| head of argument chained lists	|
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



### Type
struct of type of variable kind.
| type/name		| description			| example			|
| :--			| :--				| :--				|
| TypeKind ty		| type of variable(INT,CHAR...)	| ARRAY				|
| Type \*ptr\_to	| next chained list		| (next Type chain)		|
| Member  \*member;	| chained list of Member	| NULL				|
| size\_t index\_size	| sizo of array index		| 5				|



### Func
struct of function
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int stack\_size	| size to reserve on the stack	| 16				|
| char \*name		| function name			| add				|
| Type type		| type of function		| (struct Type)			|
| Node \*args		| chained list of arguments	| (next argument chain)		|
| Node \*code[100]	| codes				| (codes list)			|
| Func \*next		| chained list of Func		| (next Func chain)		|


### Str
struct of string
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int len		| string length(excluding EoS)	| 6				|
| int label\_num	| string label			| 0				|
| char \*str		| string name			| hello!			|
| Str \*next		| chained list of Str		| (next Str chain)		|



### Gvar
struct of global variable
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int len;		| name length 			| 1				|
| int memsize;		| allocate memory size		| 4				|
| char \*name;		| variable name			| "x=3;\nint main(){\n\tint"	|
| Type type;		| variable type			| (struct Type)			|
| GVar \*next;		| chained list of Gvar		| (next Gvar chain)		|
| Node \*init;		| node of initialize formula	| (node of initialize assign)	|


### Lvar
struct of local variable
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int len;		| name length 			| 1				|
| int offset;		| offset from rsp		| 16				|
| char \*name;		| variable name			| "y){\n\treturn x+y;"		|
| Type type;		| variable type			| (struct Type)			|
| LVar \*next;		| chained list of Lvar		| (next Lvar chain)		|


### Struc
struct of structure
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int   len;		| name length 			|				|
| int   memsize;	| allocate memory size		|				|
| char  \*name;		| struct name			|				|
| Member  \*member;	| chained list of Member	|				|
| Struc \*next;		| chained list of Struc		|				|


### Member
struct of structure member
| type/name		| description			| example			|
| :--			| :--				| :--				|
| int   len;		| name length 			|				|
| int offset;		| offset from head of struct	|                               |
| int   memsize;	| allocate memory size		|				|
| char  \*name;		| member name			|				|
| Type type;		| member variable type		|                               |
| Member  \*next;	| chained list of Member	|				|
