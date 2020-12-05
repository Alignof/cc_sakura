	.file	"tokenizer.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.globl	len_val
	.type	len_val, @function
len_val:
.LFB0:
	.file 1 "../src/tokenizer.c"
	.loc 1 3 23
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	.loc 1 4 6
	mov	DWORD PTR -4[rbp], 0
	.loc 1 5 2
	jmp	.L2
.L3:
	.loc 1 6 10 discriminator 2
	add	DWORD PTR -4[rbp], 1
	.loc 1 5 25 discriminator 2
	add	QWORD PTR -24[rbp], 1
.L2:
	.loc 1 5 16 discriminator 1
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 5 7 discriminator 1
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	.loc 1 5 2 discriminator 1
	test	al, al
	jne	.L3
	.loc 1 9 9
	mov	eax, DWORD PTR -4[rbp]
	.loc 1 10 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	len_val, .-len_val
	.globl	is_block
	.type	is_block, @function
is_block:
.LFB1:
	.loc 1 12 22
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	.loc 1 13 20
	cmp	BYTE PTR -4[rbp], 123
	je	.L6
	.loc 1 13 20 is_stmt 0 discriminator 2
	cmp	BYTE PTR -4[rbp], 125
	jne	.L7
.L6:
	.loc 1 13 20 discriminator 3
	mov	eax, 1
	jmp	.L8
.L7:
	.loc 1 13 20 discriminator 4
	mov	eax, 0
.L8:
	.loc 1 13 20 discriminator 6
	and	eax, 1
	.loc 1 14 1 is_stmt 1 discriminator 6
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	is_block, .-is_block
	.globl	is_space
	.type	is_space, @function
is_space:
.LFB2:
	.loc 1 16 22
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	.loc 1 17 35
	cmp	BYTE PTR -4[rbp], 32
	je	.L11
	.loc 1 17 20 discriminator 2
	cmp	BYTE PTR -4[rbp], 9
	je	.L11
	.loc 1 17 35 discriminator 4
	cmp	BYTE PTR -4[rbp], 10
	jne	.L12
.L11:
	.loc 1 17 35 is_stmt 0 discriminator 5
	mov	eax, 1
	jmp	.L13
.L12:
	.loc 1 17 35 discriminator 6
	mov	eax, 0
.L13:
	.loc 1 17 35 discriminator 8
	and	eax, 1
	.loc 1 18 1 is_stmt 1 discriminator 8
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	is_space, .-is_space
	.globl	is_digit
	.type	is_digit, @function
is_digit:
.LFB3:
	.loc 1 20 22
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	.loc 1 21 22
	cmp	BYTE PTR -4[rbp], 47
	jle	.L16
	.loc 1 21 22 is_stmt 0 discriminator 1
	cmp	BYTE PTR -4[rbp], 57
	jg	.L16
	.loc 1 21 22 discriminator 3
	mov	eax, 1
	jmp	.L17
.L16:
	.loc 1 21 22 discriminator 4
	mov	eax, 0
.L17:
	.loc 1 21 22 discriminator 6
	and	eax, 1
	.loc 1 22 1 is_stmt 1 discriminator 6
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	is_digit, .-is_digit
	.globl	at_eof
	.type	at_eof, @function
at_eof:
.LFB4:
	.loc 1 24 18
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	.loc 1 25 14
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 25 21
	cmp	eax, 22
	sete	al
	.loc 1 26 1
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	at_eof, .-at_eof
	.globl	is_alnum
	.type	is_alnum, @function
is_alnum:
.LFB5:
	.loc 1 28 22
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	.loc 1 31 32
	cmp	BYTE PTR -4[rbp], 96
	jle	.L22
	.loc 1 29 22
	cmp	BYTE PTR -4[rbp], 122
	jle	.L23
.L22:
	.loc 1 29 38 discriminator 1
	cmp	BYTE PTR -4[rbp], 64
	jle	.L24
	.loc 1 30 16
	cmp	BYTE PTR -4[rbp], 90
	jle	.L23
.L24:
	.loc 1 30 32 discriminator 1
	cmp	BYTE PTR -4[rbp], 47
	jle	.L25
	.loc 1 31 16
	cmp	BYTE PTR -4[rbp], 57
	jle	.L23
.L25:
	.loc 1 31 32 discriminator 2
	cmp	BYTE PTR -4[rbp], 95
	jne	.L26
.L23:
	.loc 1 31 32 is_stmt 0 discriminator 3
	mov	eax, 1
	jmp	.L27
.L26:
	.loc 1 31 32 discriminator 4
	mov	eax, 0
.L27:
	.loc 1 31 32 discriminator 6
	and	eax, 1
	.loc 1 33 1 is_stmt 1 discriminator 6
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	is_alnum, .-is_alnum
	.globl	is_symbol
	.type	is_symbol, @function
is_symbol:
.LFB6:
	.loc 1 35 46
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -72[rbp], rdi
	mov	QWORD PTR -80[rbp], rsi
	.loc 1 38 11
	movabs	rax, 2965662295770410283
	movabs	rdx, 6570253967572220967
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	mov	DWORD PTR -16[rbp], 557465437
	mov	BYTE PTR -12[rbp], 0
	.loc 1 39 11
	mov	DWORD PTR -39[rbp], 2082881084
	mov	WORD PTR -35[rbp], 11563
	mov	BYTE PTR -33[rbp], 0
	.loc 1 40 11
	mov	WORD PTR -42[rbp], 15917
	mov	BYTE PTR -40[rbp], 0
	.loc 1 41 11
	movabs	rax, 3399419658464279868
	mov	QWORD PTR -51[rbp], rax
	mov	BYTE PTR -43[rbp], 0
	.loc 1 44 11
	mov	DWORD PTR -8[rbp], 9
	.loc 1 45 12
	mov	DWORD PTR -4[rbp], 0
	.loc 1 45 6
	jmp	.L30
.L33:
	.loc 1 46 11
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	.loc 1 46 27
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -51[rbp+rax]
	.loc 1 46 9
	cmp	dl, al
	jne	.L31
	.loc 1 46 41 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 46 36 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 46 32 discriminator 1
	cmp	al, 61
	jne	.L31
	.loc 1 47 21
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	.loc 1 48 15
	mov	eax, 1
	jmp	.L43
.L31:
	.loc 1 45 26 discriminator 2
	add	DWORD PTR -4[rbp], 1
.L30:
	.loc 1 45 6 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L33
	.loc 1 53 11
	mov	DWORD PTR -8[rbp], 7
	.loc 1 54 12
	mov	DWORD PTR -4[rbp], 0
	.loc 1 54 6
	jmp	.L34
.L36:
	.loc 1 55 10
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	.loc 1 55 31
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -39[rbp+rax]
	.loc 1 55 9
	cmp	dl, al
	jne	.L35
	.loc 1 55 43 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 55 38 discriminator 1
	movzx	edx, BYTE PTR [rax]
	.loc 1 55 63 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -39[rbp+rax]
	.loc 1 55 35 discriminator 1
	cmp	dl, al
	jne	.L35
	.loc 1 56 21
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	.loc 1 57 15
	mov	eax, 1
	jmp	.L43
.L35:
	.loc 1 54 26 discriminator 2
	add	DWORD PTR -4[rbp], 1
.L34:
	.loc 1 54 6 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L36
	.loc 1 62 11
	mov	DWORD PTR -8[rbp], 1
	.loc 1 63 12
	mov	DWORD PTR -4[rbp], 0
	.loc 1 63 6
	jmp	.L37
