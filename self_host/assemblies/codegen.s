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
	lea	rax, -32[rbp]
	mov	edx, DWORD PTR -36[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	nop
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
	jne	.L14
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	jmp	.L22
.L14:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 16
	jne	.L16
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	jmp	.L22
.L16:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 17
	jne	.L17
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_struc
	jmp	.L22
.L17:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 23
	jne	.L18
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	jmp	.L22
.L18:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 25
	jne	.L19
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_gvar
	jmp	.L22
.L19:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 22
	jne	.L20
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	jmp	.L22
.L20:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 24
	jne	.L21
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	gen_lvar
	jmp	.L22
.L21:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	error_at@PLT
.L22:
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
	sub	rsp, 112
	mov	QWORD PTR -104[rbp], rdi
	mov	DWORD PTR -32[rbp], 7889253
	mov	DWORD PTR -28[rbp], 7889253
	mov	DWORD PTR -24[rbp], 7889253
	mov	DWORD PTR -20[rbp], 7889253
	mov	DWORD PTR -16[rbp], 7889266
	mov	DWORD PTR -12[rbp], 7889266
	mov	DWORD PTR -64[rbp], 7890021
	mov	DWORD PTR -60[rbp], 7890021
	mov	DWORD PTR -56[rbp], 7890021
	mov	DWORD PTR -52[rbp], 7890021
	mov	DWORD PTR -48[rbp], 7890034
	mov	DWORD PTR -44[rbp], 7890034
	mov	DWORD PTR -96[rbp], 6906981
	mov	DWORD PTR -92[rbp], 6906981
	mov	DWORD PTR -88[rbp], 6906981
	mov	DWORD PTR -84[rbp], 6906981
	mov	DWORD PTR -80[rbp], 6906994
	mov	DWORD PTR -76[rbp], 6906994
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	je	.L24
	mov	rax, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	jmp	.L25
.L24:
	mov	eax, 1
.L25:
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -104[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 12
	ja	.L41
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L28[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L28[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L28:
	.long	.L40-.L28
	.long	.L39-.L28
	.long	.L38-.L28
	.long	.L37-.L28
	.long	.L36-.L28
	.long	.L35-.L28
	.long	.L34-.L28
	.long	.L33-.L28
	.long	.L32-.L28
	.long	.L31-.L28
	.long	.L30-.L28
	.long	.L29-.L28
	.long	.L27-.L28
	.text
.L40:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L26
.L39:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L26
.L38:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC13[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L26
.L37:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L26
.L36:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -64[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC16[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L26
.L35:
	lea	rax, -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -96[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L34:
	lea	rax, -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -96[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC20[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L33:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L32:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC20[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L31:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC21[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L30:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC17[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC22[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L29:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC23[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L26
.L27:
	lea	rax, -96[rbp]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 2
	add	rdx, rax
	lea	rax, -32[rbp]
	mov	ecx, DWORD PTR -4[rbp]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC24[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	nop
.L26:
.L41:
	nop
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
	mov	DWORD PTR -20[rbp], 0
	mov	eax, DWORD PTR label_if_num[rip]
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR label_loop_num[rip]
	mov	DWORD PTR -28[rbp], eax
	mov	DWORD PTR -64[rbp], 6906994
	mov	DWORD PTR -60[rbp], 6910834
	mov	DWORD PTR -56[rbp], 7890034
	mov	DWORD PTR -52[rbp], 7889778
	mov	DWORD PTR -48[rbp], 14450
	mov	DWORD PTR -44[rbp], 14706
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	sub	eax, 13
	cmp	eax, 31
	ja	.L43
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L45[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L45[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L45:
	.long	.L73-.L45
	.long	.L72-.L45
	.long	.L71-.L45
	.long	.L70-.L45
	.long	.L70-.L45
	.long	.L69-.L45
	.long	.L68-.L45
	.long	.L67-.L45
	.long	.L66-.L45
	.long	.L65-.L45
	.long	.L64-.L45
	.long	.L63-.L45
	.long	.L62-.L45
	.long	.L61-.L45
	.long	.L60-.L45
	.long	.L59-.L45
	.long	.L58-.L45
	.long	.L43-.L45
	.long	.L57-.L45
	.long	.L56-.L45
	.long	.L55-.L45
	.long	.L54-.L45
	.long	.L53-.L45
	.long	.L52-.L45
	.long	.L51-.L45
	.long	.L99-.L45
	.long	.L49-.L45
	.long	.L48-.L45
	.long	.L47-.L45
	.long	.L46-.L45
	.long	.L43-.L45
	.long	.L105-.L45
	.text
.L60:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC25[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L64:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_gvar
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC26[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L65:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_lvar
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	ja	.L75
	lea	rdi, .LC27[rip]
	call	puts@PLT
	lea	rdi, .LC28[rip]
	call	puts@PLT
	jmp	.L76
.L75:
	lea	rdi, .LC26[rip]
	call	puts@PLT
.L76:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L106
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	gen
	jmp	.L106
.L62:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_gvar
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L107
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next
	jmp	.L107
.L63:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_lvar
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L108
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next
	jmp	.L108
.L69:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	jmp	.L42
.L71:
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
	ja	.L80
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L81
	lea	rdi, .LC30[rip]
	call	puts@PLT
	lea	rdi, .LC31[rip]
	call	puts@PLT
	lea	rdi, .LC32[rip]
	call	puts@PLT
	lea	rdi, .LC33[rip]
	call	puts@PLT
.L81:
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L42
.L80:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L83
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L42
.L83:
	lea	rdi, .LC36[rip]
	call	puts@PLT
	jmp	.L42
.L61:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC37[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L73:
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
	ja	.L84
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L85
.L84:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L86
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L85
.L86:
	lea	rdi, .LC36[rip]
	call	puts@PLT
.L85:
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L42
.L72:
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
	ja	.L87
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L88
	lea	rdi, .LC30[rip]
	call	puts@PLT
	lea	rdi, .LC31[rip]
	call	puts@PLT
	lea	rdi, .LC32[rip]
	call	puts@PLT
	lea	rdi, .LC33[rip]
	call	puts@PLT
.L88:
	lea	rdi, .LC34[rip]
	call	puts@PLT
	jmp	.L89
.L87:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jne	.L90
	lea	rdi, .LC35[rip]
	call	puts@PLT
	jmp	.L89
.L90:
	lea	rdi, .LC36[rip]
	call	puts@PLT
.L89:
	lea	rdi, .LC38[rip]
	call	puts@PLT
	jmp	.L42
.L70:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	gen_struc
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	je	.L109
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 6
	je	.L109
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC29[rip]
	call	puts@PLT
	jmp	.L109
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
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC40[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC41[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC42[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L58:
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
	mov	eax, DWORD PTR -24[rbp]
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
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L57:
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
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC40[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC41[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC42[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC43[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L56:
	mov	eax, DWORD PTR label_if_num[rip]
	add	eax, 1
	mov	DWORD PTR label_if_num[rip], eax
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L92
.L93:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC45[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L92:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L93
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L94
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	eax, DWORD PTR 48[rax]
	mov	esi, eax
	lea	rdi, .LC46[rip]
	mov	eax, 0
	call	printf@PLT
.L94:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L55:
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
	jmp	.L42
.L52:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC49[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 44
	je	.L95
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC39[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
.L95:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -28[rbp]
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
	je	.L96
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen
	lea	rdi, .LC0[rip]
	call	puts@PLT
.L96:
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L54:
	mov	eax, DWORD PTR label_loop_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_loop_num[rip], edx
	mov	DWORD PTR -28[rbp], eax
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -28[rbp]
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
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L53:
	mov	eax, DWORD PTR label_loop_num[rip]
	add	eax, 1
	mov	DWORD PTR label_loop_num[rip], eax
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -28[rbp]
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
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC50[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC51[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC52[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC47[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L46:
	mov	eax, DWORD PTR -28[rbp]
	sub	eax, 1
	mov	esi, eax
	lea	rdi, .LC53[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L47:
	mov	eax, DWORD PTR -28[rbp]
	sub	eax, 1
	mov	esi, eax
	lea	rdi, .LC54[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L42
.L51:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_block_code
	jmp	.L42
.L49:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L97
.L98:
	mov	rdx, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	gen_arg
	add	DWORD PTR -20[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
.L97:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L98
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
	jmp	.L42
.L100:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR 48[rax]
	lea	rax, -64[rbp]
	movsx	rdx, edx
	sal	rdx, 2
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
.L99:
	cmp	QWORD PTR -72[rbp], 0
	jne	.L100
	jmp	.L42
.L68:
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
	jmp	.L42
.L67:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen_address
	jmp	.L42
.L66:
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
	ja	.L101
	lea	rdi, .LC27[rip]
	call	puts@PLT
	lea	rdi, .LC28[rip]
	call	puts@PLT
	jmp	.L102
.L101:
	lea	rdi, .LC26[rip]
	call	puts@PLT
.L102:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	jmp	.L42
.L48:
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	je	.L103
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	gen
.L103:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC59[rip]
	call	puts@PLT
	lea	rdi, .LC60[rip]
	call	puts@PLT
	lea	rdi, .LC62[rip]
	call	puts@PLT
	jmp	.L42
.L43:
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
	jmp	.L42
.L105:
	nop
	jmp	.L42
.L106:
	nop
	jmp	.L42
.L107:
	nop
	jmp	.L42
.L108:
	nop
	jmp	.L42
.L109:
	nop
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	gen, .-gen
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
