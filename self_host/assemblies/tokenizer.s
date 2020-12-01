	.file	"tokenizer.c"
	.intel_syntax noprefix
	.text
	.globl	isblock
	.type	isblock, @function
isblock:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 123
	je	.L2
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 125
	jne	.L3
.L2:
	mov	eax, 1
	jmp	.L4
.L3:
	mov	eax, 0
.L4:
	and	eax, 1
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	isblock, .-isblock
	.globl	at_eof
	.type	at_eof, @function
at_eof:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 20
	sete	al
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	at_eof, .-at_eof
	.globl	is_alnum
	.type	is_alnum, @function
is_alnum:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	cmp	BYTE PTR -4[rbp], 96
	jle	.L9
	cmp	BYTE PTR -4[rbp], 122
	jle	.L10
.L9:
	cmp	BYTE PTR -4[rbp], 64
	jle	.L11
	cmp	BYTE PTR -4[rbp], 90
	jle	.L10
.L11:
	cmp	BYTE PTR -4[rbp], 47
	jle	.L12
	cmp	BYTE PTR -4[rbp], 57
	jle	.L10
.L12:
	cmp	BYTE PTR -4[rbp], 95
	jne	.L13
.L10:
	mov	eax, 1
	jmp	.L15
.L13:
	mov	eax, 0
.L15:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	is_alnum, .-is_alnum
	.globl	len_val
	.type	len_val, @function
len_val:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 24
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L17
.L18:
	add	DWORD PTR -4[rbp], 1
	add	QWORD PTR -24[rbp], 1
.L17:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	test	eax, eax
	jne	.L18
	mov	eax, DWORD PTR -4[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	len_val, .-len_val
	.globl	issymbol
	.type	issymbol, @function
issymbol:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi
	mov	QWORD PTR -80[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	movabs	rax, 2965662295770410283
	movabs	rdx, 6570253967572220967
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	mov	DWORD PTR -16[rbp], 557465437
	mov	BYTE PTR -12[rbp], 0
	mov	DWORD PTR -48[rbp], 2082881084
	mov	WORD PTR -44[rbp], 11563
	mov	BYTE PTR -42[rbp], 0
	mov	WORD PTR -51[rbp], 15917
	mov	BYTE PTR -49[rbp], 0
	movabs	rax, 3399419658464279868
	mov	QWORD PTR -41[rbp], rax
	mov	BYTE PTR -33[rbp], 0
	mov	DWORD PTR -56[rbp], 9
	mov	DWORD PTR -60[rbp], 0
	jmp	.L21
.L24:
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	movzx	eax, BYTE PTR -41[rbp+rax]
	cmp	dl, al
	jne	.L22
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 61
	jne	.L22
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	mov	eax, 1
	jmp	.L34
.L22:
	add	DWORD PTR -60[rbp], 1
.L21:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jl	.L24
	mov	DWORD PTR -56[rbp], 7
	mov	DWORD PTR -60[rbp], 0
	jmp	.L25
.L27:
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	movzx	eax, BYTE PTR -48[rbp+rax]
	cmp	dl, al
	jne	.L26
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	movzx	eax, BYTE PTR -48[rbp+rax]
	cmp	dl, al
	jne	.L26
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	mov	eax, 1
	jmp	.L34
.L26:
	add	DWORD PTR -60[rbp], 1
.L25:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jl	.L27
	mov	DWORD PTR -56[rbp], 1
	mov	DWORD PTR -60[rbp], 0
	jmp	.L28
.L30:
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	movzx	eax, BYTE PTR -51[rbp+rax]
	cmp	dl, al
	jne	.L29
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -51[rbp+rax]
	cmp	dl, al
	jne	.L29
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	mov	eax, 1
	jmp	.L34
.L29:
	add	DWORD PTR -60[rbp], 2
.L28:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jl	.L30
	mov	DWORD PTR -56[rbp], 21
	mov	DWORD PTR -60[rbp], 0
	jmp	.L31
.L33:
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	movzx	eax, BYTE PTR -32[rbp+rax]
	cmp	dl, al
	jne	.L32
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 1
	mov	eax, 1
	jmp	.L34
.L32:
	add	DWORD PTR -60[rbp], 1
.L31:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jl	.L33
	mov	eax, 0
.L34:
	mov	rcx, QWORD PTR -8[rbp]
	sub	rcx, QWORD PTR fs:40
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	issymbol, .-issymbol
	.globl	new_token
	.type	new_token, @function
new_token:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], 1
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	new_token, .-new_token
	.globl	consume_reserved
	.type	consume_reserved, @function
consume_reserved:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	DWORD PTR -20[rbp], edx
	mov	QWORD PTR -32[rbp], rcx
	mov	DWORD PTR -24[rbp], r8d
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, QWORD PTR -16[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L39
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	test	eax, eax
	je	.L40
.L39:
	mov	eax, 0
	jmp	.L41
.L40:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	new_token
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rdx], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rdx]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	eax, 1
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	consume_reserved, .-consume_reserved
	.section	.rodata
.LC0:
	.string	"void"