.L39:
	.loc 1 64 10
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	.loc 1 64 30
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -42[rbp+rax]
	.loc 1 64 9
	cmp	dl, al
	jne	.L38
	.loc 1 64 42 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 64 37 discriminator 1
	movzx	edx, BYTE PTR [rax]
	.loc 1 64 63 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	.loc 1 64 61 discriminator 1
	cdqe
	movzx	eax, BYTE PTR -42[rbp+rax]
	.loc 1 64 34 discriminator 1
	cmp	dl, al
	jne	.L38
	.loc 1 65 21
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 0
	.loc 1 66 15
	mov	eax, 1
	jmp	.L43
.L38:
	.loc 1 63 27 discriminator 2
	add	DWORD PTR -4[rbp], 2
.L37:
	.loc 1 63 6 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L39
	.loc 1 71 11
	mov	DWORD PTR -8[rbp], 21
	.loc 1 72 12
	mov	DWORD PTR -4[rbp], 0
	.loc 1 72 6
	jmp	.L40
.L42:
	.loc 1 73 10
	mov	rax, QWORD PTR -72[rbp]
	movzx	edx, BYTE PTR [rax]
	.loc 1 73 31
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -32[rbp+rax]
	.loc 1 73 9
	cmp	dl, al
	jne	.L41
	.loc 1 74 21
	mov	rax, QWORD PTR -80[rbp]
	mov	BYTE PTR [rax], 1
	.loc 1 75 15
	mov	eax, 1
	jmp	.L43
.L41:
	.loc 1 72 26 discriminator 2
	add	DWORD PTR -4[rbp], 1
.L40:
	.loc 1 72 6 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L42
	.loc 1 79 13
	mov	eax, 0
.L43:
	.loc 1 80 1 discriminator 1
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	is_symbol, .-is_symbol
	.globl	new_token
	.type	new_token, @function
new_token:
.LFB7:
	.loc 1 83 56
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
	.loc 1 84 15
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 85 12
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 87 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 88 11
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], 1
	.loc 1 89 12
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 90 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 91 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	new_token, .-new_token
	.globl	tokenize_reserved
	.type	tokenize_reserved, @function
tokenize_reserved:
.LFB8:
	.loc 1 93 85
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
	.loc 1 94 5
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, QWORD PTR -16[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	.loc 1 94 4
	test	eax, eax
	jne	.L47
	.loc 1 94 46 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	.loc 1 94 49 discriminator 1
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	.loc 1 94 36 discriminator 1
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	.loc 1 94 33 discriminator 1
	test	al, al
	je	.L48
.L47:
	.loc 1 95 10
	mov	eax, 0
	jmp	.L49
.L48:
	.loc 1 98 9
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	eax, DWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	new_token
	.loc 1 98 7
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rdx], rax
	.loc 1 99 3
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	.loc 1 99 14
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 32[rax], edx
	.loc 1 100 3
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	.loc 1 100 16
	mov	rdx, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rdx]
	.loc 1 100 14
	mov	QWORD PTR 24[rax], rdx
	.loc 1 101 5
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	.loc 1 103 9
	mov	eax, 1
.L49:
	.loc 1 104 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	tokenize_reserved, .-tokenize_reserved
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
	.string	"_Thread_local"
.LC21:
	.string	"__NULL"
.LC22:
	.string	"can not tokenize."
	.text
	.globl	tokenize
	.type	tokenize, @function
tokenize:
.LFB9:
	.loc 1 106 25
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi
	.loc 1 109 12
	mov	QWORD PTR -40[rbp], 0
	.loc 1 112 9
	lea	rax, -48[rbp]
	mov	QWORD PTR -56[rbp], rax
	.loc 1 114 7
	jmp	.L51
.L102:
	.loc 1 115 15
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 115 6
	movsx	eax, al
	mov	edi, eax
	call	is_space
	.loc 1 115 5
	test	al, al
	je	.L52
	.loc 1 116 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 117 4
	jmp	.L51
.L52:
	.loc 1 120 7
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 120 5
	cmp	al, 47
	jne	.L53
	.loc 1 120 25 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 120 22 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 120 18 discriminator 1
	cmp	al, 47
	jne	.L53
	.loc 1 121 9
	jmp	.L54
.L55:
	.loc 1 121 23 discriminator 2
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
.L54:
	.loc 1 121 10 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 121 9 discriminator 1
	cmp	al, 10
	jne	.L55
	.loc 1 122 4
	jmp	.L51
.L53:
	.loc 1 125 7
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 125 5
	cmp	al, 47
	jne	.L56
	.loc 1 125 25 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 125 22 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 125 18 discriminator 1
	cmp	al, 42
	jne	.L56
	.loc 1 126 9
	jmp	.L57
.L58:
	.loc 1 126 46 discriminator 4
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
.L57:
	.loc 1 126 16 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, 1
	.loc 1 126 13 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 126 9 discriminator 1
	cmp	al, 42
	jne	.L58
	.loc 1 126 32 discriminator 3
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 126 10 discriminator 3
	cmp	al, 47
	jne	.L58
	.loc 1 127 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 128 4
	jmp	.L51
.L56:
	.loc 1 132 6
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 132 5
	cmp	al, 39
	jne	.L59
	.loc 1 133 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 134 7
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 134 6
	cmp	al, 92
	jne	.L60
	.loc 1 135 6
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 138 8
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 138 7
	cmp	al, 48
	jne	.L61
	.loc 1 139 12
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	.loc 1 139 10
	mov	QWORD PTR -56[rbp], rax
	.loc 1 140 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 140 15
	mov	DWORD PTR 16[rax], 0
	jmp	.L62
.L61:
	.loc 1 142 14
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 142 13
	cmp	al, 110
	jne	.L63
	.loc 1 143 12
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	.loc 1 143 10
	mov	QWORD PTR -56[rbp], rax
	.loc 1 144 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 144 15
	mov	DWORD PTR 16[rax], 10
	jmp	.L62
.L63:
	.loc 1 146 14
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 146 13
	cmp	al, 116
	jne	.L64
	.loc 1 147 12
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	.loc 1 147 10
	mov	QWORD PTR -56[rbp], rax
	.loc 1 148 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 148 15
	mov	DWORD PTR 16[rax], 9
	jmp	.L62
.L64:
	.loc 1 149 14
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 149 13
	cmp	al, 92
	jne	.L65
	.loc 1 150 12
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	.loc 1 150 10
	mov	QWORD PTR -56[rbp], rax
	.loc 1 151 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 151 15
	mov	DWORD PTR 16[rax], 92
	jmp	.L62
.L65:
	.loc 1 152 14
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 152 13
	cmp	al, 39
	jne	.L62
	.loc 1 153 12
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 3
	call	new_token
	.loc 1 153 10
	mov	QWORD PTR -56[rbp], rax
	.loc 1 154 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 154 15
	mov	DWORD PTR 16[rax], 39
	jmp	.L62
.L60:
	.loc 1 157 11
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_token
	.loc 1 157 9
	mov	QWORD PTR -56[rbp], rax
	.loc 1 158 18
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	.loc 1 158 16
	movzx	edx, BYTE PTR [rax]
	.loc 1 158 8
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 158 16
	movsx	edx, dl
	.loc 1 158 14
	mov	DWORD PTR 16[rax], edx
