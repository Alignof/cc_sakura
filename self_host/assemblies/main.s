	.file	"main.c"
	.intel_syntax noprefix
	.text
	.comm	llid,4,4
	.comm	label_if_num,4,4
	.comm	label_loop_num,4,4
	.comm	user_input,8,8
	.comm	filename,100,32
func_list:
	.zero   2400
	.comm	labels_head,8,8
	.comm	labels_tail,8,8
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"File open error.\n"
.LC2:
	.string	"%s: fseek:%s"
	.text
	.globl	read_file
	.type	read_file, @function
read_file:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rax
	lea	rdi, filename[rip]
	call	strcpy@PLT
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L2
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 17
	mov	esi, 1
	lea	rdi, .LC1[rip]
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L2:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 2
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	cmp	eax, -1
	jne	.L3
	call	__errno_location@PLT
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	error@PLT
.L3:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	ftell@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 0
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	cmp	eax, -1
	jne	.L4
	call	__errno_location@PLT
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	error@PLT
.L4:
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 2
	mov	rsi, rax
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rsi, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rdx
	mov	edx, 1
	mov	rdi, rax
	call	fread@PLT
	cmp	QWORD PTR -8[rbp], 0
	je	.L5
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	je	.L6
.L5:
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -8[rbp], rdx
	mov	rdx, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 10
.L6:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -24[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	read_file, .-read_file
	.section	.rodata
.LC3:
	.string	"-cl"
.LC4:
	.string	"Incorrect option\n"
	.align 8
.LC5:
	.string	"Incorrect number of arguments\n"
	.text
	.globl	get_code
	.type	get_code, @function
get_code:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	cmp	DWORD PTR -4[rbp], 2
	jne	.L9
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	read_file
	mov	QWORD PTR user_input[rip], rax
	jmp	.L8
.L9:
	cmp	DWORD PTR -4[rbp], 3
	jne	.L11
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR user_input[rip], rax
	movabs	rax, 2334111871611531107
	mov	QWORD PTR filename[rip], rax
	mov	DWORD PTR filename[rip+8], 1701734764
	mov	BYTE PTR filename[rip+12], 0
	jmp	.L8
.L12:
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 17
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L11:
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 30
	mov	esi, 1
	lea	rdi, .LC5[rip]
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_code, .-get_code
	.section	.rodata
.LC6:
	.string	".intel_syntax noprefix"
.LC7:
	.string	".globl main"
.LC8:
	.string	"%.*s:\n\t.zero %d\n"
.LC9:
	.string	".LC%d:\n"
.LC10:
	.string	"\t.string \"%.*s\"\n"
.LC11:
	.string	"%s:\n"
.LC12:
	.string	"\tpush rbp"
.LC13:
	.string	"\tmov rbp,rsp"
.LC14:
	.string	"\tsub rsp,%d\n"
.LC15:
	.string	"main"
.LC16:
	.string	"\n\tpop rax"
.LC17:
	.string	"\tmov rsp,rbp"
.LC18:
	.string	"\tpop rbp"
.LC19:
	.string	"\tret\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	rdx, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR -52[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_code
	mov	rax, QWORD PTR user_input[rip]
	mov	rdi, rax
	call	tokenize@PLT
	mov	QWORD PTR token[rip], rax
	call	program@PLT
	lea	rdi, .LC6[rip]
	call	puts@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	rax, QWORD PTR globals[rip]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -16[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L14:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L15
	mov	rax, QWORD PTR strings[rip]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L16
.L17:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	esi, eax
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -24[rbp], rax
.L16:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L17
	mov	DWORD PTR llid[rip], 0
	mov	DWORD PTR label_if_num[rip], 0
	mov	DWORD PTR label_loop_num[rip], 0
	mov	QWORD PTR labels_head[rip], 0
	mov	QWORD PTR labels_tail[rip], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L18
.L27:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC12[rip]
	call	puts@PLT
	lea	rdi, .LC13[rip]
	call	puts@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC14[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 24[rax]
	test	rax, rax
	je	.L19
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen@PLT
.L19:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, 4
	lea	rsi, .LC15[rip]
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L20
	mov	rax, QWORD PTR globals[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -32[rbp], rax
	jmp	.L21
.L23:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	test	rax, rax
	je	.L22
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next@PLT
.L22:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -32[rbp], rax
.L21:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L23
.L20:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L24
.L26:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	rax, QWORD PTR [rax+rdx*8]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 44
	je	.L25
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	rax, QWORD PTR [rax+rdx*8]
	mov	rdi, rax
	call	gen@PLT
	lea	rdi, .LC16[rip]
	call	puts@PLT
.L25:
	add	DWORD PTR -8[rbp], 1
.L24:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	rax, QWORD PTR [rax+rdx*8]
	test	rax, rax
	jne	.L26
	lea	rdi, .LC17[rip]
	call	puts@PLT
	lea	rdi, .LC18[rip]
	call	puts@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	add	DWORD PTR -4[rbp], 1
.L18:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	test	rax, rax
	jne	.L27
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
