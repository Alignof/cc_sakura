	.file	"codegen.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"\tpush rax"
	.text
	.globl	expand_next
	.type	expand_next, @function
expand_next:
.LFB0:
	.file 1 "../src/codegen.c"
	.loc 1 3 29
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 4 7
	jmp	.L2
.L3:
	.loc 1 5 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen
	.loc 1 6 7
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
.L2:
	.loc 1 4 7
	cmp	QWORD PTR -8[rbp], 0
	jne	.L3
	.loc 1 8 2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 9 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	expand_next, .-expand_next
	.globl	expand_block_code
	.type	expand_block_code, @function
expand_block_code:
.LFB1:
	.loc 1 11 35
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 12 7
	jmp	.L5
.L6:
	.loc 1 13 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen
	.loc 1 14 7
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -8[rbp], rax
.L5:
	.loc 1 12 7
	cmp	QWORD PTR -8[rbp], 0
	jne	.L6
	.loc 1 16 2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 17 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	expand_block_code, .-expand_block_code
	.section	.rodata
.LC1:
	.string	"\tmov rax, fs:0"
.LC2:
	.string	"\tadd rax, fs:%.*s@tpoff\n"
.LC3:
	.string	"\tlea rax,%.*s[rip]\n"
	.text
	.globl	gen_gvar
	.type	gen_gvar, @function
gen_gvar:
.LFB2:
	.loc 1 20 26
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 21 9
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 21 15
	mov	eax, DWORD PTR 32[rax]
	.loc 1 21 4
	test	eax, eax
	je	.L8
	.loc 1 22 3
	lea	rdi, .LC1[rip]
	call	puts@PLT
	.loc 1 23 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L9
.L8:
	.loc 1 25 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
.L9:
	.loc 1 27 2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 28 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	gen_gvar, .-gen_gvar
	.section	.rodata
.LC4:
	.string	"not a variable"
.LC5:
	.string	"\tmov rax,rbp"
.LC6:
	.string	"\tsub rax,%d\n"
	.text
	.globl	gen_lvar
	.type	gen_lvar, @function
gen_lvar:
.LFB3:
	.loc 1 30 26
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 31 9
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 31 4
	cmp	eax, 22
	je	.L11
	.loc 1 31 34 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 31 27 discriminator 1
	cmp	eax, 24
	je	.L11
	.loc 1 31 61 discriminator 2
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 31 54 discriminator 2
	cmp	eax, 28
	je	.L11
	.loc 1 32 17
	mov	rax, QWORD PTR token[rip]
	.loc 1 32 3
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	error_at@PLT
.L11:
	.loc 1 35 2
	lea	rdi, .LC5[rip]
	call	puts@PLT
	.loc 1 36 2
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 64[rax]
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 37 2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 38 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	gen_lvar, .-gen_lvar
	.section	.rodata
.LC7:
	.string	"not a struct"
.LC8:
	.string	"\tpop rdi"
.LC9:
	.string	"\tpop rax"
.LC10:
	.string	"\tadd rax,rdi"
	.text
	.globl	gen_struc
	.type	gen_struc, @function
gen_struc:
.LFB4:
	.loc 1 40 27
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 41 9
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 41 4
	cmp	eax, 16
	je	.L13
	.loc 1 41 33 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 41 26 discriminator 1
	cmp	eax, 17
	je	.L13
	.loc 1 42 17
	mov	rax, QWORD PTR token[rip]
	.loc 1 42 3
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	error_at@PLT
.L13:
	.loc 1 45 2
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 46 2
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 48 2
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 49 2
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 50 2
	lea	rdi, .LC10[rip]
	call	puts@PLT
	.loc 1 51 2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 52 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	gen_struc, .-gen_struc
	.section	.rodata
.LC11:
	.string	"\tmov %s,rax\n"
.LC12:
	.string	"\tmov rax,%d\n"
	.text
	.globl	gen_args
	.type	gen_args, @function
gen_args:
.LFB5:
	.loc 1 54 26
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	.loc 1 56 6
	mov	DWORD PTR -8[rbp], 0
	.loc 1 57 13
	mov	DWORD PTR -32[rbp], 6906994
	mov	DWORD PTR -28[rbp], 6910834
	mov	DWORD PTR -24[rbp], 7890034
	mov	DWORD PTR -20[rbp], 7889778
	mov	DWORD PTR -16[rbp], 14450
	mov	DWORD PTR -12[rbp], 14706
	.loc 1 60 7
	jmp	.L15
.L16:
	.loc 1 61 3
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	gen_expr
	.loc 1 62 12
	add	DWORD PTR -8[rbp], 1
	.loc 1 63 7
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -40[rbp], rax
.L15:
	.loc 1 60 7
	cmp	QWORD PTR -40[rbp], 0
	jne	.L16
	.loc 1 66 13
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR -4[rbp], eax
	.loc 1 66 2
	jmp	.L17