.L62:
	.loc 1 161 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 162 4
	jmp	.L51
.L59:
	.loc 1 166 15
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 166 6
	movsx	eax, al
	mov	edi, eax
	call	is_digit
	.loc 1 166 5
	test	al, al
	je	.L66
	.loc 1 167 10
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 167 6
	cmp	eax, 2
	jne	.L67
	.loc 1 168 11
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	.loc 1 168 9
	mov	QWORD PTR -56[rbp], rax
	.loc 1 169 8
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 169 14
	mov	DWORD PTR 32[rax], 1
	jmp	.L51
.L67:
	.loc 1 172 11
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_token
	.loc 1 172 9
	mov	QWORD PTR -56[rbp], rax
	.loc 1 174 16
	mov	rax, QWORD PTR -72[rbp]
	lea	rcx, -72[rbp]
	mov	edx, 10
	mov	rsi, rcx
	mov	rdi, rax
	call	strtol@PLT
	mov	rdx, rax
	.loc 1 174 8
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 174 14
	mov	DWORD PTR 16[rax], edx
	.loc 1 176 4
	jmp	.L51
.L66:
	.loc 1 180 6
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, -1[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	is_symbol
	.loc 1 180 5
	test	al, al
	je	.L69
	.loc 1 181 10
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	new_token
	.loc 1 181 8
	mov	QWORD PTR -56[rbp], rax
	.loc 1 182 7
	movzx	eax, BYTE PTR -1[rbp]
	.loc 1 182 6
	test	al, al
	je	.L70
	.loc 1 183 6
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	jmp	.L51
.L70:
	.loc 1 185 7
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 2
	mov	QWORD PTR -72[rbp], rax
	.loc 1 186 8
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 186 14
	mov	DWORD PTR 32[rax], 2
	.loc 1 188 4
	jmp	.L51
.L69:
	.loc 1 191 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 191 5
	test	al, al
	je	.L72
	.loc 1 191 3 discriminator 1
	jmp	.L51
.L72:
	.loc 1 192 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 192 5
	test	al, al
	je	.L73
	.loc 1 192 3 discriminator 1
	jmp	.L51
.L73:
	.loc 1 193 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 193 5
	test	al, al
	je	.L74
	.loc 1 193 3 discriminator 1
	jmp	.L51
.L74:
	.loc 1 194 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 3
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 194 5
	test	al, al
	je	.L75
	.loc 1 194 3 discriminator 1
	jmp	.L51
.L75:
	.loc 1 195 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 195 5
	test	al, al
	je	.L76
	.loc 1 195 3 discriminator 1
	jmp	.L51
.L76:
	.loc 1 196 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 0
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 196 5
	test	al, al
	je	.L77
	.loc 1 196 3 discriminator 1
	jmp	.L51
.L77:
	.loc 1 197 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 4
	mov	rcx, rdx
	mov	edx, 2
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 197 5
	test	al, al
	je	.L78
	.loc 1 197 3 discriminator 1
	jmp	.L51
.L78:
	.loc 1 198 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 5
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 198 5
	test	al, al
	je	.L79
	.loc 1 198 3 discriminator 1
	jmp	.L51
.L79:
	.loc 1 199 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 6
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 199 5
	test	al, al
	je	.L80
	.loc 1 199 3 discriminator 1
	jmp	.L51
.L80:
	.loc 1 200 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 7
	mov	rcx, rdx
	mov	edx, 4
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 200 5
	test	al, al
	je	.L81
	.loc 1 200 3 discriminator 1
	jmp	.L51
.L81:
	.loc 1 201 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 8
	mov	rcx, rdx
	mov	edx, 7
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 201 5
	test	al, al
	je	.L82
	.loc 1 201 3 discriminator 1
	jmp	.L51
.L82:
	.loc 1 202 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 11
	mov	rcx, rdx
	mov	edx, 3
	lea	rsi, .LC11[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 202 5
	test	al, al
	je	.L83
	.loc 1 202 3 discriminator 1
	jmp	.L51
.L83:
	.loc 1 203 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 9
	mov	rcx, rdx
	mov	edx, 2
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 203 5
	test	al, al
	je	.L84
	.loc 1 203 3 discriminator 1
	jmp	.L51
.L84:
	.loc 1 204 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 10
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 204 5
	test	al, al
	je	.L85
	.loc 1 204 3 discriminator 1
	jmp	.L51
.L85:
	.loc 1 205 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 15
	mov	rcx, rdx
	mov	edx, 5
	lea	rsi, .LC14[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 205 5
	test	al, al
	je	.L86
	.loc 1 205 3 discriminator 1
	jmp	.L51
.L86:
	.loc 1 206 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 16
	mov	rcx, rdx
	mov	edx, 8
	lea	rsi, .LC15[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 206 5
	test	al, al
	je	.L87
	.loc 1 206 3 discriminator 1
	jmp	.L51
.L87:
	.loc 1 207 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 12
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC16[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 207 5
	test	al, al
	je	.L88
	.loc 1 207 3 discriminator 1
	jmp	.L51
.L88:
	.loc 1 208 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 17
	mov	rcx, rdx
	mov	edx, 7
	lea	rsi, .LC17[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 208 5
	test	al, al
	je	.L89
	.loc 1 208 3 discriminator 1
	jmp	.L51
.L89:
	.loc 1 209 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 18
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 209 5
	test	al, al
	je	.L90
	.loc 1 209 3 discriminator 1
	jmp	.L51
.L90:
	.loc 1 210 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 19
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC19[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 210 5
	test	al, al
	je	.L91
	.loc 1 210 3 discriminator 1
	jmp	.L51
.L91:
	.loc 1 211 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 20
	mov	rcx, rdx
	mov	edx, 13
	lea	rsi, .LC20[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 211 5
	test	al, al
	je	.L92
	.loc 1 211 3 discriminator 1
	jmp	.L51
.L92:
	.loc 1 214 6
	lea	rdx, -56[rbp]
	lea	rax, -72[rbp]
	mov	r8d, 21
	mov	rcx, rdx
	mov	edx, 6
	lea	rsi, .LC21[rip]
	mov	rdi, rax
	call	tokenize_reserved
	.loc 1 214 5
	test	al, al
	je	.L93
	.loc 1 214 3 discriminator 1
	jmp	.L51
.L93:
	.loc 1 220 15
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 220 6
	movsx	eax, al
	mov	edi, eax
	call	is_block
	.loc 1 220 5
	test	al, al
	je	.L94
	.loc 1 221 10
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_token
	.loc 1 221 8
	mov	QWORD PTR -56[rbp], rax
	.loc 1 222 7
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 222 13
	mov	DWORD PTR 32[rax], 1
	.loc 1 223 7
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 223 13
	mov	rdx, QWORD PTR -72[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 224 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 225 4
	jmp	.L51
.L94:
	.loc 1 229 6
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 229 5
	cmp	al, 34
	jne	.L95
	.loc 1 230 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 231 9
	jmp	.L96
.L97:
	.loc 1 232 11
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 14
	call	new_token
	.loc 1 232 9
	mov	QWORD PTR -56[rbp], rax
.L96:
	.loc 1 231 15
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, 1
	.loc 1 231 12
	movzx	eax, BYTE PTR [rax]
	.loc 1 231 9
	cmp	al, 92
	je	.L97
	.loc 1 231 30 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 231 10 discriminator 1
	cmp	al, 34
	jne	.L97
	.loc 1 234 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 235 4
	jmp	.L51
.L95:
	.loc 1 239 6
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 239 5
	cmp	al, 92
	jne	.L98
	.loc 1 239 23 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	.loc 1 239 20 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 239 17 discriminator 1
	cmp	al, 92
	jne	.L98
	.loc 1 240 10
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	.loc 1 240 8
	mov	QWORD PTR -56[rbp], rax
	.loc 1 241 5
	mov	rax, QWORD PTR -72[rbp]
	add	rax, 1
	mov	QWORD PTR -72[rbp], rax
	.loc 1 242 4
	jmp	.L51
.L98:
	.loc 1 246 15
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 246 6
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	.loc 1 246 5
	test	al, al
	je	.L99
	.loc 1 247 9
	jmp	.L100
.L101:
	.loc 1 248 11
	mov	rax, QWORD PTR -72[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -72[rbp], rdx
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, rax
	mov	rsi, rcx
	mov	edi, 2
	call	new_token
	.loc 1 248 9
	mov	QWORD PTR -56[rbp], rax
	.loc 1 249 8
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 249 14
	mov	DWORD PTR 32[rax], 1
.L100:
	.loc 1 247 19
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 247 10
	movsx	eax, al
	mov	edi, eax
	call	is_alnum
	.loc 1 247 9
	test	al, al
	jne	.L101
	.loc 1 251 4
	jmp	.L51
.L99:
	.loc 1 254 3
	mov	rax, QWORD PTR -72[rbp]
	lea	rsi, .LC22[rip]
	mov	rdi, rax
	call	error_at@PLT
.L51:
	.loc 1 114 8
	mov	rax, QWORD PTR -72[rbp]
	movzx	eax, BYTE PTR [rax]
	.loc 1 114 7
	test	al, al
	jne	.L102
	.loc 1 258 2
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	mov	edi, 22
	call	new_token
	.loc 1 259 13
	mov	rax, QWORD PTR -40[rbp]
	.loc 1 260 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	tokenize, .-tokenize
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "../include/cc_sakura.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe63
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF200
	.byte	0xc
	.long	.LASF201
	.long	.LASF202
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6c
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6c
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	.LASF130
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x21f
	.uleb128 0x8
	.long	.LASF11
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF12
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8b
	.byte	0x40
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8b
	.byte	0x48
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8b
	.byte	0x50
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8b
	.byte	0x58
	.uleb128 0x8
	.long	.LASF23
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x238
	.byte	0x60
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x23e
	.byte	0x68
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x8
	.long	.LASF27
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x73
	.byte	0x78
	.uleb128 0x8
	.long	.LASF28
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x8
	.long	.LASF29
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x8
	.long	.LASF30
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x244
	.byte	0x83
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x254
	.byte	0x88
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x7f
	.byte	0x90
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x25f
	.byte	0x98
	.uleb128 0x8
	.long	.LASF34
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x26a
	.byte	0xa0
	.uleb128 0x8
	.long	.LASF35
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x23e
	.byte	0xa8
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x8
	.long	.LASF37
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x8
	.long	.LASF38
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x8
	.long	.LASF39
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x270
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x98
	.uleb128 0x9
	.long	.LASF203
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xa
	.long	.LASF41
	.uleb128 0x6
	.byte	0x8
	.long	0x233
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0xb
	.long	0x91
	.long	0x254
	.uleb128 0xc
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0xa
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x25a
	.uleb128 0xa
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x265
	.uleb128 0xb
	.long	0x91
	.long	0x280
	.uleb128 0xc
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.long	.LASF44
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x28c
	.uleb128 0x6
	.byte	0x8
	.long	0x21f
	.uleb128 0xd
	.long	.LASF45
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x28c
	.uleb128 0xd
	.long	.LASF46
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x28c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0xb
	.byte	0xd
	.long	0x34a
	.uleb128 0xf
	.long	.LASF48
	.byte	0
	.uleb128 0xf
	.long	.LASF49
	.byte	0x1
	.uleb128 0xf
	.long	.LASF50
	.byte	0x2
	.uleb128 0xf
	.long	.LASF51
	.byte	0x3
	.uleb128 0xf
	.long	.LASF52
	.byte	0x4
	.uleb128 0xf
	.long	.LASF53
	.byte	0x5
	.uleb128 0xf
	.long	.LASF54
	.byte	0x6
	.uleb128 0xf
	.long	.LASF55
	.byte	0x7
	.uleb128 0xf
	.long	.LASF56
	.byte	0x8
	.uleb128 0xf
	.long	.LASF57
	.byte	0x9
	.uleb128 0xf
	.long	.LASF58
	.byte	0xa
	.uleb128 0xf
	.long	.LASF59
	.byte	0xb
	.uleb128 0xf
	.long	.LASF60
	.byte	0xc
	.uleb128 0xf
	.long	.LASF61
	.byte	0xd
	.uleb128 0xf
	.long	.LASF62
	.byte	0xe
	.uleb128 0xf
	.long	.LASF63
	.byte	0xf
	.uleb128 0xf
	.long	.LASF64
	.byte	0x10
	.uleb128 0xf
	.long	.LASF65
	.byte	0x11
	.uleb128 0xf
	.long	.LASF66
	.byte	0x12
	.uleb128 0xf
	.long	.LASF67
	.byte	0x13
	.uleb128 0xf
	.long	.LASF68
	.byte	0x14
	.uleb128 0xf
	.long	.LASF69
	.byte	0x15
	.uleb128 0xf
	.long	.LASF70
	.byte	0x16
	.byte	0
	.uleb128 0x2
	.long	.LASF71
	.byte	0x7
	.byte	0x23
	.byte	0x2
	.long	0x2b1
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x25
	.byte	0xd
	.long	0x473
	.uleb128 0xf
	.long	.LASF72
	.byte	0
	.uleb128 0xf
	.long	.LASF73
	.byte	0x1
	.uleb128 0xf
	.long	.LASF74
	.byte	0x2
	.uleb128 0xf
	.long	.LASF75
	.byte	0x3
	.uleb128 0xf
	.long	.LASF76
	.byte	0x4
	.uleb128 0xf
	.long	.LASF77
	.byte	0x5
	.uleb128 0xf
	.long	.LASF78
	.byte	0x6
	.uleb128 0xf
	.long	.LASF79
	.byte	0x7
	.uleb128 0xf
	.long	.LASF80
	.byte	0x8
	.uleb128 0xf
	.long	.LASF81
	.byte	0x9
	.uleb128 0xf
	.long	.LASF82
	.byte	0xa
	.uleb128 0xf
	.long	.LASF83
	.byte	0xb
	.uleb128 0xf
	.long	.LASF84
	.byte	0xc
	.uleb128 0xf
	.long	.LASF85
	.byte	0xd
	.uleb128 0xf
	.long	.LASF86
	.byte	0xe
	.uleb128 0xf
	.long	.LASF87
	.byte	0xf
	.uleb128 0xf
	.long	.LASF88
	.byte	0x10
	.uleb128 0xf
	.long	.LASF89
	.byte	0x11
	.uleb128 0xf
	.long	.LASF90
	.byte	0x12
	.uleb128 0xf
	.long	.LASF91
	.byte	0x13
	.uleb128 0xf
	.long	.LASF92
	.byte	0x14
	.uleb128 0xf
	.long	.LASF93
	.byte	0x15
	.uleb128 0xf
	.long	.LASF94
	.byte	0x16
	.uleb128 0xf
	.long	.LASF95
	.byte	0x17
	.uleb128 0xf
	.long	.LASF96
	.byte	0x18
	.uleb128 0xf
	.long	.LASF97
	.byte	0x19
	.uleb128 0xf
	.long	.LASF98
	.byte	0x1a
	.uleb128 0xf
	.long	.LASF99
	.byte	0x1b
	.uleb128 0xf
	.long	.LASF100
	.byte	0x1c
	.uleb128 0xf
	.long	.LASF101
	.byte	0x1d
	.uleb128 0xf
	.long	.LASF102
	.byte	0x1e
	.uleb128 0xf
	.long	.LASF103
	.byte	0x1f
	.uleb128 0xf
	.long	.LASF104
	.byte	0x20
	.uleb128 0xf
	.long	.LASF105
	.byte	0x21
	.uleb128 0xf
	.long	.LASF106
	.byte	0x22
	.uleb128 0xf
	.long	.LASF107
	.byte	0x23
	.uleb128 0xf
	.long	.LASF108
	.byte	0x24
	.uleb128 0xf
	.long	.LASF109
	.byte	0x25
	.uleb128 0xf
	.long	.LASF110
	.byte	0x26
	.uleb128 0xf
	.long	.LASF111
	.byte	0x27
	.uleb128 0xf
	.long	.LASF112
	.byte	0x28
	.uleb128 0xf
	.long	.LASF113
	.byte	0x29
	.uleb128 0xf
	.long	.LASF114
	.byte	0x2a
	.uleb128 0xf
	.long	.LASF115
	.byte	0x2b
	.uleb128 0xf
	.long	.LASF116
	.byte	0x2c
	.byte	0
	.uleb128 0x2
	.long	.LASF117
	.byte	0x7
	.byte	0x5e
	.byte	0x2
	.long	0x356
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x60
	.byte	0xd
	.long	0x4be
	.uleb128 0xf
	.long	.LASF118
	.byte	0
	.uleb128 0xf
	.long	.LASF119
	.byte	0x1
	.uleb128 0xf
	.long	.LASF120
	.byte	0x2
	.uleb128 0x10
	.string	"INT"
	.byte	0x3
	.uleb128 0x10
	.string	"PTR"
	.byte	0x4
	.uleb128 0xf
	.long	.LASF121
	.byte	0x5
	.uleb128 0xf
	.long	.LASF122
	.byte	0x6
	.uleb128 0xf
	.long	.LASF123
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF124
	.byte	0x7
	.byte	0x69
	.byte	0x2
	.long	0x47f
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x72
	.byte	0xd
	.long	0x4eb
	.uleb128 0xf
	.long	.LASF125
	.byte	0
	.uleb128 0xf
	.long	.LASF126
	.byte	0x1
	.uleb128 0xf
	.long	.LASF127
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF128
	.byte	0x7
	.byte	0x76
	.byte	0x2
	.long	0x4ca
	.uleb128 0x2
	.long	.LASF129
	.byte	0x7
	.byte	0x78
	.byte	0x17
	.long	0x503
	.uleb128 0x7
	.long	.LASF129
	.byte	0x28
	.byte	0x7
	.byte	0x86
	.byte	0x8
	.long	0x552
	.uleb128 0x8
	.long	.LASF131
	.byte	0x7
	.byte	0x87
	.byte	0xc
	.long	0x34a
	.byte	0
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0x88
	.byte	0x9
	.long	0x9b0
	.byte	0x8
	.uleb128 0x11
	.string	"val"
	.byte	0x7
	.byte	0x89
	.byte	0x6
	.long	0x65
	.byte	0x10
	.uleb128 0x11
	.string	"str"
	.byte	0x7
	.byte	0x8a
	.byte	0x8
	.long	0x8b
	.byte	0x18
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0x8b
	.byte	0x6
	.long	0x65
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF133
	.byte	0x7
	.byte	0x79
	.byte	0x17
	.long	0x55e
	.uleb128 0x7
	.long	.LASF133
	.byte	0x48
	.byte	0x7
	.byte	0xa6
	.byte	0x8
	.long	0x5e1
	.uleb128 0x8
	.long	.LASF131
	.byte	0x7
	.byte	0xa7
	.byte	0xb
	.long	0x473
	.byte	0
	.uleb128 0x11
	.string	"lhs"
	.byte	0x7
	.byte	0xa8
	.byte	0x8
	.long	0x9c2
	.byte	0x8
	.uleb128 0x11
	.string	"rhs"
	.byte	0x7
	.byte	0xa9
	.byte	0x8
	.long	0x9c2
	.byte	0x10
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xaa
	.byte	0x8
	.long	0x9c2
	.byte	0x18
	.uleb128 0x8
	.long	.LASF134
	.byte	0x7
	.byte	0xab
	.byte	0x8
	.long	0x9c2
	.byte	0x20
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xac
	.byte	0x8
	.long	0x9b6
	.byte	0x28
	.uleb128 0x11
	.string	"val"
	.byte	0x7
	.byte	0xad
	.byte	0x7
	.long	0x65
	.byte	0x30
	.uleb128 0x11
	.string	"str"
	.byte	0x7
	.byte	0xae
	.byte	0x8
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xaf
	.byte	0x7
	.long	0x65
	.byte	0x40
	.byte	0
	.uleb128 0x2
	.long	.LASF137
	.byte	0x7
	.byte	0x7a
	.byte	0x17
	.long	0x5ed
	.uleb128 0x7
	.long	.LASF137
	.byte	0x20
	.byte	0x7
	.byte	0xd0
	.byte	0x8
	.long	0x63c
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xd1
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xd2
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xd3
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xd4
	.byte	0x8
	.long	0x9b6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xd5
	.byte	0x8
	.long	0x9eb
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF139
	.byte	0x7
	.byte	0x7b
	.byte	0x17
	.long	0x648
	.uleb128 0x7
	.long	.LASF139
	.byte	0x28
	.byte	0x7
	.byte	0xc6
	.byte	0x8
	.long	0x6a4
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xc7
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF140
	.byte	0x7
	.byte	0xc8
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xc9
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xca
	.byte	0x8
	.long	0x9b6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xcb
	.byte	0x8
	.long	0x9e5
	.byte	0x18
	.uleb128 0x8
	.long	.LASF141
	.byte	0x7
	.byte	0xcc
	.byte	0x8
	.long	0x9c2
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF142
	.byte	0x7
	.byte	0x7c
	.byte	0x17
	.long	0x6b0
	.uleb128 0x7
	.long	.LASF142
	.byte	0x20
	.byte	0x7
	.byte	0xe1
	.byte	0x8
	.long	0x6ff
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xe2
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF140
	.byte	0x7
	.byte	0xe3
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xe4
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF143
	.byte	0x7
	.byte	0xe5
	.byte	0xa
	.long	0x9f7
	.byte	0x10
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xe6
	.byte	0xa
	.long	0x9fd
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF144
	.byte	0x7
	.byte	0x7d
	.byte	0x17
	.long	0x70b
	.uleb128 0x7
	.long	.LASF144
	.byte	0x20
	.byte	0x7
	.byte	0xea
	.byte	0x8
	.long	0x74d
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xeb
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xec
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF143
	.byte	0x7
	.byte	0xed
	.byte	0xa
	.long	0x9f7
	.byte	0x10
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xee
	.byte	0xa
	.long	0xa03
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF145
	.byte	0x7
	.byte	0x7e
	.byte	0x17
	.long	0x759
	.uleb128 0x7
	.long	.LASF145
	.byte	0x28
	.byte	0x7
	.byte	0xf2
	.byte	0x8
	.long	0x7b5
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xf3
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xf4
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF140
	.byte	0x7
	.byte	0xf5
	.byte	0x9
	.long	0x65
	.byte	0x8
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xf6
	.byte	0xa
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xf7
	.byte	0xa
	.long	0x9b6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xf8
	.byte	0xa
	.long	0x9f7
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF146
	.byte	0x7
	.byte	0x7f
	.byte	0x17
	.long	0x7c1
	.uleb128 0x12
	.long	.LASF146
	.value	0x988
	.byte	0x7
	.byte	0xb3
	.byte	0x8
	.long	0x81f
	.uleb128 0x8
	.long	.LASF147
	.byte	0x7
	.byte	0xb5
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xb6
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xb7
	.byte	0x8
	.long	0x9b6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF148
	.byte	0x7
	.byte	0xb8
	.byte	0x8
	.long	0x9c2
	.byte	0x18
	.uleb128 0x8
	.long	.LASF149
	.byte	0x7
	.byte	0xb9
	.byte	0x8
	.long	0x9c8
	.byte	0x20
	.uleb128 0x13
	.long	.LASF132
	.byte	0x7
	.byte	0xba
	.byte	0x8
	.long	0x9d9
	.value	0x980
	.byte	0
	.uleb128 0x2
	.long	.LASF150
	.byte	0x7
	.byte	0x80
	.byte	0x17
	.long	0x82b
	.uleb128 0x7
	.long	.LASF150
	.byte	0x20
	.byte	0x7
	.byte	0xd9
	.byte	0x8
	.long	0x86c
	.uleb128 0x11
	.string	"id"
	.byte	0x7
	.byte	0xda
	.byte	0xc
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF151
	.byte	0x7
	.byte	0xdb
	.byte	0xd
	.long	0x9c2
	.byte	0x8
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xdc
	.byte	0xd
	.long	0x9f1
	.byte	0x10
	.uleb128 0x8
	.long	.LASF131
	.byte	0x7
	.byte	0xdd
	.byte	0xc
	.long	0x4eb
	.byte	0x18
	.byte	0
	.uleb128 0x14
	.string	"Str"
	.byte	0x7
	.byte	0x81
	.byte	0x17
	.long	0x878
	.uleb128 0x15
	.string	"Str"
	.byte	0x18
	.byte	0x7
	.byte	0xbe
	.byte	0x8
	.long	0x8ba
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xbf
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF152
	.byte	0x7
	.byte	0xc0
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x11
	.string	"str"
	.byte	0x7
	.byte	0xc1
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xc2
	.byte	0x7
	.long	0x9df
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.long	.LASF153
	.byte	0x7
	.byte	0x82
	.byte	0x17
	.long	0x8c6
	.uleb128 0x7
	.long	.LASF153
	.byte	0x30
	.byte	0x7
	.byte	0x8f
	.byte	0x8
	.long	0x948
	.uleb128 0x11
	.string	"ty"
	.byte	0x7
	.byte	0x90
	.byte	0xb
	.long	0x4be
	.byte	0
	.uleb128 0x8
	.long	.LASF154
	.byte	0x7
	.byte	0x91
	.byte	0x9
	.long	0x9b6
	.byte	0x8
	.uleb128 0x8
	.long	.LASF155
	.byte	0x7
	.byte	0x92
	.byte	0x7
	.long	0x65
	.byte	0x10
	.uleb128 0x8
	.long	.LASF156
	.byte	0x7
	.byte	0x93
	.byte	0x7
	.long	0x65
	.byte	0x14
	.uleb128 0x8
	.long	.LASF157
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x8
	.long	.LASF158
	.byte	0x7
	.byte	0x95
	.byte	0xb
	.long	0x65
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF159
	.byte	0x7
	.byte	0x96
	.byte	0xb
	.long	0x65
	.byte	0x20
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0x97
	.byte	0xb
	.long	0x65
	.byte	0x24
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0x98
	.byte	0xc
	.long	0x8b
	.byte	0x28
	.byte	0
	.uleb128 0x2
	.long	.LASF160
	.byte	0x7
	.byte	0x83
	.byte	0x19
	.long	0x954
	.uleb128 0x7
	.long	.LASF160
	.byte	0x30
	.byte	0x7
	.byte	0x9c
	.byte	0x8
	.long	0x9b0
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0x9d
	.byte	0xc
	.long	0x8b
	.byte	0
	.uleb128 0x8
	.long	.LASF161
	.byte	0x7
	.byte	0x9e
	.byte	0xb
	.long	0x65
	.byte	0x8
	.uleb128 0x11
	.string	"tag"
	.byte	0x7
	.byte	0x9f
	.byte	0xc
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF162
	.byte	0x7
	.byte	0xa0
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xa1
	.byte	0xc
	.long	0x9b6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF132
	.byte	0x7
	.byte	0xa2
	.byte	0xc
	.long	0x9bc
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4f7
	.uleb128 0x6
	.byte	0x8
	.long	0x8ba
	.uleb128 0x6
	.byte	0x8
	.long	0x948
	.uleb128 0x6
	.byte	0x8
	.long	0x552
	.uleb128 0xb
	.long	0x9c2
	.long	0x9d9
	.uleb128 0x16
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7b5
	.uleb128 0x6
	.byte	0x8
	.long	0x86c
	.uleb128 0x6
	.byte	0x8
	.long	0x63c
	.uleb128 0x6
	.byte	0x8
	.long	0x5e1
	.uleb128 0x6
	.byte	0x8
	.long	0x81f
	.uleb128 0x6
	.byte	0x8
	.long	0x74d
	.uleb128 0x6
	.byte	0x8
	.long	0x6a4
	.uleb128 0x6
	.byte	0x8
	.long	0x6ff
	.uleb128 0xd
	.long	.LASF163
	.byte	0x7
	.byte	0xfe
	.byte	0x11
	.long	0x65
	.uleb128 0xd
	.long	.LASF164
	.byte	0x7
	.byte	0xff
	.byte	0x11
	.long	0x65
	.uleb128 0x17
	.long	.LASF165
	.byte	0x7
	.value	0x100
	.byte	0x12
	.long	0x8b
	.uleb128 0xb
	.long	0x91
	.long	0xa3e
	.uleb128 0xc
	.long	0x39
	.byte	0x63
	.byte	0
	.uleb128 0x17
	.long	.LASF166
	.byte	0x7
	.value	0x101
	.byte	0x11
	.long	0xa2e
	.uleb128 0x17
	.long	.LASF167
	.byte	0x7
	.value	0x102
	.byte	0x12
	.long	0x9b0
	.uleb128 0xb
	.long	0x9d9
	.long	0xa69
	.uleb128 0x16
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x17
	.long	.LASF168
	.byte	0x7
	.value	0x103
	.byte	0x12
	.long	0xa58
	.uleb128 0x17
	.long	.LASF169
	.byte	0x7
	.value	0x104
	.byte	0x12
	.long	0x9eb
	.uleb128 0x17
	.long	.LASF170
	.byte	0x7
	.value	0x105
	.byte	0x12
	.long	0x9e5
	.uleb128 0x17
	.long	.LASF171
	.byte	0x7
	.value	0x106
	.byte	0x12
	.long	0x9df
	.uleb128 0x17
	.long	.LASF172
	.byte	0x7
	.value	0x107
	.byte	0x12
	.long	0x9fd
	.uleb128 0x17
	.long	.LASF173
	.byte	0x7
	.value	0x108
	.byte	0x12
	.long	0xa03
	.uleb128 0x17
	.long	.LASF174
	.byte	0x7
	.value	0x109
	.byte	0x12
	.long	0x9bc
	.uleb128 0x17
	.long	.LASF175
	.byte	0x7
	.value	0x10a
	.byte	0x12
	.long	0x9f1
	.uleb128 0x17
	.long	.LASF176
	.byte	0x7
	.value	0x10b
	.byte	0x12
	.long	0x9f1
	.uleb128 0x17
	.long	.LASF177
	.byte	0x7
	.value	0x10c
	.byte	0x12
	.long	0x9eb
	.uleb128 0x17
	.long	.LASF178
	.byte	0x7
	.value	0x10d
	.byte	0x12
	.long	0x9fd
	.uleb128 0x17
	.long	.LASF179
	.byte	0x7
	.value	0x10e
	.byte	0x12
	.long	0xa03
	.uleb128 0x17
	.long	.LASF180
	.byte	0x7
	.value	0x10f
	.byte	0x12
	.long	0x9bc
	.uleb128 0x17
	.long	.LASF152
	.byte	0x7
	.value	0x16b
	.byte	0xc
	.long	0x65
	.uleb128 0x17
	.long	.LASF181
	.byte	0x7
	.value	0x16c
	.byte	0xc
	.long	0x65
	.uleb128 0x18
	.long	.LASF185
	.byte	0x1
	.byte	0x6a
	.byte	0x8
	.long	0x9b0
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xb8b
	.uleb128 0x19
	.string	"p"
	.byte	0x1
	.byte	0x6a
	.byte	0x17
	.long	0x8b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF182
	.byte	0x1
	.byte	0x6b
	.byte	0x7
	.long	0xb8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.long	.LASF183
	.byte	0x1
	.byte	0x6c
	.byte	0x8
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.string	"now"
	.byte	0x1
	.byte	0x70
	.byte	0x9
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF184
	.uleb128 0x18
	.long	.LASF186
	.byte	0x1
	.byte	0x5d
	.byte	0x6
	.long	0xb8b
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xbfe
	.uleb128 0x19
	.string	"p"
	.byte	0x1
	.byte	0x5d
	.byte	0x1f
	.long	0xbfe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x5d
	.byte	0x28
	.long	0x8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0x5d
	.byte	0x31
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.string	"now"
	.byte	0x1
	.byte	0x5d
	.byte	0x3e
	.long	0xc04
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.long	.LASF187
	.byte	0x1
	.byte	0x5d
	.byte	0x4d
	.long	0x34a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x6
	.byte	0x8
	.long	0x9b0
	.uleb128 0x18
	.long	.LASF188
	.byte	0x1
	.byte	0x53
	.byte	0x8
	.long	0x9b0
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xc69
	.uleb128 0x1c
	.long	.LASF131
	.byte	0x1
	.byte	0x53
	.byte	0x1c
	.long	0x34a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.string	"cur"
	.byte	0x1
	.byte	0x53
	.byte	0x29
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x53
	.byte	0x34
	.long	0x8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.string	"new"
	.byte	0x1
	.byte	0x54
	.byte	0x9
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF189
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.long	0xb8b
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xd05
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x23
	.byte	0x16
	.long	0x8b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1c
	.long	.LASF190
	.byte	0x1
	.byte	0x23
	.byte	0x22
	.long	0xd05
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x24
	.byte	0xa
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	.LASF155
	.byte	0x1
	.byte	0x25
	.byte	0xa
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF191
	.byte	0x1
	.byte	0x26
	.byte	0xb
	.long	0xd0b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF192
	.byte	0x1
	.byte	0x27
	.byte	0xb
	.long	0xd1b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -55
	.uleb128 0x1a
	.long	.LASF193
	.byte	0x1
	.byte	0x28
	.byte	0xb
	.long	0xd2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x1a
	.long	.LASF194
	.byte	0x1
	.byte	0x29
	.byte	0xb
	.long	0xd3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -67
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb8b
	.uleb128 0xb
	.long	0x91
	.long	0xd1b
	.uleb128 0xc
	.long	0x39
	.byte	0x14
	.byte	0
	.uleb128 0xb
	.long	0x91
	.long	0xd2b
	.uleb128 0xc
	.long	0x39
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.long	0x91
	.long	0xd3b
	.uleb128 0xc
	.long	0x39
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	0x91
	.long	0xd4b
	.uleb128 0xc
	.long	0x39
	.byte	0x8
	.byte	0
	.uleb128 0x1d
	.long	.LASF195
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.long	0xb8b
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xd7b
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x1c
	.byte	0x14
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF204
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.long	0xb8b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LASF196
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.long	0xb8b
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0xdc9
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x14
	.byte	0x14
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.long	.LASF197
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.long	0xb8b
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf9
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x10
	.byte	0x14
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.long	.LASF198
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.long	0xb8b
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xe29
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0xc
	.byte	0x14
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1f
	.long	.LASF205
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.long	0x65
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x3
	.byte	0x13
	.long	0x8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF199
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF12:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_chain"
.LASF122:
	.string	"STRUCT"
.LASF202:
	.string	"/home/takana/git/cc_sakura/demo"
.LASF7:
	.string	"size_t"
.LASF109:
	.string	"ND_FOR"
.LASF30:
	.string	"_shortbuf"
.LASF146:
	.string	"Func"
.LASF178:
	.string	"outside_struct"
.LASF161:
	.string	"name_len"
.LASF135:
	.string	"type"
.LASF141:
	.string	"init"
.LASF62:
	.string	"TK_STR"
.LASF18:
	.string	"_IO_buf_base"
.LASF137:
	.string	"LVar"
.LASF139:
	.string	"GVar"
.LASF120:
	.string	"CHAR"
.LASF51:
	.string	"TK_NUM"
.LASF123:
	.string	"ENUM"
.LASF175:
	.string	"labels_head"
.LASF185:
	.string	"tokenize"
.LASF132:
	.string	"next"
.LASF33:
	.string	"_codecvt"
.LASF65:
	.string	"TK_TYPEDEF"
.LASF110:
	.string	"ND_WHILE"
.LASF116:
	.string	"ND_TYPE"
.LASF47:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF102:
	.string	"ND_TERNARY"
.LASF95:
	.string	"ND_GVAR"
.LASF121:
	.string	"ARRAY"
.LASF25:
	.string	"_fileno"
.LASF133:
	.string	"Node"
.LASF151:
	.string	"cond"
.LASF13:
	.string	"_IO_read_end"
.LASF60:
	.string	"TK_SIZEOF"
.LASF129:
	.string	"Token"
.LASF179:
	.string	"outside_enum"
.LASF6:
	.string	"long int"
.LASF157:
	.string	"index_size"
.LASF82:
	.string	"ND_NE"
.LASF11:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_cur_column"
.LASF124:
	.string	"TypeKind"
.LASF125:
	.string	"LB_LABEL"
.LASF42:
	.string	"_IO_codecvt"
.LASF183:
	.string	"head"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF190:
	.string	"single_flag"
.LASF164:
	.string	"alloc_size"
.LASF78:
	.string	"ND_GE"
.LASF136:
	.string	"offset"
.LASF100:
	.string	"ND_CALL_FUNC"
.LASF127:
	.string	"LB_DEFAULT"
.LASF115:
	.string	"ND_ARG"
.LASF77:
	.string	"ND_GT"
.LASF41:
	.string	"_IO_marker"
.LASF44:
	.string	"stdin"
.LASF92:
	.string	"ND_ADDRESS"
.LASF1:
	.string	"unsigned int"
.LASF159:
	.string	"is_thread_local"
.LASF36:
	.string	"_freeres_buf"
.LASF168:
	.string	"func_list"
.LASF176:
	.string	"labels_tail"
.LASF96:
	.string	"ND_LARRAY"
.LASF49:
	.string	"TK_RESERVED"
.LASF160:
	.string	"Def_Type"
.LASF0:
	.string	"long unsigned int"
.LASF195:
	.string	"is_alnum"
.LASF84:
	.string	"ND_OR"
.LASF16:
	.string	"_IO_write_ptr"
.LASF99:
	.string	"ND_NUM"
.LASF193:
	.string	"multi_symbol"
.LASF138:
	.string	"name"
.LASF180:
	.string	"outside_deftype"
.LASF56:
	.string	"TK_DEFAULT"
.LASF158:
	.string	"is_extern"
.LASF131:
	.string	"kind"
.LASF53:
	.string	"TK_ELSE"
.LASF155:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF88:
	.string	"ND_DOT"
.LASF20:
	.string	"_IO_save_base"
.LASF174:
	.string	"defined_types"
.LASF97:
	.string	"ND_GARRAY"
.LASF162:
	.string	"tag_len"
.LASF171:
	.string	"strings"
.LASF31:
	.string	"_lock"
.LASF73:
	.string	"ND_SUB"
.LASF192:
	.string	"repeat_symbol"
.LASF5:
	.string	"short int"
.LASF38:
	.string	"_mode"
.LASF45:
	.string	"stdout"
.LASF112:
	.string	"ND_BREAK"
.LASF72:
	.string	"ND_ADD"
.LASF181:
	.string	"label_loop_end"
.LASF119:
	.string	"BOOL"
.LASF113:
	.string	"ND_CONTINUE"
.LASF50:
	.string	"TK_IDENT"
.LASF64:
	.string	"TK_CONTINUE"
.LASF194:
	.string	"multi_eq"
.LASF163:
	.string	"llid"
.LASF89:
	.string	"ND_ARROW"
.LASF177:
	.string	"outside_lvar"
.LASF205:
	.string	"len_val"
.LASF71:
	.string	"TokenKind"
.LASF17:
	.string	"_IO_write_end"
.LASF106:
	.string	"ND_ELSE"
.LASF85:
	.string	"ND_ASSIGN"
.LASF74:
	.string	"ND_MUL"
.LASF105:
	.string	"ND_IF"
.LASF52:
	.string	"TK_IF"
.LASF189:
	.string	"is_symbol"
.LASF203:
	.string	"_IO_lock_t"
.LASF130:
	.string	"_IO_FILE"
.LASF90:
	.string	"ND_PREID"
.LASF188:
	.string	"new_token"
.LASF54:
	.string	"TK_SWITCH"
.LASF93:
	.string	"ND_DEREF"
.LASF145:
	.string	"Member"
.LASF91:
	.string	"ND_NOT"
.LASF55:
	.string	"TK_CASE"
.LASF144:
	.string	"Enum"
.LASF182:
	.string	"is_single_token"
.LASF167:
	.string	"token"
.LASF196:
	.string	"is_digit"
.LASF153:
	.string	"Type"
.LASF23:
	.string	"_markers"
.LASF126:
	.string	"LB_CASE"
.LASF94:
	.string	"ND_LVAR"
.LASF187:
	.string	"tk_kind"
.LASF98:
	.string	"ND_STR"
.LASF184:
	.string	"_Bool"
.LASF2:
	.string	"unsigned char"
.LASF75:
	.string	"ND_DIV"
.LASF107:
	.string	"ND_IFELSE"
.LASF186:
	.string	"tokenize_reserved"
.LASF201:
	.string	"../src/tokenizer.c"
.LASF43:
	.string	"_IO_wide_data"
.LASF26:
	.string	"_flags2"
.LASF86:
	.string	"ND_COMPOUND"
.LASF152:
	.string	"label_num"
.LASF29:
	.string	"_vtable_offset"
.LASF40:
	.string	"FILE"
.LASF165:
	.string	"user_input"
.LASF81:
	.string	"ND_EQ"
.LASF66:
	.string	"TK_EXTERN"
.LASF67:
	.string	"TK_RETURN"
.LASF104:
	.string	"ND_NULL_STMT"
.LASF69:
	.string	"TK_COMPILER_DIRECTIVE"
.LASF76:
	.string	"ND_MOD"
.LASF128:
	.string	"LabelKind"
.LASF101:
	.string	"ND_CASE"
.LASF10:
	.string	"char"
.LASF198:
	.string	"is_block"
.LASF59:
	.string	"TK_FOR"
.LASF87:
	.string	"ND_POSTID"
.LASF83:
	.string	"ND_AND"
.LASF140:
	.string	"memsize"
.LASF191:
	.string	"single_symbol"
.LASF200:
	.string	"GNU C11 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c11 -fasynchronous-unwind-tables"
.LASF108:
	.string	"ND_SWITCH"
.LASF68:
	.string	"TK_THREAD_LOCAL"
.LASF197:
	.string	"is_space"
.LASF169:
	.string	"locals"
.LASF173:
	.string	"enumerations"
.LASF9:
	.string	"__off64_t"
.LASF63:
	.string	"TK_BREAK"
.LASF172:
	.string	"structs"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF142:
	.string	"Struc"
.LASF58:
	.string	"TK_WHILE"
.LASF103:
	.string	"ND_BLOCK"
.LASF37:
	.string	"__pad5"
.LASF114:
	.string	"ND_RETURN"
.LASF39:
	.string	"_unused2"
.LASF46:
	.string	"stderr"
.LASF149:
	.string	"code"
.LASF21:
	.string	"_IO_backup_base"
.LASF57:
	.string	"TK_DO"
.LASF166:
	.string	"filename"
.LASF117:
	.string	"NodeKind"
.LASF147:
	.string	"stack_size"
.LASF134:
	.string	"block_code"
.LASF70:
	.string	"TK_EOF"
.LASF61:
	.string	"TK_BLOCK"
.LASF156:
	.string	"align"
.LASF143:
	.string	"member"
.LASF35:
	.string	"_freeres_list"
.LASF80:
	.string	"ND_LE"
.LASF199:
	.string	"counter"
.LASF34:
	.string	"_wide_data"
.LASF150:
	.string	"Label"
.LASF148:
	.string	"args"
.LASF170:
	.string	"globals"
.LASF79:
	.string	"ND_LT"
.LASF15:
	.string	"_IO_write_base"
.LASF111:
	.string	"ND_DOWHILE"
.LASF204:
	.string	"at_eof"
.LASF48:
	.string	"TK_TYPE"
.LASF154:
	.string	"ptr_to"
.LASF118:
	.string	"VOID"
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
