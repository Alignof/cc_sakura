	.file	"codegen.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"\tpop rax"
.LC1:
	.string	"\tpush rax"
	.text
	.globl	expand_next
	.type	expand_next, @function
expand_next:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
.L2:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L3
	lea	rdi, .LC1[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	expand_next, .-expand_next
	.globl	expand_block_code
	.type	expand_block_code, @function
expand_block_code:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -8[rbp], rax
.L5:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L6
	lea	rdi, .LC1[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	expand_block_code, .-expand_block_code
	.section	.rodata
.LC2:
	.string	"\tlea rax,  %.*s[rip]\n"
	.text
	.globl	gen_gvar
	.type	gen_gvar, @function
gen_gvar:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	gen_gvar, .-gen_gvar
	.section	.rodata
.LC3:
	.string	"not a variable"
.LC4:
	.string	"\tmov rax,rbp"
.LC5:
	.string	"\tsub rax,%d\n"
	.text
	.globl	gen_lvar
	.type	gen_lvar, @function
gen_lvar:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 22
	je	.L9
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 24
	je	.L9
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 39
	je	.L9
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	error_at@PLT
.L9:
	lea	rdi, .LC4[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 64[rax]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	gen_lvar, .-gen_lvar
	.section	.rodata
.LC6:
	.string	"not a struct"
.LC7:
	.string	"\tpop rdi"
.LC8:
	.string	"\tadd rax,rdi"
	.text
	.globl	gen_struc
	.type	gen_struc, @function
gen_struc:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 16
	je	.L11
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 17
	je	.L11
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	error_at@PLT
.L11:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC8[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	gen_struc, .-gen_struc
	.section	.rodata
.LC9:
	.string	"\tmov %s,rax\n"
	.text
	.globl	gen_arg
	.type	gen_arg, @function
gen_arg:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -32[rbp], 6906994
	mov	DWORD PTR -28[rbp], 6910834
	mov	DWORD PTR -24[rbp], 7890034
	mov	DWORD PTR -20[rbp], 7889778
	mov	DWORD PTR -16[rbp], 14450
	mov	DWORD PTR -12[rbp], 14706
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	gen_arg, .-gen_arg
	.section	.rodata
.LC10:
	.string	"can not assign"
	.text
	.globl	gen_address
	.type	gen_address, @function
gen_address:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 21
	jne	.L15
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	jmp	.L23
.L15:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 16
	jne	.L17
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	jmp	.L23
.L17:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 17
	jne	.L18
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	jmp	.L23
.L18:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 23
	jne	.L19
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	jmp	.L23
.L19:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 25
	jne	.L20
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	jmp	.L23
.L20:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 22
	jne	.L21
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	jmp	.L23
.L21:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 24
	jne	.L22
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	jmp	.L23
.L22:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	error_at@PLT
.L23:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	gen_address, .-gen_address
	.section	.rodata
.LC11:
	.string	"\tadd %s,%s\n"
.LC12:
	.string	"\tsub %s,%s\n"
.LC13:
	.string	"\timul %s,%s\n"
.LC14:
	.string	"\tcqo"
.LC15:
	.string	"\tidiv %s,%s\n"
.LC16:
	.string	"\tmov %s,%s\n"
.LC17:
	.string	"\tcmp %s,%s\n"
.LC18:
	.string	"\tsetl al"
.LC19:
	.string	"\tmovzb rax,al"
.LC20:
	.string	"\tsetle al"
.LC21:
	.string	"\tsete al"
.LC22:
	.string	"\tsetne al"
.LC23:
	.string	"\tand %s,%s\n"
.LC24:
	.string	"\tor %s,%s\n"
	.text
	.globl	gen_calc
	.type	gen_calc, @function
gen_calc:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	QWORD PTR -120[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -96[rbp], 7889253
	mov	DWORD PTR -92[rbp], 7889253
	mov	DWORD PTR -88[rbp], 7889253
	mov	DWORD PTR -84[rbp], 7889253
	mov	DWORD PTR -80[rbp], 7889266
	mov	DWORD PTR -76[rbp], 7889266
	mov	DWORD PTR -64[rbp], 7890021
	mov	DWORD PTR -60[rbp], 7890021
	mov	DWORD PTR -56[rbp], 7890021
	mov	DWORD PTR -52[rbp], 7890021
	mov	DWORD PTR -48[rbp], 7890034
	mov	DWORD PTR -44[rbp], 7890034
	mov	DWORD PTR -32[rbp], 6906981
	mov	DWORD PTR -28[rbp], 6906981
	mov	DWORD PTR -24[rbp], 6906981
	mov	DWORD PTR -20[rbp], 6906981
	mov	DWORD PTR -16[rbp], 6906994
	mov	DWORD PTR -12[rbp], 6906994
	mov	rax, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	je	.L25
	mov	rax, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	jmp	.L26
.L25:
	mov	eax, 1
.L26:
	mov	DWORD PTR -100[rbp], eax
	mov	rax, QWORD PTR -120[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 12
	ja	.L43
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L29[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L29[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L29:
	.long	.L41-.L29
	.long	.L40-.L29
	.long	.L39-.L29
	.long	.L38-.L29
	.long	.L37-.L29
	.long	.L36-.L29
	.long	.L35-.L29
	.long	.L34-.L29
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.text
.L41:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L27
.L40:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L27
.L39:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC13[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L27
.L38:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L27
.L37:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdx, -64[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC16[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L27
.L36:
	lea	rdx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L35:
	lea	rdx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC20[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L34:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L33:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC20[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L32:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC21[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L31:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC22[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L30:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC23[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L27
.L28:
	lea	rdx, -32[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	lea	rcx, -96[rbp]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	sal	rax, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC24[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	nop
.L27:
.L43:
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	gen_calc, .-gen_calc
	.section	.rodata
.LC25:
	.string	"\tpush %d\n"
.LC26:
	.string	"\tmov rax,[rax]"
.LC27:
	.string	"\tmovzx eax,BYTE PTR [rax]"
.LC28:
	.string	"\tmovsx eax,al"
.LC29:
	.string	"\tpush [rax]"
.LC30:
	.string	"\tmov R8B,dil"
.LC31:
	.string	"\tcmp R8B,0"
.LC32:
	.string	"\tsetne dl"
.LC33:
	.string	"\tmovzb rdi,dl"
.LC34:
	.string	"\tmov [rax],dil"
.LC35:
	.string	"\tmov [rax],edi"
.LC36:
	.string	"\tmov [rax],rdi"
.LC37:
	.string	"\tlea rax, .LC%d[rip]\n"
.LC38:
	.string	"\tpush rdi"
.LC39:
	.string	"\tcmp rax,0"
.LC40:
	.string	"\tje .Lelse%03d\n"
.LC41:
	.string	"\tjmp .LifEnd%03d\n"
.LC42:
	.string	".Lelse%03d:\n"
.LC43:
	.string	".LifEnd%03d:\n"
.LC44:
	.string	"\tje .LifEnd%03d\n"
.LC45:
	.string	"\tjne .LcaseBegin%03d\n"
.LC46:
	.string	"\tjmp .LcaseBegin%03d\n"
.LC47:
	.string	".LloopEnd%03d:\n"
.LC48:
	.string	".LcaseBegin%03d:\n"
.LC49:
	.string	".LloopBegin%03d:\n"
.LC50:
	.string	"\tje .LloopEnd%03d\n"
.LC51:
	.string	".LloopCont%03d:\n"
.LC52:
	.string	"\tjmp .LloopBegin%03d\n"
.LC53:
	.string	"\tjmp .LloopCont%03d\n"
.LC54:
	.string	"\tjmp .LloopEnd%03d\n"
.LC55:
	.string	"\tpush rbp"
.LC56:
	.string	"\tmov rbp,rsp"
.LC57:
	.string	"\tand rsp,-16"
.LC58:
	.string	"\tcall %.*s\n"
.LC59:
	.string	"\tmov rsp,rbp"
.LC60:
	.string	"\tpop rbp"
.LC61:
	.string	"\tpush %s\n"
.LC62:
	.string	"\tret"
	.text
	.globl	gen
	.type	gen, @function
gen:
.LFB14:
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
	mov	DWORD PTR -60[rbp], 0
	mov	eax, DWORD PTR label_if_num[rip]
	mov	DWORD PTR -56[rbp], eax
	mov	eax, DWORD PTR label_loop_num[rip]
	mov	DWORD PTR -52[rbp], eax
	mov	DWORD PTR -32[rbp], 6906994
	mov	DWORD PTR -28[rbp], 6910834
	mov	DWORD PTR -24[rbp], 7890034
	mov	DWORD PTR -20[rbp], 7889778
	mov	DWORD PTR -16[rbp], 14450
	mov	DWORD PTR -12[rbp], 14706
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	sub	eax, 13
	cmp	eax, 31
	ja	.L45
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L47[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L47[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L47:
	.long	.L75-.L47
	.long	.L74-.L47
	.long	.L73-.L47
	.long	.L72-.L47
	.long	.L72-.L47
	.long	.L71-.L47
	.long	.L70-.L47
	.long	.L69-.L47
	.long	.L68-.L47
	.long	.L67-.L47
	.long	.L66-.L47
	.long	.L65-.L47
	.long	.L64-.L47
	.long	.L63-.L47
	.long	.L62-.L47
	.long	.L61-.L47
	.long	.L60-.L47
	.long	.L45-.L47
	.long	.L59-.L47
	.long	.L58-.L47
	.long	.L57-.L47
	.long	.L56-.L47
	.long	.L55-.L47
	.long	.L54-.L47
	.long	.L53-.L47
	.long	.L101-.L47
	.long	.L51-.L47
	.long	.L50-.L47
	.long	.L49-.L47
	.long	.L48-.L47
	.long	.L45-.L47
	.long	.L108-.L47
	.text
.L62:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC25[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L66:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_gvar
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC26[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L67:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_lvar
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L77
	lea	rdi, .LC27[rip]
	call	puts@PLT
	lea	rdi, .LC28[rip]
	call	puts@PLT
	jmp	.L78
.L77:
	lea	rdi, .LC26[rip]
	call	puts@PLT
.L78:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L109
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	gen
	jmp	.L109
.L64:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_gvar
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L110
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next
	jmp	.L110
.L65:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_lvar
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L111
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next
	jmp	.L111
.L71:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	jmp	.L44
.L73:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC29[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, .LC26[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_calc
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L82
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L83
	lea	rdi, .LC30[rip]
	call	puts@PLT
	lea	rdi, .LC31[rip]
	call	puts@PLT
	lea	rdi, .LC32[rip]
	call	puts@PLT
	lea	rdi, .LC33[rip]
	call	puts@PLT
.L83:
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L44
.L82:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L85
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L44
.L85:
	lea	rdi, .LC36[rip]
	call	puts@PLT
	jmp	.L44
.L63:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC37[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L75:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L86
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L87
.L86:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L88
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L87
.L88:
	lea	rdi, .LC36[rip]
	call	puts@PLT
.L87:
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L44
.L74:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen_address
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, .LC26[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_calc
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L89
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L90
	lea	rdi, .LC30[rip]
	call	puts@PLT
	lea	rdi, .LC31[rip]
	call	puts@PLT
	lea	rdi, .LC32[rip]
	call	puts@PLT
	lea	rdi, .LC33[rip]
	call	puts@PLT
.L90:
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L91
.L89:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L92
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L91
.L92:
	lea	rdi, .LC36[rip]
	call	puts@PLT
.L91:
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L44
.L72:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_struc
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	je	.L112
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 6
	je	.L112
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC29[rip]
	call	puts@PLT
	jmp	.L112
.L61:
	mov	eax, DWORD PTR label_if_num[rip]
	add	eax, 1
	mov	DWORD PTR label_if_num[rip], eax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC40[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC41[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC42[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L60:
	mov	eax, DWORD PTR label_if_num[rip]
	add	eax, 1
	mov	DWORD PTR label_if_num[rip], eax
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC44[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L59:
	mov	eax, DWORD PTR label_if_num[rip]
	add	eax, 1
	mov	DWORD PTR label_if_num[rip], eax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC40[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC41[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC42[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L58:
	mov	eax, DWORD PTR label_if_num[rip]
	add	eax, 1
	mov	DWORD PTR label_if_num[rip], eax
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -40[rbp], rax
	jmp	.L94
.L95:
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC45[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -40[rbp], rax
.L94:
	cmp	QWORD PTR -40[rbp], 0
	jne	.L95
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L96
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC46[rip]
	mov	eax, 0
	call	printf@PLT
.L96:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L57:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC48[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	jmp	.L44
.L54:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC49[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 44
	je	.L97
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
.L97:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 44
	je	.L98
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
.L98:
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L56:
	mov	eax, DWORD PTR label_loop_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_loop_num[rip], edx
	mov	DWORD PTR -52[rbp], eax
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC49[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L55:
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC49[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L48:
	mov	eax, DWORD PTR -52[rbp]
	sub	eax, 1
	mov	esi, eax
	lea	rdi, .LC53[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L49:
	mov	eax, DWORD PTR -52[rbp]
	sub	eax, 1
	mov	esi, eax
	lea	rdi, .LC54[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L44
.L53:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_block_code
	jmp	.L44
.L51:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -60[rbp], 0
	jmp	.L99
.L100:
	mov	rdx, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -60[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	gen_arg
	add	DWORD PTR -60[rbp], 1
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -48[rbp], rax
.L99:
	cmp	QWORD PTR -48[rbp], 0
	jne	.L100
	lea	rdi, .LC55[rip]
	call	puts@PLT
	lea	rdi, .LC56[rip]
	call	puts@PLT
	lea	rdi, .LC57[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC58[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC59[rip]
	call	puts@PLT
	lea	rdi, .LC60[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L102:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	lea	rdx, -32[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC61[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_lvar
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC36[rip]
	call	puts@PLT
	lea	rdi, .LC38[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -72[rbp], rax
.L101:
	cmp	QWORD PTR -72[rbp], 0
	jne	.L102
	jmp	.L44
.L70:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	lea	rdi, .LC21[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L69:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_address
	jmp	.L44
.L68:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L103
	lea	rdi, .LC27[rip]
	call	puts@PLT
	lea	rdi, .LC28[rip]
	call	puts@PLT
	jmp	.L104
.L103:
	lea	rdi, .LC26[rip]
	call	puts@PLT
.L104:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L50:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	je	.L105
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
.L105:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC59[rip]
	call	puts@PLT
	lea	rdi, .LC60[rip]
	call	puts@PLT
	lea	rdi, .LC62[rip]
	call	puts@PLT
	jmp	.L44
.L45:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_calc
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L44
.L108:
	nop
	jmp	.L44
.L109:
	nop
	jmp	.L44
.L110:
	nop
	jmp	.L44
.L111:
	nop
	jmp	.L44
.L112:
	nop
.L44:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L107
	call	__stack_chk_fail@PLT
.L107:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	gen, .-gen
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