.L18:
	.loc 1 67 3 discriminator 3
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 68 38 discriminator 3
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, -1[rax]
	.loc 1 68 30 discriminator 3
	lea	rax, -32[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	.loc 1 68 3 discriminator 3
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 66 43 discriminator 3
	sub	DWORD PTR -4[rbp], 1
.L17:
	.loc 1 66 2 discriminator 1
	cmp	DWORD PTR -4[rbp], 0
	jg	.L18
	.loc 1 70 2
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 72 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	gen_args, .-gen_args
	.section	.rodata
.LC13:
	.string	"can not assign"
	.text
	.globl	gen_address
	.type	gen_address, @function
gen_address:
.LFB6:
	.loc 1 74 29
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 75 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 75 9
	cmp	eax, 21
	jne	.L20
	.loc 1 75 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L20:
	.loc 1 76 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 76 9
	cmp	eax, 16
	jne	.L22
	.loc 1 76 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L22:
	.loc 1 77 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 77 9
	cmp	eax, 17
	jne	.L23
	.loc 1 77 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L23:
	.loc 1 78 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 78 9
	cmp	eax, 23
	jne	.L24
	.loc 1 78 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L24:
	.loc 1 79 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 79 9
	cmp	eax, 25
	jne	.L25
	.loc 1 79 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L25:
	.loc 1 80 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 80 9
	cmp	eax, 22
	jne	.L26
	.loc 1 80 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L26:
	.loc 1 81 14
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 81 9
	cmp	eax, 24
	jne	.L27
	.loc 1 81 36 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	.loc 1 83 1 discriminator 1
	jmp	.L28
.L27:
	.loc 1 82 21
	mov	rax, QWORD PTR token[rip]
	.loc 1 82 7
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	call	error_at@PLT
.L28:
	.loc 1 83 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	gen_address, .-gen_address
	.section	.rodata
.LC14:
	.string	"\tadd %s,%s\n"
.LC15:
	.string	"\tsub %s,%s\n"
.LC16:
	.string	"\timul %s,%s\n"
.LC17:
	.string	"\tcqo"
.LC18:
	.string	"\tidiv %s,%s\n"
.LC19:
	.string	"\tmov %s,%s\n"
.LC20:
	.string	"\tcmp %s,%s\n"
.LC21:
	.string	"\tsetl al"
.LC22:
	.string	"\tmovzb rax,al"
.LC23:
	.string	"\tsetle al"
.LC24:
	.string	"\tsete al"
.LC25:
	.string	"\tsetne al"
.LC26:
	.string	"\tand %s,%s\n"
.LC27:
	.string	"\tor %s,%s\n"
.LC28:
	.string	"cannot code gen"
	.text
	.globl	gen_calc
	.type	gen_calc, @function
gen_calc:
.LFB7:
	.loc 1 85 26
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	QWORD PTR -104[rbp], rdi
	.loc 1 87 13
	mov	DWORD PTR -32[rbp], 7889253
	mov	DWORD PTR -28[rbp], 7889253
	mov	DWORD PTR -24[rbp], 7889253
	mov	DWORD PTR -20[rbp], 7889253
	mov	DWORD PTR -16[rbp], 7889266
	mov	DWORD PTR -12[rbp], 7889266
	.loc 1 88 13
	mov	DWORD PTR -64[rbp], 7890021
	mov	DWORD PTR -60[rbp], 7890021
	mov	DWORD PTR -56[rbp], 7890021
	mov	DWORD PTR -52[rbp], 7890021
	mov	DWORD PTR -48[rbp], 7890034
	mov	DWORD PTR -44[rbp], 7890034
	.loc 1 89 13
	mov	DWORD PTR -96[rbp], 6906981
	mov	DWORD PTR -92[rbp], 6906981
	mov	DWORD PTR -88[rbp], 6906981
	mov	DWORD PTR -84[rbp], 6906981
	mov	DWORD PTR -80[rbp], 6906994
	mov	DWORD PTR -76[rbp], 6906994
	.loc 1 90 20
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 90 26
	mov	eax, DWORD PTR [rax]
	.loc 1 90 44
	cmp	eax, 7
	je	.L30
	.loc 1 90 55 discriminator 1
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 90 61 discriminator 1
	mov	eax, DWORD PTR [rax]
	jmp	.L31
.L30:
	.loc 1 90 44 discriminator 2
	mov	eax, 1
.L31:
	.loc 1 90 6 discriminator 4
	mov	DWORD PTR -4[rbp], eax
	.loc 1 92 13 discriminator 4
	mov	rax, QWORD PTR -104[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 12
	ja	.L32
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L34[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L34[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L34:
	.long	.L46-.L34
	.long	.L45-.L34
	.long	.L44-.L34
	.long	.L43-.L34
	.long	.L42-.L34
	.long	.L41-.L34
	.long	.L40-.L34
	.long	.L39-.L34
	.long	.L38-.L34
	.long	.L37-.L34
	.long	.L36-.L34
	.long	.L35-.L34
	.long	.L33-.L34
	.text
.L46:
	.loc 1 94 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 94 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 94 4
	mov	rsi, rax
	lea	rdi, .LC14[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 95 4
	jmp	.L47
.L45:
	.loc 1 97 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 97 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 97 4
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 98 4
	jmp	.L47
.L44:
	.loc 1 100 50
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 100 34
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 100 4
	mov	rsi, rax
	lea	rdi, .LC16[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 101 4
	jmp	.L47
.L43:
	.loc 1 103 4
	lea	rdi, .LC17[rip]
	call	puts@PLT
	.loc 1 104 50
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 104 34
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 104 4
	mov	rsi, rax
	lea	rdi, .LC18[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 105 4
	jmp	.L47
.L42:
	.loc 1 107 4
	lea	rdi, .LC17[rip]
	call	puts@PLT
	.loc 1 108 50
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 108 34
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 108 4
	mov	rsi, rax
	lea	rdi, .LC18[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 109 49
	lea	rax, -64[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 109 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 109 4
	mov	rsi, rax
	lea	rdi, .LC19[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 110 4
	jmp	.L47
.L41:
	.loc 1 112 49
	lea	rax, -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 112 33
	lea	rax, -96[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 112 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 113 4
	lea	rdi, .LC21[rip]
	call	puts@PLT
	.loc 1 114 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 115 4
	jmp	.L47
.L40:
	.loc 1 117 49
	lea	rax, -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 117 33
	lea	rax, -96[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 117 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 118 4
	lea	rdi, .LC23[rip]
	call	puts@PLT
	.loc 1 119 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 120 4
	jmp	.L47
.L39:
	.loc 1 122 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 122 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 122 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 123 4
	lea	rdi, .LC21[rip]
	call	puts@PLT
	.loc 1 124 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 125 4
	jmp	.L47
.L38:
	.loc 1 127 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 127 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 127 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 128 4
	lea	rdi, .LC23[rip]
	call	puts@PLT
	.loc 1 129 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 130 4
	jmp	.L47
.L37:
	.loc 1 132 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 132 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 132 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 133 4
	lea	rdi, .LC24[rip]
	call	puts@PLT
	.loc 1 134 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 135 4
	jmp	.L47
.L36:
	.loc 1 137 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 137 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 137 4
	mov	rsi, rax
	lea	rdi, .LC20[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 138 4
	lea	rdi, .LC25[rip]
	call	puts@PLT
	.loc 1 139 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 140 4
	jmp	.L47
.L35:
	.loc 1 142 49
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 142 33
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 142 4
	mov	rsi, rax
	lea	rdi, .LC26[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 143 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 144 4
	jmp	.L47
.L33:
	.loc 1 146 48
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	.loc 1 146 32
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	.loc 1 146 4
	mov	rsi, rax
	lea	rdi, .LC27[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 147 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 148 4
	jmp	.L47
.L32:
	.loc 1 150 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 150 4
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC28[rip]
	mov	rdi, rax
	call	error_at@PLT
	.loc 1 152 1
	nop
.L47:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	gen_calc, .-gen_calc
	.section	.rodata
.LC29:
	.string	"\tpush %d\n"
.LC30:
	.string	"\tmov rax,[rax]"
.LC31:
	.string	"\tmovzx eax,BYTE PTR [rax]"
.LC32:
	.string	"\tmovsx eax,al"
.LC33:
	.string	"\tpush [rax]"
.LC34:
	.string	"\tmov R8B,dil"
.LC35:
	.string	"\tcmp R8B,0"
.LC36:
	.string	"\tsetne dl"
.LC37:
	.string	"\tmovzb rdi,dl"
.LC38:
	.string	"\tmov [rax],dil"
.LC39:
	.string	"\tmov [rax],edi"
.LC40:
	.string	"\tmov [rax],rdi"
.LC41:
	.string	"\tlea rax, .LC%d[rip]\n"
.LC42:
	.string	"\tpush rdi"
.LC43:
	.string	"\tcmp rax,0"
.LC44:
	.string	"\tje .Lelse%03d\n"
.LC45:
	.string	"\tjmp .LifEnd%03d\n"
.LC46:
	.string	".Lelse%03d:\n"
.LC47:
	.string	".LifEnd%03d:\n"
.LC48:
	.string	"\tpush rbp"
.LC49:
	.string	"\tmov rbp,rsp"
.LC50:
	.string	"\tand rsp,-16"
.LC51:
	.string	"\tcall %.*s\n"
.LC52:
	.string	"\tmov rsp,rbp"
.LC53:
	.string	"\tpop rbp"
	.text
	.globl	gen_expr
	.type	gen_expr, @function
gen_expr:
.LFB8:
	.loc 1 154 26
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 155 13
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	sub	eax, 13
	cmp	eax, 17
	ja	.L49
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L51[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L51[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L51:
	.long	.L66-.L51
	.long	.L65-.L51
	.long	.L64-.L51
	.long	.L63-.L51
	.long	.L63-.L51
	.long	.L62-.L51
	.long	.L61-.L51
	.long	.L60-.L51
	.long	.L59-.L51
	.long	.L58-.L51
	.long	.L57-.L51
	.long	.L56-.L51
	.long	.L55-.L51
	.long	.L54-.L51
	.long	.L53-.L51
	.long	.L52-.L51
	.long	.L49-.L51
	.long	.L50-.L51
	.text
.L53:
	.loc 1 157 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC29[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 158 4
	jmp	.L48
.L57:
	.loc 1 160 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	.loc 1 162 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 163 4
	lea	rdi, .LC30[rip]
	call	puts@PLT
	.loc 1 164 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 166 4
	jmp	.L48
.L58:
	.loc 1 168 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	.loc 1 170 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 171 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 171 17
	mov	eax, DWORD PTR [rax]
	.loc 1 171 6
	cmp	eax, 2
	ja	.L68
	.loc 1 172 5
	lea	rdi, .LC31[rip]
	call	puts@PLT
	.loc 1 173 5
	lea	rdi, .LC32[rip]
	call	puts@PLT
	jmp	.L69
.L68:
	.loc 1 175 5
	lea	rdi, .LC30[rip]
	call	puts@PLT
.L69:
	.loc 1 177 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 178 4
	jmp	.L48
.L55:
	.loc 1 180 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	.loc 1 181 4
	jmp	.L48
.L56:
	.loc 1 183 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	.loc 1 184 4
	jmp	.L48
.L62:
	.loc 1 187 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 188 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 189 4
	jmp	.L48
.L64:
	.loc 1 192 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	.loc 1 193 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 193 22
	mov	rax, QWORD PTR 16[rax]
	.loc 1 193 4
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 196 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 197 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 198 4
	lea	rdi, .LC33[rip]
	call	puts@PLT
	.loc 1 199 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 200 4
	lea	rdi, .LC30[rip]
	call	puts@PLT
	.loc 1 202 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 202 4
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_calc
	.loc 1 203 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 206 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 207 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 208 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 208 16
	mov	rax, QWORD PTR 40[rax]
	.loc 1 208 22
	mov	eax, DWORD PTR [rax]
	.loc 1 208 6
	cmp	eax, 2
	ja	.L70
	.loc 1 209 12
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 209 17
	mov	rax, QWORD PTR 40[rax]
	.loc 1 209 23
	mov	eax, DWORD PTR [rax]
	.loc 1 209 7
	cmp	eax, 1
	jne	.L71
	.loc 1 210 6
	lea	rdi, .LC34[rip]
	call	puts@PLT
	.loc 1 211 6
	lea	rdi, .LC35[rip]
	call	puts@PLT
	.loc 1 212 6
	lea	rdi, .LC36[rip]
	call	puts@PLT
	.loc 1 213 6
	lea	rdi, .LC37[rip]
	call	puts@PLT
.L71:
	.loc 1 215 5
	lea	rdi, .LC38[rip]
	call	puts@PLT
	.loc 1 224 4
	jmp	.L48
.L70:
	.loc 1 216 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 216 22
	mov	rax, QWORD PTR 40[rax]
	.loc 1 216 28
	mov	eax, DWORD PTR [rax]
	.loc 1 216 12
	cmp	eax, 3
	jne	.L73
	.loc 1 217 5
	lea	rdi, .LC39[rip]
	call	puts@PLT
	.loc 1 224 4
	jmp	.L48
.L73:
	.loc 1 219 5
	lea	rdi, .LC40[rip]
	call	puts@PLT
	.loc 1 224 4
	jmp	.L48
.L54:
	.loc 1 226 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC41[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 227 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 228 4
	jmp	.L48
.L66:
	.loc 1 230 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	.loc 1 231 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 233 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 234 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 235 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 235 16
	mov	rax, QWORD PTR 40[rax]
	.loc 1 235 22
	mov	eax, DWORD PTR [rax]
	.loc 1 235 6
	cmp	eax, 2
	ja	.L74
	.loc 1 236 5
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L75
.L74:
	.loc 1 237 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 237 22
	mov	rax, QWORD PTR 40[rax]
	.loc 1 237 28
	mov	eax, DWORD PTR [rax]
	.loc 1 237 12
	cmp	eax, 3
	jne	.L76
	.loc 1 238 5
	lea	rdi, .LC39[rip]
	call	puts@PLT
	jmp	.L75
.L76:
	.loc 1 240 5
	lea	rdi, .LC40[rip]
	call	puts@PLT
.L75:
	.loc 1 243 4
	lea	rdi, .LC42[rip]
	call	puts@PLT
	.loc 1 244 4
	jmp	.L48
.L65:
	.loc 1 247 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	.loc 1 248 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 248 4
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 251 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 252 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 253 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 254 4
	lea	rdi, .LC30[rip]
	call	puts@PLT
	.loc 1 256 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_calc
	.loc 1 257 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 260 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 261 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 262 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 262 16
	mov	rax, QWORD PTR 40[rax]
	.loc 1 262 22
	mov	eax, DWORD PTR [rax]
	.loc 1 262 6
	cmp	eax, 2
	ja	.L77
	.loc 1 263 12
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 263 17
	mov	rax, QWORD PTR 40[rax]
	.loc 1 263 23
	mov	eax, DWORD PTR [rax]
	.loc 1 263 7
	cmp	eax, 1
	jne	.L78
	.loc 1 264 6
	lea	rdi, .LC34[rip]
	call	puts@PLT
	.loc 1 265 6
	lea	rdi, .LC35[rip]
	call	puts@PLT
	.loc 1 266 6
	lea	rdi, .LC36[rip]
	call	puts@PLT
	.loc 1 267 6
	lea	rdi, .LC37[rip]
	call	puts@PLT
.L78:
	.loc 1 269 5
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L79
.L77:
	.loc 1 270 17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 270 22
	mov	rax, QWORD PTR 40[rax]
	.loc 1 270 28
	mov	eax, DWORD PTR [rax]
	.loc 1 270 12
	cmp	eax, 3
	jne	.L80
	.loc 1 271 5
	lea	rdi, .LC39[rip]
	call	puts@PLT
	jmp	.L79
.L80:
	.loc 1 273 5
	lea	rdi, .LC40[rip]
	call	puts@PLT
.L79:
	.loc 1 276 4
	lea	rdi, .LC42[rip]
	call	puts@PLT
	.loc 1 277 4
	jmp	.L48
.L63:
	.loc 1 280 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	.loc 1 282 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 282 17
	mov	eax, DWORD PTR [rax]
	.loc 1 282 6
	cmp	eax, 5
	je	.L84
	.loc 1 282 38 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 282 44 discriminator 1
	mov	eax, DWORD PTR [rax]
	.loc 1 282 31 discriminator 1
	cmp	eax, 6
	je	.L84
	.loc 1 283 5
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 284 5
	lea	rdi, .LC33[rip]
	call	puts@PLT
	.loc 1 286 4
	jmp	.L84
.L50:
	.loc 1 289 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 290 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 291 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 292 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC44[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 295 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 296 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC45[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 297 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC46[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 300 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	.loc 1 301 4
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 302 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 303 4
	jmp	.L48
.L61:
	.loc 1 305 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 306 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 307 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 308 4
	lea	rdi, .LC24[rip]
	call	puts@PLT
	.loc 1 309 4
	lea	rdi, .LC22[rip]
	call	puts@PLT
	.loc 1 310 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 311 4
	jmp	.L48
.L60:
	.loc 1 313 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_address
	.loc 1 314 4
	jmp	.L48
.L59:
	.loc 1 316 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 317 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 318 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 318 17
	mov	eax, DWORD PTR [rax]
	.loc 1 318 6
	cmp	eax, 2
	ja	.L82
	.loc 1 319 5
	lea	rdi, .LC31[rip]
	call	puts@PLT
	.loc 1 320 5
	lea	rdi, .LC32[rip]
	call	puts@PLT
	jmp	.L83
.L82:
	.loc 1 322 5
	lea	rdi, .LC30[rip]
	call	puts@PLT
.L83:
	.loc 1 324 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 325 4
	jmp	.L48
.L52:
	.loc 1 327 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_args
	.loc 1 329 4
	lea	rdi, .LC48[rip]
	call	puts@PLT
	.loc 1 330 4
	lea	rdi, .LC49[rip]
	call	puts@PLT
	.loc 1 331 4
	lea	rdi, .LC50[rip]
	call	puts@PLT
	.loc 1 333 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 335 4
	lea	rdi, .LC52[rip]
	call	puts@PLT
	.loc 1 336 4
	lea	rdi, .LC53[rip]
	call	puts@PLT
	.loc 1 338 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	.loc 1 339 4
	jmp	.L48
.L49:
	.loc 1 342 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 344 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
	.loc 1 347 4
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 348 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 351 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_calc
	.loc 1 354 4
	lea	rdi, .LC0[rip]
	call	puts@PLT
	jmp	.L48
.L84:
	.loc 1 286 4
	nop
.L48:
	.loc 1 356 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	gen_expr, .-gen_expr
	.section	.rodata
.LC54:
	.string	"\tje .LifEnd%03d\n"
.LC55:
	.string	"\tjne .LcaseBegin%03d\n"
.LC56:
	.string	"\tjmp .LcaseBegin%03d\n"
.LC57:
	.string	".LloopEnd%03d:\n"
.LC58:
	.string	".LloopBegin%03d:\n"
.LC59:
	.string	"\tje .LloopEnd%03d\n"
.LC60:
	.string	".LloopCont%03d:\n"
.LC61:
	.string	"\tjmp .LloopBegin%03d\n"
.LC62:
	.string	"\tjmp .LloopCont%03d\n"
.LC63:
	.string	"\tjmp .LloopEnd%03d\n"
.LC64:
	.string	".LcaseBegin%03d:\n"
.LC65:
	.string	"\tpush %s\n"
.LC66:
	.string	"\tret"
	.text
	.globl	gen
	.type	gen, @function
gen:
.LFB9:
	.loc 1 358 21
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	.loc 1 360 7
	mov	DWORD PTR -32[rbp], 6906994
	mov	DWORD PTR -28[rbp], 6910834
	mov	DWORD PTR -24[rbp], 7890034
	mov	DWORD PTR -20[rbp], 7889778
	mov	DWORD PTR -16[rbp], 14450
	mov	DWORD PTR -12[rbp], 14706
	.loc 1 363 13
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	sub	eax, 29
	cmp	eax, 14
	ja	.L86
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L88[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L88[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L88:
	.long	.L100-.L88
	.long	.L86-.L88
	.long	.L99-.L88
	.long	.L109-.L88
	.long	.L97-.L88
	.long	.L86-.L88
	.long	.L96-.L88
	.long	.L95-.L88
	.long	.L94-.L88
	.long	.L93-.L88
	.long	.L92-.L88
	.long	.L91-.L88
	.long	.L90-.L88
	.long	.L89-.L88
	.long	.L105-.L88
	.text
.L97:
	.loc 1 368 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 369 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 370 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC54[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 371 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 373 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 374 4
	jmp	.L85
.L96:
	.loc 1 377 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 378 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 379 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC44[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 382 12
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 382 4
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 383 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC45[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 384 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC46[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 387 12
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 387 4
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 388 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 389 4
	jmp	.L85
.L95:
	.loc 1 392 10
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
	.loc 1 393 9
	jmp	.L102
.L103:
	.loc 1 394 5
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen
	.loc 1 396 5
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 397 5
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC55[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 398 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
.L102:
	.loc 1 393 9
	cmp	QWORD PTR -8[rbp], 0
	jne	.L103
	.loc 1 402 11
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 402 6
	test	rax, rax
	je	.L104
	.loc 1 403 42
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 403 5
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC56[rip]
	mov	eax, 0
	call	printf@PLT
.L104:
	.loc 1 407 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 409 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC57[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 410 4
	jmp	.L85
.L94:
	.loc 1 413 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 416 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC58[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 417 12
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 417 4
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	.loc 1 418 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 419 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC59[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 422 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 425 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC60[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 426 12
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 426 17
	mov	rax, QWORD PTR 24[rax]
	.loc 1 426 4
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	.loc 1 429 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC61[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 430 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC57[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 431 4
	jmp	.L85
.L93:
	.loc 1 434 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC58[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 435 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 436 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 437 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC59[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 440 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 443 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC60[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 444 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC61[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 445 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC57[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 446 4
	jmp	.L85
.L92:
	.loc 1 449 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC58[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 450 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 453 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	.loc 1 454 4
	lea	rdi, .LC43[rip]
	call	puts@PLT
	.loc 1 456 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC59[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 459 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC60[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 460 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC61[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 461 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC57[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 462 4
	jmp	.L85
.L90:
	.loc 1 464 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC62[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 465 4
	jmp	.L85
.L91:
	.loc 1 467 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC63[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 468 4
	jmp	.L85
.L99:
	.loc 1 470 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	expand_block_code
	.loc 1 471 4
	jmp	.L85
.L100:
	.loc 1 473 4
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC64[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 474 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	.loc 1 475 4
	jmp	.L85
.L106:
	.loc 1 479 34
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR 48[rax]
	.loc 1 479 29
	lea	rax, -32[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	.loc 1 479 5
	mov	rsi, rax
	lea	rdi, .LC65[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 480 5
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_lvar
	.loc 1 481 5
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 482 5
	lea	rdi, .LC8[rip]
	call	puts@PLT
	.loc 1 483 5
	lea	rdi, .LC40[rip]
	call	puts@PLT
	.loc 1 484 5
	lea	rdi, .LC42[rip]
	call	puts@PLT
	.loc 1 486 5
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 487 9
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -40[rbp], rax
.L105:
	.loc 1 477 9
	cmp	QWORD PTR -40[rbp], 0
	jne	.L106
	.loc 1 490 4
	jmp	.L85
.L89:
	.loc 1 492 11
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 492 6
	test	rax, rax
	je	.L107
	.loc 1 493 5
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_expr
.L107:
	.loc 1 495 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 496 4
	lea	rdi, .LC52[rip]
	call	puts@PLT
	.loc 1 497 4
	lea	rdi, .LC53[rip]
	call	puts@PLT
	.loc 1 498 4
	lea	rdi, .LC66[rip]
	call	puts@PLT
	.loc 1 499 4
	jmp	.L85
.L86:
	.loc 1 501 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	gen_expr
	.loc 1 502 4
	lea	rdi, .LC9[rip]
	call	puts@PLT
	jmp	.L85
.L109:
	.loc 1 366 4
	nop
.L85:
	.loc 1 504 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	gen, .-gen
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "../include/cc_sakura.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xdb5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF198
	.byte	0xc
	.long	.LASF199
	.long	.LASF200
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
	.long	0x91
	.uleb128 0x8
	.long	.LASF130
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x224
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8b
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8b
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8b
	.byte	0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x23d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x243
	.byte	0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x73
	.byte	0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x249
	.byte	0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x259
	.byte	0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x7f
	.byte	0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x264
	.byte	0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x26f
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x243
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x275
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x9d
	.uleb128 0xa
	.long	.LASF201
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF41
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0x6
	.byte	0x8
	.long	0x9d
	.uleb128 0xc
	.long	0x91
	.long	0x259
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x230
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x25f
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x26a
	.uleb128 0xc
	.long	0x91
	.long	0x285
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF44
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x291
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x291
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x291
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0xb
	.byte	0xd
	.long	0x34f
	.uleb128 0x10
	.long	.LASF48
	.byte	0
	.uleb128 0x10
	.long	.LASF49
	.byte	0x1
	.uleb128 0x10
	.long	.LASF50
	.byte	0x2
	.uleb128 0x10
	.long	.LASF51
	.byte	0x3
	.uleb128 0x10
	.long	.LASF52
	.byte	0x4
	.uleb128 0x10
	.long	.LASF53
	.byte	0x5
	.uleb128 0x10
	.long	.LASF54
	.byte	0x6
	.uleb128 0x10
	.long	.LASF55
	.byte	0x7
	.uleb128 0x10
	.long	.LASF56
	.byte	0x8
	.uleb128 0x10
	.long	.LASF57
	.byte	0x9
	.uleb128 0x10
	.long	.LASF58
	.byte	0xa
	.uleb128 0x10
	.long	.LASF59
	.byte	0xb
	.uleb128 0x10
	.long	.LASF60
	.byte	0xc
	.uleb128 0x10
	.long	.LASF61
	.byte	0xd
	.uleb128 0x10
	.long	.LASF62
	.byte	0xe
	.uleb128 0x10
	.long	.LASF63
	.byte	0xf
	.uleb128 0x10
	.long	.LASF64
	.byte	0x10
	.uleb128 0x10
	.long	.LASF65
	.byte	0x11
	.uleb128 0x10
	.long	.LASF66
	.byte	0x12
	.uleb128 0x10
	.long	.LASF67
	.byte	0x13
	.uleb128 0x10
	.long	.LASF68
	.byte	0x14
	.uleb128 0x10
	.long	.LASF69
	.byte	0x15
	.uleb128 0x10
	.long	.LASF70
	.byte	0x16
	.byte	0
	.uleb128 0x2
	.long	.LASF71
	.byte	0x7
	.byte	0x23
	.byte	0x2
	.long	0x2b6
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x25
	.byte	0xd
	.long	0x478
	.uleb128 0x10
	.long	.LASF72
	.byte	0
	.uleb128 0x10
	.long	.LASF73
	.byte	0x1
	.uleb128 0x10
	.long	.LASF74
	.byte	0x2
	.uleb128 0x10
	.long	.LASF75
	.byte	0x3
	.uleb128 0x10
	.long	.LASF76
	.byte	0x4
	.uleb128 0x10
	.long	.LASF77
	.byte	0x5
	.uleb128 0x10
	.long	.LASF78
	.byte	0x6
	.uleb128 0x10
	.long	.LASF79
	.byte	0x7
	.uleb128 0x10
	.long	.LASF80
	.byte	0x8
	.uleb128 0x10
	.long	.LASF81
	.byte	0x9
	.uleb128 0x10
	.long	.LASF82
	.byte	0xa
	.uleb128 0x10
	.long	.LASF83
	.byte	0xb
	.uleb128 0x10
	.long	.LASF84
	.byte	0xc
	.uleb128 0x10
	.long	.LASF85
	.byte	0xd
	.uleb128 0x10
	.long	.LASF86
	.byte	0xe
	.uleb128 0x10
	.long	.LASF87
	.byte	0xf
	.uleb128 0x10
	.long	.LASF88
	.byte	0x10
	.uleb128 0x10
	.long	.LASF89
	.byte	0x11
	.uleb128 0x10
	.long	.LASF90
	.byte	0x12
	.uleb128 0x10
	.long	.LASF91
	.byte	0x13
	.uleb128 0x10
	.long	.LASF92
	.byte	0x14
	.uleb128 0x10
	.long	.LASF93
	.byte	0x15
	.uleb128 0x10
	.long	.LASF94
	.byte	0x16
	.uleb128 0x10
	.long	.LASF95
	.byte	0x17
	.uleb128 0x10
	.long	.LASF96
	.byte	0x18
	.uleb128 0x10
	.long	.LASF97
	.byte	0x19
	.uleb128 0x10
	.long	.LASF98
	.byte	0x1a
	.uleb128 0x10
	.long	.LASF99
	.byte	0x1b
	.uleb128 0x10
	.long	.LASF100
	.byte	0x1c
	.uleb128 0x10
	.long	.LASF101
	.byte	0x1d
	.uleb128 0x10
	.long	.LASF102
	.byte	0x1e
	.uleb128 0x10
	.long	.LASF103
	.byte	0x1f
	.uleb128 0x10
	.long	.LASF104
	.byte	0x20
	.uleb128 0x10
	.long	.LASF105
	.byte	0x21
	.uleb128 0x10
	.long	.LASF106
	.byte	0x22
	.uleb128 0x10
	.long	.LASF107
	.byte	0x23
	.uleb128 0x10
	.long	.LASF108
	.byte	0x24
	.uleb128 0x10
	.long	.LASF109
	.byte	0x25
	.uleb128 0x10
	.long	.LASF110
	.byte	0x26
	.uleb128 0x10
	.long	.LASF111
	.byte	0x27
	.uleb128 0x10
	.long	.LASF112
	.byte	0x28
	.uleb128 0x10
	.long	.LASF113
	.byte	0x29
	.uleb128 0x10
	.long	.LASF114
	.byte	0x2a
	.uleb128 0x10
	.long	.LASF115
	.byte	0x2b
	.uleb128 0x10
	.long	.LASF116
	.byte	0x2c
	.byte	0
	.uleb128 0x2
	.long	.LASF117
	.byte	0x7
	.byte	0x5e
	.byte	0x2
	.long	0x35b
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x60
	.byte	0xd
	.long	0x4c3
	.uleb128 0x10
	.long	.LASF118
	.byte	0
	.uleb128 0x10
	.long	.LASF119
	.byte	0x1
	.uleb128 0x10
	.long	.LASF120
	.byte	0x2
	.uleb128 0x11
	.string	"INT"
	.byte	0x3
	.uleb128 0x11
	.string	"PTR"
	.byte	0x4
	.uleb128 0x10
	.long	.LASF121
	.byte	0x5
	.uleb128 0x10
	.long	.LASF122
	.byte	0x6
	.uleb128 0x10
	.long	.LASF123
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF124
	.byte	0x7
	.byte	0x69
	.byte	0x2
	.long	0x484
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x72
	.byte	0xd
	.long	0x4f0
	.uleb128 0x10
	.long	.LASF125
	.byte	0
	.uleb128 0x10
	.long	.LASF126
	.byte	0x1
	.uleb128 0x10
	.long	.LASF127
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF128
	.byte	0x7
	.byte	0x76
	.byte	0x2
	.long	0x4cf
	.uleb128 0x2
	.long	.LASF129
	.byte	0x7
	.byte	0x78
	.byte	0x17
	.long	0x508
	.uleb128 0x8
	.long	.LASF129
	.byte	0x28
	.byte	0x7
	.byte	0x86
	.byte	0x8
	.long	0x557
	.uleb128 0x9
	.long	.LASF131
	.byte	0x7
	.byte	0x87
	.byte	0xc
	.long	0x34f
	.byte	0
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0x88
	.byte	0x9
	.long	0x9b5
	.byte	0x8
	.uleb128 0x12
	.string	"val"
	.byte	0x7
	.byte	0x89
	.byte	0x6
	.long	0x65
	.byte	0x10
	.uleb128 0x12
	.string	"str"
	.byte	0x7
	.byte	0x8a
	.byte	0x8
	.long	0x8b
	.byte	0x18
	.uleb128 0x12
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
	.long	0x563
	.uleb128 0x8
	.long	.LASF133
	.byte	0x48
	.byte	0x7
	.byte	0xa6
	.byte	0x8
	.long	0x5e6
	.uleb128 0x9
	.long	.LASF131
	.byte	0x7
	.byte	0xa7
	.byte	0xb
	.long	0x478
	.byte	0
	.uleb128 0x12
	.string	"lhs"
	.byte	0x7
	.byte	0xa8
	.byte	0x8
	.long	0x9c7
	.byte	0x8
	.uleb128 0x12
	.string	"rhs"
	.byte	0x7
	.byte	0xa9
	.byte	0x8
	.long	0x9c7
	.byte	0x10
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xaa
	.byte	0x8
	.long	0x9c7
	.byte	0x18
	.uleb128 0x9
	.long	.LASF134
	.byte	0x7
	.byte	0xab
	.byte	0x8
	.long	0x9c7
	.byte	0x20
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xac
	.byte	0x8
	.long	0x9bb
	.byte	0x28
	.uleb128 0x12
	.string	"val"
	.byte	0x7
	.byte	0xad
	.byte	0x7
	.long	0x65
	.byte	0x30
	.uleb128 0x12
	.string	"str"
	.byte	0x7
	.byte	0xae
	.byte	0x8
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
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
	.long	0x5f2
	.uleb128 0x8
	.long	.LASF137
	.byte	0x20
	.byte	0x7
	.byte	0xd0
	.byte	0x8
	.long	0x641
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xd1
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF136
	.byte	0x7
	.byte	0xd2
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xd3
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xd4
	.byte	0x8
	.long	0x9bb
	.byte	0x10
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xd5
	.byte	0x8
	.long	0x9f0
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF139
	.byte	0x7
	.byte	0x7b
	.byte	0x17
	.long	0x64d
	.uleb128 0x8
	.long	.LASF139
	.byte	0x28
	.byte	0x7
	.byte	0xc6
	.byte	0x8
	.long	0x6a9
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xc7
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF140
	.byte	0x7
	.byte	0xc8
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xc9
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xca
	.byte	0x8
	.long	0x9bb
	.byte	0x10
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xcb
	.byte	0x8
	.long	0x9ea
	.byte	0x18
	.uleb128 0x9
	.long	.LASF141
	.byte	0x7
	.byte	0xcc
	.byte	0x8
	.long	0x9c7
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF142
	.byte	0x7
	.byte	0x7c
	.byte	0x17
	.long	0x6b5
	.uleb128 0x8
	.long	.LASF142
	.byte	0x20
	.byte	0x7
	.byte	0xe1
	.byte	0x8
	.long	0x704
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xe2
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF140
	.byte	0x7
	.byte	0xe3
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xe4
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF143
	.byte	0x7
	.byte	0xe5
	.byte	0xa
	.long	0x9fc
	.byte	0x10
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xe6
	.byte	0xa
	.long	0xa02
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF144
	.byte	0x7
	.byte	0x7d
	.byte	0x17
	.long	0x710
	.uleb128 0x8
	.long	.LASF144
	.byte	0x20
	.byte	0x7
	.byte	0xea
	.byte	0x8
	.long	0x752
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xeb
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xec
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF143
	.byte	0x7
	.byte	0xed
	.byte	0xa
	.long	0x9fc
	.byte	0x10
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xee
	.byte	0xa
	.long	0xa08
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF145
	.byte	0x7
	.byte	0x7e
	.byte	0x17
	.long	0x75e
	.uleb128 0x8
	.long	.LASF145
	.byte	0x28
	.byte	0x7
	.byte	0xf2
	.byte	0x8
	.long	0x7ba
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xf3
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF136
	.byte	0x7
	.byte	0xf4
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF140
	.byte	0x7
	.byte	0xf5
	.byte	0x9
	.long	0x65
	.byte	0x8
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xf6
	.byte	0xa
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xf7
	.byte	0xa
	.long	0x9bb
	.byte	0x18
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xf8
	.byte	0xa
	.long	0x9fc
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF146
	.byte	0x7
	.byte	0x7f
	.byte	0x17
	.long	0x7c6
	.uleb128 0x13
	.long	.LASF146
	.value	0x988
	.byte	0x7
	.byte	0xb3
	.byte	0x8
	.long	0x824
	.uleb128 0x9
	.long	.LASF147
	.byte	0x7
	.byte	0xb5
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0xb6
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xb7
	.byte	0x8
	.long	0x9bb
	.byte	0x10
	.uleb128 0x9
	.long	.LASF148
	.byte	0x7
	.byte	0xb8
	.byte	0x8
	.long	0x9c7
	.byte	0x18
	.uleb128 0x9
	.long	.LASF149
	.byte	0x7
	.byte	0xb9
	.byte	0x8
	.long	0x9cd
	.byte	0x20
	.uleb128 0x14
	.long	.LASF132
	.byte	0x7
	.byte	0xba
	.byte	0x8
	.long	0x9de
	.value	0x980
	.byte	0
	.uleb128 0x2
	.long	.LASF150
	.byte	0x7
	.byte	0x80
	.byte	0x17
	.long	0x830
	.uleb128 0x8
	.long	.LASF150
	.byte	0x20
	.byte	0x7
	.byte	0xd9
	.byte	0x8
	.long	0x871
	.uleb128 0x12
	.string	"id"
	.byte	0x7
	.byte	0xda
	.byte	0xc
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF151
	.byte	0x7
	.byte	0xdb
	.byte	0xd
	.long	0x9c7
	.byte	0x8
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xdc
	.byte	0xd
	.long	0x9f6
	.byte	0x10
	.uleb128 0x9
	.long	.LASF131
	.byte	0x7
	.byte	0xdd
	.byte	0xc
	.long	0x4f0
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.string	"Str"
	.byte	0x7
	.byte	0x81
	.byte	0x17
	.long	0x87d
	.uleb128 0x16
	.string	"Str"
	.byte	0x18
	.byte	0x7
	.byte	0xbe
	.byte	0x8
	.long	0x8bf
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0xbf
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF152
	.byte	0x7
	.byte	0xc0
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x12
	.string	"str"
	.byte	0x7
	.byte	0xc1
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xc2
	.byte	0x7
	.long	0x9e4
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.long	.LASF153
	.byte	0x7
	.byte	0x82
	.byte	0x17
	.long	0x8cb
	.uleb128 0x8
	.long	.LASF153
	.byte	0x30
	.byte	0x7
	.byte	0x8f
	.byte	0x8
	.long	0x94d
	.uleb128 0x12
	.string	"ty"
	.byte	0x7
	.byte	0x90
	.byte	0xb
	.long	0x4c3
	.byte	0
	.uleb128 0x9
	.long	.LASF154
	.byte	0x7
	.byte	0x91
	.byte	0x9
	.long	0x9bb
	.byte	0x8
	.uleb128 0x9
	.long	.LASF155
	.byte	0x7
	.byte	0x92
	.byte	0x7
	.long	0x65
	.byte	0x10
	.uleb128 0x9
	.long	.LASF156
	.byte	0x7
	.byte	0x93
	.byte	0x7
	.long	0x65
	.byte	0x14
	.uleb128 0x9
	.long	.LASF157
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x9
	.long	.LASF158
	.byte	0x7
	.byte	0x95
	.byte	0xb
	.long	0x65
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF159
	.byte	0x7
	.byte	0x96
	.byte	0xb
	.long	0x65
	.byte	0x20
	.uleb128 0x12
	.string	"len"
	.byte	0x7
	.byte	0x97
	.byte	0xb
	.long	0x65
	.byte	0x24
	.uleb128 0x9
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
	.long	0x959
	.uleb128 0x8
	.long	.LASF160
	.byte	0x30
	.byte	0x7
	.byte	0x9c
	.byte	0x8
	.long	0x9b5
	.uleb128 0x9
	.long	.LASF138
	.byte	0x7
	.byte	0x9d
	.byte	0xc
	.long	0x8b
	.byte	0
	.uleb128 0x9
	.long	.LASF161
	.byte	0x7
	.byte	0x9e
	.byte	0xb
	.long	0x65
	.byte	0x8
	.uleb128 0x12
	.string	"tag"
	.byte	0x7
	.byte	0x9f
	.byte	0xc
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF162
	.byte	0x7
	.byte	0xa0
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x9
	.long	.LASF135
	.byte	0x7
	.byte	0xa1
	.byte	0xc
	.long	0x9bb
	.byte	0x20
	.uleb128 0x9
	.long	.LASF132
	.byte	0x7
	.byte	0xa2
	.byte	0xc
	.long	0x9c1
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4fc
	.uleb128 0x6
	.byte	0x8
	.long	0x8bf
	.uleb128 0x6
	.byte	0x8
	.long	0x94d
	.uleb128 0x6
	.byte	0x8
	.long	0x557
	.uleb128 0xc
	.long	0x9c7
	.long	0x9de
	.uleb128 0x17
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7ba
	.uleb128 0x6
	.byte	0x8
	.long	0x871
	.uleb128 0x6
	.byte	0x8
	.long	0x641
	.uleb128 0x6
	.byte	0x8
	.long	0x5e6
	.uleb128 0x6
	.byte	0x8
	.long	0x824
	.uleb128 0x6
	.byte	0x8
	.long	0x752
	.uleb128 0x6
	.byte	0x8
	.long	0x6a9
	.uleb128 0x6
	.byte	0x8
	.long	0x704
	.uleb128 0xe
	.long	.LASF163
	.byte	0x7
	.byte	0xfe
	.byte	0x11
	.long	0x65
	.uleb128 0xe
	.long	.LASF164
	.byte	0x7
	.byte	0xff
	.byte	0x11
	.long	0x65
	.uleb128 0x18
	.long	.LASF165
	.byte	0x7
	.value	0x100
	.byte	0x12
	.long	0x8b
	.uleb128 0xc
	.long	0x91
	.long	0xa43
	.uleb128 0xd
	.long	0x39
	.byte	0x63
	.byte	0
	.uleb128 0x18
	.long	.LASF166
	.byte	0x7
	.value	0x101
	.byte	0x11
	.long	0xa33
	.uleb128 0x18
	.long	.LASF167
	.byte	0x7
	.value	0x102
	.byte	0x12
	.long	0x9b5
	.uleb128 0xc
	.long	0x9de
	.long	0xa6e
	.uleb128 0x17
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x18
	.long	.LASF168
	.byte	0x7
	.value	0x103
	.byte	0x12
	.long	0xa5d
	.uleb128 0x18
	.long	.LASF169
	.byte	0x7
	.value	0x104
	.byte	0x12
	.long	0x9f0
	.uleb128 0x18
	.long	.LASF170
	.byte	0x7
	.value	0x105
	.byte	0x12
	.long	0x9ea
	.uleb128 0x18
	.long	.LASF171
	.byte	0x7
	.value	0x106
	.byte	0x12
	.long	0x9e4
	.uleb128 0x18
	.long	.LASF172
	.byte	0x7
	.value	0x107
	.byte	0x12
	.long	0xa02
	.uleb128 0x18
	.long	.LASF173
	.byte	0x7
	.value	0x108
	.byte	0x12
	.long	0xa08
	.uleb128 0x18
	.long	.LASF174
	.byte	0x7
	.value	0x109
	.byte	0x12
	.long	0x9c1
	.uleb128 0x18
	.long	.LASF175
	.byte	0x7
	.value	0x10a
	.byte	0x12
	.long	0x9f6
	.uleb128 0x18
	.long	.LASF176
	.byte	0x7
	.value	0x10b
	.byte	0x12
	.long	0x9f6
	.uleb128 0x18
	.long	.LASF177
	.byte	0x7
	.value	0x10c
	.byte	0x12
	.long	0x9f0
	.uleb128 0x18
	.long	.LASF178
	.byte	0x7
	.value	0x10d
	.byte	0x12
	.long	0xa02
	.uleb128 0x18
	.long	.LASF179
	.byte	0x7
	.value	0x10e
	.byte	0x12
	.long	0xa08
	.uleb128 0x18
	.long	.LASF180
	.byte	0x7
	.value	0x10f
	.byte	0x12
	.long	0x9c1
	.uleb128 0x18
	.long	.LASF152
	.byte	0x7
	.value	0x16b
	.byte	0xc
	.long	0x65
	.uleb128 0x18
	.long	.LASF181
	.byte	0x7
	.value	0x16c
	.byte	0xc
	.long	0x65
	.uleb128 0x19
	.string	"gen"
	.byte	0x1
	.value	0x166
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xb81
	.uleb128 0x1a
	.long	.LASF184
	.byte	0x1
	.value	0x166
	.byte	0x10
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.long	.LASF182
	.byte	0x1
	.value	0x167
	.byte	0x8
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.string	"reg"
	.byte	0x1
	.value	0x168
	.byte	0x7
	.long	0xb81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0xc
	.long	0x91
	.long	0xb97
	.uleb128 0xd
	.long	0x39
	.byte	0x5
	.uleb128 0xd
	.long	0x39
	.byte	0x3
	.byte	0
	.uleb128 0x1d
	.long	.LASF183
	.byte	0x1
	.byte	0x9a
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xbc5
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x9a
	.byte	0x15
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF185
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xc32
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x55
	.byte	0x15
	.long	0x9c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1f
	.long	.LASF186
	.byte	0x1
	.byte	0x57
	.byte	0xd
	.long	0xc48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF187
	.byte	0x1
	.byte	0x58
	.byte	0xd
	.long	0xc48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.long	.LASF188
	.byte	0x1
	.byte	0x59
	.byte	0xd
	.long	0xc48
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1f
	.long	.LASF189
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.long	0x98
	.long	0xc48
	.uleb128 0xd
	.long	0x39
	.byte	0x5
	.uleb128 0xd
	.long	0x39
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0xc32
	.uleb128 0x1d
	.long	.LASF190
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xc7b
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x4a
	.byte	0x18
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF191
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xcd6
	.uleb128 0x1e
	.long	.LASF148
	.byte	0x1
	.byte	0x36
	.byte	0x15
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF192
	.byte	0x1
	.byte	0x37
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.long	.LASF193
	.byte	0x1
	.byte	0x38
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.string	"reg"
	.byte	0x1
	.byte	0x39
	.byte	0xd
	.long	0xc48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1d
	.long	.LASF194
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xd04
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x28
	.byte	0x16
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF195
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0xd32
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x1e
	.byte	0x15
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF196
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xd60
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x14
	.byte	0x15
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF197
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xd8e
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0xb
	.byte	0x1e
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	.LASF202
	.byte	0x1
	.byte	0x3
	.byte	0x6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.long	.LASF184
	.byte	0x1
	.byte	0x3
	.byte	0x18
	.long	0x9c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
.LASF185:
	.string	"gen_calc"
.LASF12:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_chain"
.LASF122:
	.string	"STRUCT"
.LASF200:
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
.LASF199:
	.string	"../src/codegen.c"
.LASF132:
	.string	"next"
.LASF33:
	.string	"_codecvt"
.LASF202:
	.string	"expand_next"
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
.LASF104:
	.string	"ND_NULL_STMT"
.LASF193:
	.string	"arg_count"
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
.LASF189:
	.string	"reg_ty"
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
.LASF187:
	.string	"reg_dx"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
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
.LASF84:
	.string	"ND_OR"
.LASF16:
	.string	"_IO_write_ptr"
.LASF99:
	.string	"ND_NUM"
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
.LASF194:
	.string	"gen_struc"
.LASF97:
	.string	"ND_GARRAY"
.LASF184:
	.string	"node"
.LASF162:
	.string	"tag_len"
.LASF171:
	.string	"strings"
.LASF31:
	.string	"_lock"
.LASF73:
	.string	"ND_SUB"
.LASF26:
	.string	"_flags2"
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
.LASF196:
	.string	"gen_gvar"
.LASF50:
	.string	"TK_IDENT"
.LASF64:
	.string	"TK_CONTINUE"
.LASF163:
	.string	"llid"
.LASF89:
	.string	"ND_ARROW"
.LASF177:
	.string	"outside_lvar"
.LASF191:
	.string	"gen_args"
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
.LASF201:
	.string	"_IO_lock_t"
.LASF183:
	.string	"gen_expr"
.LASF130:
	.string	"_IO_FILE"
.LASF90:
	.string	"ND_PREID"
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
.LASF192:
	.string	"reg_num"
.LASF144:
	.string	"Enum"
.LASF167:
	.string	"token"
.LASF153:
	.string	"Type"
.LASF23:
	.string	"_markers"
.LASF126:
	.string	"LB_CASE"
.LASF94:
	.string	"ND_LVAR"
.LASF98:
	.string	"ND_STR"
.LASF2:
	.string	"unsigned char"
.LASF75:
	.string	"ND_DIV"
.LASF107:
	.string	"ND_IFELSE"
.LASF5:
	.string	"short int"
.LASF43:
	.string	"_IO_wide_data"
.LASF102:
	.string	"ND_TERNARY"
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
.LASF182:
	.string	"cases"
.LASF66:
	.string	"TK_EXTERN"
.LASF67:
	.string	"TK_RETURN"
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
.LASF59:
	.string	"TK_FOR"
.LASF87:
	.string	"ND_POSTID"
.LASF83:
	.string	"ND_AND"
.LASF140:
	.string	"memsize"
.LASF190:
	.string	"gen_address"
.LASF198:
	.string	"GNU C11 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c11 -fasynchronous-unwind-tables"
.LASF108:
	.string	"ND_SWITCH"
.LASF68:
	.string	"TK_THREAD_LOCAL"
.LASF195:
	.string	"gen_lvar"
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
.LASF186:
	.string	"reg_ax"
.LASF70:
	.string	"TK_EOF"
.LASF61:
	.string	"TK_BLOCK"
.LASF188:
	.string	"reg_di"
.LASF156:
	.string	"align"
.LASF143:
	.string	"member"
.LASF35:
	.string	"_freeres_list"
.LASF80:
	.string	"ND_LE"
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
.LASF197:
	.string	"expand_block_code"
.LASF111:
	.string	"ND_DOWHILE"
.LASF48:
	.string	"TK_TYPE"
.LASF154:
	.string	"ptr_to"
.LASF118:
	.string	"VOID"
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