.LC1:
	.string	"_Bool"
.LC2:
	.string	"char"
.LC3:
	.string	"int"
.LC4:
	.string	"struct"
.LC5:
	.string	"enum"
.LC6:
	.string	"if"
.LC7:
	.string	"else"
.LC8:
	.string	"switch"
.LC9:
	.string	"case"
.LC10:
	.string	"default"
.LC11:
	.string	"for"
.LC12:
	.string	"do"
.LC13:
	.string	"while"
.LC14:
	.string	"break"
.LC15:
	.string	"continue"
.LC16:
	.string	"sizeof"
.LC17:
	.string	"typedef"
.LC18:
	.string	"extern"
.LC19:
	.string	"return"
.LC20:
	.string	"__NULL"
.LC21:
	.string	"can not tokenize."
	.text
	.globl	tokenize
	.type	tokenize, @function
tokenize:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -40[rbp], 0
	lea	rax, -48[rbp]
	mov	QWORD PTR -56[rbp], rax
	jmp	.L43
.L93:
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 8192
	test	eax, eax
	je	.L44
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L44:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jne	.L45
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jne	.L45
	jmp	.L46
.L47:
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
.L46:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	jne	.L47
	jmp	.L43
.L45:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jne	.L48
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 42
	jne	.L48
	jmp	.L49
.L50:
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
.L49:
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 42
	jne	.L50
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jne	.L50
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L48:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 39
	jne	.L51
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	jne	.L52
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 48
	jne	.L53
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], 0
	jmp	.L54
.L53:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 110
	jne	.L55
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], 10
	jmp	.L54
.L55:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 116
	jne	.L56
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], 9
	jmp	.L54
.L56:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	jne	.L57
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], 92
	jmp	.L54
.L57:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 39
	jne	.L54
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], 39
	jmp	.L54
.L52:
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	movsx	edx, dl
	mov	DWORD PTR 16[rax], edx
.L54:
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L51:
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 2048
	test	eax, eax
	je	.L58
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	jne	.L59
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 32[rax], 1
	jmp	.L43
.L59:
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	lea	rcx, -72[rbp]
	mov	edx, 10
	mov	rsi, rcx
	mov	rdi, rax
	call	strtol@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], edx
	jmp	.L43
.L58:
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, -57[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	issymbol
	test	al, al
	je	.L61
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	movzx	eax, BYTE PTR -57[rbp]
	test	al, al
	je	.L62
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L62:
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 32[rax], 2
	jmp	.L43
.L61:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L64
	jmp	.L43
.L64:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L65
	jmp	.L43
.L65:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L66
	jmp	.L43
.L66:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 3
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L67
	jmp	.L43
.L67:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L68
	jmp	.L43
.L68:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L69
	jmp	.L43
.L69:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 4
	mov	rcx, rdx
	mov	edx, 2
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L70
	jmp	.L43
.L70:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 5
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L71
	jmp	.L43
.L71:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 6
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L72
	jmp	.L43
.L72:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 7
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L73
	jmp	.L43
.L73:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 8
	mov	rcx, rdx
	mov	edx, 7
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L74
	jmp	.L43
.L74:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 11
	mov	rcx, rdx
	mov	edx, 3
	lea	rsi, .LC11[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L75
	jmp	.L43
.L75:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 9
	mov	rcx, rdx
	mov	edx, 2
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L76
	jmp	.L43
.L76:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 10
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L77
	jmp	.L43
.L77:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 15
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC14[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L78
	jmp	.L43
.L78:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 16
	mov	rcx, rdx
	mov	edx, 8
	lea	rsi, .LC15[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L79
	jmp	.L43
.L79:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 12
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC16[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L80
	jmp	.L43
.L80:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 17
	mov	rcx, rdx
	mov	edx, 7
	lea	rsi, .LC17[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L81
	jmp	.L43
.L81:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 18
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L82
	jmp	.L43
.L82:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 19
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC19[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L83
	jmp	.L43
.L83:
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 21
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC20[rip]
	mov	rdi, rax
	call	consume_reserved
	test	al, al
	je	.L84
	jmp	.L43
.L84:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	isblock
	test	al, al
	je	.L85
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 32[rax], 1
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L85:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 34
	jne	.L86
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L87
.L88:
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 14
	call	new_token
	mov	QWORD PTR -56[rbp], rax
.L87:
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	je	.L88
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 34
	jne	.L88
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L86:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	jne	.L89
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	jne	.L89
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L43
.L89:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	test	eax, eax
	je	.L90
	jmp	.L91
.L92:
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 32[rax], 1
.L91:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	test	eax, eax
	jne	.L92
	jmp	.L43
.L90:
	mov	rax, QWORD PTR -72[rbp]
	lea	rsi, .LC21[rip]
	mov	rdi, rax
	call	error_at@PLT
.L43:
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L93
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 20
	call	new_token
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, QWORD PTR -8[rbp]
	sub	rsi, QWORD PTR fs:40
	je	.L95
	call	__stack_chk_fail@PLT
.L95:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	tokenize, .-tokenize
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
