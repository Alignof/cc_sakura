	.file	"syntax_tree.c"
	.intel_syntax noprefix
	.text
	.globl	alloc_size
	.bss
	.align 4
	.type	alloc_size, @object
	.size	alloc_size, 4
alloc_size:
	.zero	4
	.globl	token
	.align 8
	.type	token, @object
	.size	token, 8
token:
	.zero	8
	.globl	strings
	.align 8
	.type	strings, @object
	.size	strings, 8
strings:
	.zero	8
	.section	.rodata
.LC0:
	.string	"("
.LC1:
	.string	")"
	.align 8
.LC2:
	.string	"this variable is not declaration"
	.text
	.globl	data
	.type	data, @function
data:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L2
	call	expr
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L3
.L2:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 21
	jne	.L4
	mov	eax, 0
	call	compiler_directive@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	jmp	.L3
.L4:
	mov	DWORD PTR -68[rbp], 0
	call	consume_ident@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	je	.L5
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	edx, DWORD PTR -68[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_lvar@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0
	je	.L6
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	jne	.L7
	mov	edx, 24
	jmp	.L8
.L7:
	mov	edx, 22
.L8:
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L9
.L6:
	lea	rdi, .LC0[rip]
	call	check@PLT
	test	al, al
	je	.L10
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	find_func@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L11
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L12
.L11:
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 3
.L12:
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	call_function@PLT
	mov	QWORD PTR -64[rbp], rax
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	find_gvar@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -40[rbp], 0
	je	.L13
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	jne	.L14
	mov	edx, 25
	jmp	.L15
.L14:
	mov	edx, 23
.L15:
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 56[rax], rdx
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 48[rax], edx
	jmp	.L9
.L13:
	mov	edx, DWORD PTR -68[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enumerator@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L16
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	QWORD PTR -64[rbp], rax
	jmp	.L9
.L16:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	error_at@PLT
.L9:
	mov	rax, QWORD PTR -64[rbp]
	jmp	.L3
.L5:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L17
	call	expect_number@PLT
	mov	edi, eax
	call	new_node_num@PLT
	jmp	.L3
.L17:
	mov	edx, 0
	mov	esi, 0
	mov	edi, 44
	call	new_node@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	data, .-data
	.section	.rodata
.LC3:
	.string	"]"
.LC4:
	.string	"["
.LC5:
	.string	"++"
.LC6:
	.string	"--"
.LC7:
	.string	"."
.LC8:
	.string	"->"
	.text
	.globl	primary
	.type	primary, @function
primary:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	data
	mov	QWORD PTR -8[rbp], rax
	jmp	.L19
.L20:
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index@PLT
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC3[rip]
	call	expect@PLT
.L19:
	lea	rdi, .LC4[rip]
	call	consume@PLT
	test	al, al
	jne	.L20
	lea	rdi, .LC5[rip]
	call	consume@PLT
	test	al, al
	je	.L21
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 2
	mov	rdi, rax
	call	incdec@PLT
	mov	QWORD PTR -8[rbp], rax
.L21:
	lea	rdi, .LC6[rip]
	call	consume@PLT
	test	al, al
	je	.L23
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 3
	mov	rdi, rax
	call	incdec@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L23
.L29:
	lea	rdi, .LC7[rip]
	call	consume@PLT
	test	al, al
	je	.L24
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 22
	jne	.L25
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 20
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
.L25:
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 16
	call	dot_arrow@PLT
	mov	QWORD PTR -8[rbp], rax
.L24:
	lea	rdi, .LC8[rip]
	call	consume@PLT
	test	al, al
	je	.L27
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 17
	call	dot_arrow@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L27
.L28:
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index@PLT
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC3[rip]
	call	expect@PLT
.L27:
	lea	rdi, .LC4[rip]
	call	consume@PLT
	test	al, al
	jne	.L28
.L23:
	lea	rdi, .LC7[rip]
	call	check@PLT
	test	al, al
	jne	.L29
	lea	rdi, .LC8[rip]
	call	check@PLT
	test	al, al
	jne	.L29
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	primary, .-primary
	.section	.rodata
.LC9:
	.string	"!"
.LC10:
	.string	"*"
.LC11:
	.string	"&"
.LC12:
	.string	"\""
.LC13:
	.string	"+"
.LC14:
	.string	"-"
.LC15:
	.string	"sizeof"
	.text
	.globl	unary
	.type	unary, @function
unary:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	mov	QWORD PTR -72[rbp], 0
	lea	rdi, .LC9[rip]
	call	consume@PLT
	test	al, al
	je	.L32
	call	logical
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 19
	call	new_node@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	jmp	.L33
.L32:
	lea	rdi, .LC10[rip]
	call	consume@PLT
	test	al, al
	je	.L34
	call	unary
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 21
	call	new_node@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	jmp	.L33
.L34:
	lea	rdi, .LC11[rip]
	call	consume@PLT
	test	al, al
	je	.L35
	call	unary
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 20
	call	new_node@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	jmp	.L33
.L35:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 14
	jne	.L36
	lea	rdi, .LC12[rip]
	call	consume@PLT
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], 26
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 4
	call	consume_string@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	find_string@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L37
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 56[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR 64[rax], edx
	jmp	.L38
.L37:
	mov	esi, 24
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR strings[rip]
	test	rax, rax
	je	.L39
	mov	rax, QWORD PTR strings[rip]
	mov	eax, DWORD PTR 4[rax]
	lea	edx, 1[rax]
	jmp	.L40
.L39:
	mov	edx, 0
.L40:
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 56[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR strings[rip]
	test	rax, rax
	jne	.L41
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR strings[rip], rax
	jmp	.L38
.L41:
	mov	rdx, QWORD PTR strings[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR strings[rip], rax
.L38:
	mov	rax, QWORD PTR -48[rbp]
	jmp	.L33
.L36:
	lea	rdi, .LC13[rip]
	call	consume@PLT
	test	al, al
	je	.L42
	call	primary
	jmp	.L33
.L42:
	lea	rdi, .LC14[rip]
	call	consume@PLT
	test	al, al
	je	.L43
	call	primary
	mov	rbx, rax
	mov	edi, 0
	call	new_node_num@PLT
	mov	rdx, rbx
	mov	rsi, rax
	mov	edi, 1
	call	new_node@PLT
	jmp	.L33
.L43:
	lea	rdi, .LC5[rip]
	call	consume@PLT
	test	al, al
	je	.L44
	call	primary
	mov	esi, 0
	mov	rdi, rax
	call	incdec@PLT
	jmp	.L33
.L44:
	lea	rdi, .LC6[rip]
	call	consume@PLT
	test	al, al
	je	.L45
	call	primary
	mov	esi, 1
	mov	rdi, rax
	call	incdec@PLT
	jmp	.L33
.L45:
	mov	esi, 12
	lea	rdi, .LC15[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L46
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L47
	mov	DWORD PTR -76[rbp], 0
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L48
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -76[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	test	rax, rax
	je	.L49
.L48:
	call	parse_type@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	mov	edi, 27
	call	new_node@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	DWORD PTR 48[rax], edx
	jmp	.L50
.L49:
	call	expr
	mov	QWORD PTR -64[rbp], rax
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	mov	edi, 27
	call	new_node@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	DWORD PTR 48[rax], edx
.L50:
	lea	rdi, .LC1[rip]
	call	expect@PLT
.L47:
	mov	rax, QWORD PTR -72[rbp]
	jmp	.L33
.L46:
	call	primary
.L33:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	unary, .-unary
	.section	.rodata
.LC16:
	.string	"/"
.LC17:
	.string	"%"
	.text
	.globl	mul
	.type	mul, @function
mul:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	unary
	mov	QWORD PTR -8[rbp], rax
.L57:
	lea	rdi, .LC10[rip]
	call	consume@PLT
	test	al, al
	je	.L52
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L52:
	lea	rdi, .LC16[rip]
	call	consume@PLT
	test	al, al
	je	.L54
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L54:
	lea	rdi, .LC17[rip]
	call	consume@PLT
	test	al, al
	je	.L55
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 4
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L55:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	mul, .-mul
	.globl	add
	.type	add, @function
add:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	mul
	mov	QWORD PTR -8[rbp], rax
.L64:
	lea	rdi, .LC13[rip]
	call	consume@PLT
	test	al, al
	je	.L60
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L64
.L60:
	lea	rdi, .LC14[rip]
	call	consume@PLT
	test	al, al
	je	.L62
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L64
.L62:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	add, .-add
	.section	.rodata
.LC18:
	.string	">="
.LC19:
	.string	"<="
.LC20:
	.string	">"
.LC21:
	.string	"<"
	.text
	.globl	relational
	.type	relational, @function
relational:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	add
	mov	QWORD PTR -8[rbp], rax
.L73:
	lea	rdi, .LC18[rip]
	call	consume@PLT
	test	al, al
	je	.L67
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 6
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L67:
	lea	rdi, .LC19[rip]
	call	consume@PLT
	test	al, al
	je	.L69
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 8
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L69:
	lea	rdi, .LC20[rip]
	call	consume@PLT
	test	al, al
	je	.L70
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 5
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L70:
	lea	rdi, .LC21[rip]
	call	consume@PLT
	test	al, al
	je	.L71
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 7
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L71:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	relational, .-relational
	.section	.rodata
.LC22:
	.string	"=="
.LC23:
	.string	"!="
	.text
	.globl	equelity
	.type	equelity, @function
equelity:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	relational
	mov	QWORD PTR -8[rbp], rax
.L80:
	lea	rdi, .LC22[rip]
	call	consume@PLT
	test	al, al
	je	.L76
	call	relational
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L80
.L76:
	lea	rdi, .LC23[rip]
	call	consume@PLT
	test	al, al
	je	.L78
	call	relational
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L80
.L78:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	equelity, .-equelity
	.section	.rodata
.LC24:
	.string	"&&"
.LC25:
	.string	"||"
	.text
	.globl	logical
	.type	logical, @function
logical:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	equelity
	mov	QWORD PTR -8[rbp], rax
.L87:
	lea	rdi, .LC24[rip]
	call	consume@PLT
	test	al, al
	je	.L83
	call	equelity
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 11
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L87
.L83:
	lea	rdi, .LC25[rip]
	call	consume@PLT
	test	al, al
	je	.L85
	call	equelity
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 12
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L87
.L85:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	logical, .-logical
	.section	.rodata
.LC26:
	.string	"?"
.LC27:
	.string	":"
	.text
	.globl	ternary
	.type	ternary, @function
ternary:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	logical
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC26[rip]
	call	consume@PLT
	test	al, al
	je	.L90
	call	ternary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 28
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC27[rip]
	call	expect@PLT
	call	ternary
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rdx], rax
.L90:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	ternary, .-ternary
	.section	.rodata
.LC28:
	.string	"="
.LC29:
	.string	"+="
.LC30:
	.string	"-="
.LC31:
	.string	"*="
.LC32:
	.string	"/="
	.text
	.globl	assign
	.type	assign, @function
assign:
.LFB15:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	ternary
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC28[rip]
	call	consume@PLT
	test	al, al
	je	.L93
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L93:
	lea	rdi, .LC29[rip]
	call	consume@PLT
	test	al, al
	je	.L95
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L95:
	lea	rdi, .LC30[rip]
	call	consume@PLT
	test	al, al
	je	.L96
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L96:
	lea	rdi, .LC31[rip]
	call	consume@PLT
	test	al, al
	je	.L97
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L97:
	lea	rdi, .LC32[rip]
	call	consume@PLT
	test	al, al
	je	.L94
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
.L94:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	assign, .-assign
	.section	.rodata
.LC33:
	.string	";"
.LC34:
	.string	"not a variable."
.LC35:
	.string	"{"
.LC36:
	.string	"break"
.LC37:
	.string	"continue"
	.text
	.globl	expr
	.type	expr, @function
expr:
.LFB16:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -28[rbp], 0
	mov	DWORD PTR -24[rbp], 1
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L100
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	test	rax, rax
	je	.L101
.L100:
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 22
	call	parse_type@PLT
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 40[rdx], rax
	lea	rdi, .LC33[rip]
	call	check@PLT
	test	al, al
	je	.L102
	mov	rax, QWORD PTR -16[rbp]
	jmp	.L103
.L102:
	call	consume_ident@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	je	.L104
	mov	DWORD PTR -20[rbp], 1
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enumerator@PLT
	mov	edx, DWORD PTR -28[rbp]
	mov	rcx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	declare_local_variable@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L105
.L104:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC34[rip]
	mov	rdi, rax
	call	error_at@PLT
.L105:
	lea	rdi, .LC28[rip]
	call	consume@PLT
	test	al, al
	je	.L111
	lea	rdi, .LC35[rip]
	call	consume@PLT
	test	al, al
	je	.L107
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	array_block@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L111
.L107:
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L111
.L101:
	mov	esi, 15
	lea	rdi, .LC36[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L109
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 41
	jmp	.L108
.L109:
	mov	esi, 16
	lea	rdi, .LC37[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L110
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 42
	jmp	.L108
.L110:
	call	assign
	mov	QWORD PTR -16[rbp], rax
	jmp	.L108
.L111:
	nop
.L108:
	mov	rax, QWORD PTR -16[rbp]
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	expr, .-expr
	.section	.rodata
.LC38:
	.string	"return"
.LC39:
	.string	"not a ';' token."
.LC40:
	.string	"if"
.LC41:
	.string	"else"
.LC42:
	.string	"switch"
	.align 8
.LC43:
	.string	"expected \342\200\230(\342\200\231 before \342\200\230{\342\200\231 token"
	.align 8
.LC44:
	.string	"multiple default labels in one switch"
.LC45:
	.string	"case"
.LC46:
	.string	"default"
.LC47:
	.string	"for"
.LC48:
	.string	"do"
.LC49:
	.string	"while"
.LC50:
	.string	"}"
	.text
	.globl	stmt
	.type	stmt, @function
stmt:
.LFB17:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	QWORD PTR -104[rbp], 0
	mov	esi, 19
	lea	rdi, .LC38[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L113
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 40
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC33[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	je	.L114
	call	expr
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	lea	rdi, .LC33[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	je	.L114
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC39[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L114
.L113:
	mov	esi, 4
	lea	rdi, .LC40[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L115
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 29
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L116
	call	expr
	mov	QWORD PTR -16[rbp], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
.L116:
	mov	esi, 5
	lea	rdi, .LC41[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L114
	call	stmt
	mov	rdx, rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rsi, rax
	mov	edi, 30
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -104[rbp]
	mov	DWORD PTR [rax], 31
	jmp	.L114
.L115:
	mov	esi, 6
	lea	rdi, .LC42[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L117
	mov	QWORD PTR -96[rbp], 0
	mov	rax, QWORD PTR labels_tail[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -88[rbp], 0
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 32
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L118
	call	expr
	mov	QWORD PTR -96[rbp], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
	jmp	.L119
.L118:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC43[rip]
	mov	rdi, rax
	call	error_at@PLT
.L119:
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	QWORD PTR -80[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -88[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L120
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 16[rax]
	jmp	.L121
.L120:
	mov	rax, QWORD PTR labels_head[rip]
.L121:
	mov	QWORD PTR -72[rbp], rax
	jmp	.L122
.L128:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 24[rax]
	cmp	eax, 1
	jne	.L123
	cmp	QWORD PTR -80[rbp], 0
	je	.L124
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	mov	rdx, QWORD PTR -80[rbp]
	mov	QWORD PTR 24[rdx], rax
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdx, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR [rdx]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -80[rbp], rax
	jmp	.L125
.L124:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -80[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -80[rbp]
	mov	QWORD PTR 24[rax], rdx
	jmp	.L125
.L123:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 24[rax]
	cmp	eax, 2
	jne	.L125
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L126
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC44[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L125
.L126:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 33
	call	new_node@PLT
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 8[rdx], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR [rdx]
	mov	DWORD PTR 48[rax], edx
.L125:
	cmp	QWORD PTR -88[rbp], 0
	je	.L127
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	mov	QWORD PTR -88[rbp], rax
	jmp	.L122
.L127:
	mov	rax, QWORD PTR -72[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -72[rbp], rax
	mov	QWORD PTR -88[rbp], 0
.L122:
	cmp	QWORD PTR -72[rbp], 0
	jne	.L128
	jmp	.L114
.L117:
	mov	esi, 7
	lea	rdi, .LC45[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L129
	call	logical
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 33
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC27[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -104[rbp]
	mov	esi, 1
	mov	rdi, rax
	call	label_register@PLT
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L114
.L129:
	mov	esi, 8
	lea	rdi, .LC46[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L130
	mov	edx, 0
	mov	esi, 0
	mov	edi, 33
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC27[rip]
	call	expect@PLT
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	esi, 2
	mov	rdi, rax
	call	label_register@PLT
	jmp	.L114
.L130:
	mov	esi, 11
	lea	rdi, .LC47[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L131
	mov	rax, QWORD PTR locals[rip]
	mov	QWORD PTR outside_lvar[rip], rax
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR outside_enum[rip], rax
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR outside_struct[rip], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 36
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L132
	call	expr
	mov	QWORD PTR -48[rbp], rax
	lea	rdi, .LC33[rip]
	call	expect@PLT
	call	expr
	mov	QWORD PTR -40[rbp], rax
	lea	rdi, .LC33[rip]
	call	expect@PLT
	call	expr
	mov	QWORD PTR -32[rbp], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rax], rdx
.L132:
	mov	rax, QWORD PTR outside_lvar[rip]
	mov	QWORD PTR locals[rip], rax
	mov	rax, QWORD PTR outside_enum[rip]
	mov	QWORD PTR enumerations[rip], rax
	mov	rax, QWORD PTR outside_struct[rip]
	mov	QWORD PTR structs[rip], rax
	jmp	.L114
.L131:
	mov	esi, 9
	lea	rdi, .LC48[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L133
	call	stmt
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 35
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	esi, 10
	lea	rdi, .LC49[rip]
	call	consume_reserved_word@PLT
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L134
	call	expr
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 8[rdx], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
.L134:
	lea	rdi, .LC33[rip]
	call	expect@PLT
	jmp	.L114
.L133:
	mov	esi, 10
	lea	rdi, .LC49[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L135
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 34
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L114
	call	expr
	mov	QWORD PTR -56[rbp], rax
	lea	rdi, .LC1[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	QWORD PTR 8[rax], rdx
	call	stmt
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L114
.L135:
	lea	rdi, .LC35[rip]
	call	consume@PLT
	test	al, al
	je	.L136
	mov	rax, QWORD PTR -104[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 37
	call	new_node@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR locals[rip]
	mov	QWORD PTR outside_lvar[rip], rax
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR outside_enum[rip], rax
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR outside_struct[rip], rax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -64[rbp], rax
	jmp	.L137
.L139:
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L138
	call	stmt
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 32[rdx], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -64[rbp], rax
	jmp	.L137
.L138:
	call	stmt
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 32[rax], rdx
.L137:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 13
	jne	.L139
	mov	rax, QWORD PTR outside_lvar[rip]
	mov	QWORD PTR locals[rip], rax
	mov	rax, QWORD PTR outside_enum[rip]
	mov	QWORD PTR enumerations[rip], rax
	mov	rax, QWORD PTR outside_struct[rip]
	mov	QWORD PTR structs[rip], rax
	lea	rdi, .LC50[rip]
	call	expect@PLT
	jmp	.L114
.L136:
	call	expr
	mov	QWORD PTR -104[rbp], rax
	lea	rdi, .LC33[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	je	.L114
	jmp	.L140
.L141:
	mov	rax, QWORD PTR token[rip]
	mov	rdx, QWORD PTR 24[rax]
	sub	rdx, 1
	mov	QWORD PTR 24[rax], rdx
.L140:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	jne	.L141
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC39[rip]
	mov	rdi, rax
	call	error_at@PLT
.L114:
	mov	rax, QWORD PTR -104[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	stmt, .-stmt
	.globl	function
	.type	function, @function
function:
.LFB18:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -28[rbp], 0
	mov	rax, QWORD PTR defined_types[rip]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L144
.L145:
	mov	ebx, DWORD PTR -28[rbp]
	lea	eax, 1[rbx]
	mov	DWORD PTR -28[rbp], eax
	call	stmt
	mov	rdx, QWORD PTR -40[rbp]
	movsx	rcx, ebx
	add	rcx, 4
	mov	QWORD PTR [rdx+rcx*8], rax
.L144:
	lea	rdi, .LC50[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	jne	.L145
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR defined_types[rip], rax
	mov	edx, DWORD PTR alloc_size[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -28[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	QWORD PTR [rax+rdx*8], 0
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	function, .-function
	.section	.rodata
.LC51:
	.string	"typedef"
.LC52:
	.string	"extern"
.LC53:
	.string	"not a function."
	.text
	.globl	program
	.type	program, @function
program:
.LFB19:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	mov	DWORD PTR -76[rbp], 0
	mov	DWORD PTR -72[rbp], 0
	jmp	.L147
.L160:
	mov	QWORD PTR locals[rip], 0
	mov	DWORD PTR alloc_size[rip], 0
	mov	DWORD PTR -68[rbp], 0
	mov	esi, 17
	lea	rdi, .LC51[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L148
	call	parse_type@PLT
	mov	QWORD PTR -40[rbp], rax
	call	consume_ident@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 6
	jne	.L149
	mov	rax, QWORD PTR structs[rip]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR structs[rip]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L150
.L149:
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	jne	.L150
	mov	rax, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L151
	mov	rax, QWORD PTR enumerations[rip]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR enumerations[rip]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L150
.L151:
	mov	rax, QWORD PTR enumerations[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rdx]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR enumerations[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rdx]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 24[rax], edx
.L150:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 32[rax], rdx
	mov	rdx, QWORD PTR defined_types[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR defined_types[rip], rax
	lea	rdi, .LC33[rip]
	call	expect@PLT
	jmp	.L147
.L148:
	mov	esi, 18
	lea	rdi, .LC52[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L152
	mov	DWORD PTR -76[rbp], 1
.L152:
	call	parse_type@PLT
	mov	QWORD PTR -64[rbp], rax
	lea	rdi, .LC33[rip]
	call	consume@PLT
	test	al, al
	je	.L153
	jmp	.L147
.L153:
	mov	edi, 2440
	call	malloc@PLT
	mov	rcx, rax
	mov	eax, DWORD PTR -72[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	QWORD PTR [rdx+rax], rcx
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	jne	.L154
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum@PLT
	test	eax, eax
	jne	.L155
.L154:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC53[rip]
	mov	rdi, rax
	call	error_at@PLT
.L155:
	call	consume_ident@PLT
	mov	QWORD PTR -56[rbp], rax
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L156
	mov	eax, DWORD PTR -72[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR 32[rax]
	cdqe
	mov	edx, DWORD PTR -72[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	lea	rdx, func_list[rip]
	mov	rbx, QWORD PTR [rcx+rdx]
	mov	esi, 1
	mov	rdi, rax
	call	calloc@PLT
	mov	QWORD PTR 8[rbx], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, QWORD PTR 24[rax]
	mov	eax, DWORD PTR -72[rbp]
	cdqe
	lea	rsi, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rsi+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncpy@PLT
	mov	eax, DWORD PTR -72[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -72[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	lea	rdx, func_list[rip]
	mov	rbx, QWORD PTR [rcx+rdx]
	mov	edx, DWORD PTR -68[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type@PLT
	mov	QWORD PTR 16[rbx], rax
	mov	eax, DWORD PTR -72[rbp]
	mov	edi, eax
	call	get_argument@PLT
	lea	rdi, .LC35[rip]
	call	consume@PLT
	mov	eax, DWORD PTR -72[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -72[rbp], edx
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdi, rax
	call	function
	lea	rdi, .LC50[rip]
	call	consume@PLT
	jmp	.L147
.L156:
	mov	rcx, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	esi, DWORD PTR -68[rbp]
	mov	eax, DWORD PTR -76[rbp]
	mov	edi, eax
	call	declare_global_variable@PLT
	mov	QWORD PTR -48[rbp], rax
	lea	rdi, .LC28[rip]
	call	consume@PLT
	test	al, al
	je	.L157
	lea	rdi, .LC35[rip]
	call	consume@PLT
	test	al, al
	je	.L158
	mov	rbx, QWORD PTR globals[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	array_block@PLT
	mov	QWORD PTR 40[rbx], rax
	jmp	.L159
.L158:
	call	assign
	mov	rdx, rax
	mov	rbx, QWORD PTR globals[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	mov	QWORD PTR 40[rbx], rax
	jmp	.L159
.L157:
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 23
	jne	.L159
	mov	edi, 0
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rbx, QWORD PTR globals[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	mov	QWORD PTR 40[rbx], rax
.L159:
	lea	rdi, .LC33[rip]
	call	expect@PLT
.L147:
	call	at_eof@PLT
	xor	eax, 1
	test	al, al
	jne	.L160
	mov	eax, DWORD PTR -72[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	QWORD PTR [rdx+rax], 0
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	program, .-program
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
