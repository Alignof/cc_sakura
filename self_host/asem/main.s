	.file	"main.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.comm	llid,4,4
	.comm	label_num,4,4
	.comm	label_loop_end,4,4
	.comm	user_input,8,8
	.comm	filename,100,32
	.comm	func_list,2400,32
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
.LFB0:
	.file 1 "../src/main.c"
	.loc 1 12 28
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	.loc 1 16 2
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rax
	lea	rdi, filename[rip]
	call	strcpy@PLT
	.loc 1 17 12
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	.loc 1 17 5
	cmp	QWORD PTR -16[rbp], 0
	jne	.L2
	.loc 1 18 3
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 17
	mov	esi, 1
	lea	rdi, .LC1[rip]
	call	fwrite@PLT
	.loc 1 19 3
	mov	edi, 1
	call	exit@PLT
.L2:
	.loc 1 23 5
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 2
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	.loc 1 23 4
	cmp	eax, -1
	jne	.L3
	.loc 1 24 40
	call	__errno_location@PLT
	.loc 1 24 3
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
	.loc 1 27 16
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	ftell@PLT
	.loc 1 27 9
	mov	QWORD PTR -8[rbp], rax
	.loc 1 29 5
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 0
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	.loc 1 29 4
	cmp	eax, -1
	jne	.L4
	.loc 1 30 40
	call	__errno_location@PLT
	.loc 1 30 3
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
	.loc 1 33 8
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 2
	mov	rsi, rax
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 34 2
	mov	rdx, QWORD PTR -16[rbp]
	mov	rsi, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rdx
	mov	edx, 1
	mov	rdi, rax
	call	fread@PLT
	.loc 1 36 4
	cmp	QWORD PTR -8[rbp], 0
	je	.L5
	.loc 1 36 21 discriminator 1
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	.loc 1 36 15 discriminator 1
	cmp	al, 10
	je	.L6
.L5:
	.loc 1 37 11
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -8[rbp], rdx
	.loc 1 37 6
	mov	rdx, QWORD PTR -24[rbp]
	add	rax, rdx
	.loc 1 37 15
	mov	BYTE PTR [rax], 10
.L6:
	.loc 1 40 5
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	.loc 1 40 12
	mov	BYTE PTR [rax], 0
	.loc 1 41 2
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	.loc 1 43 9
	mov	rax, QWORD PTR -24[rbp]
	.loc 1 44 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
.LFB1:
	.loc 1 46 37
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	.loc 1 47 4
	cmp	DWORD PTR -4[rbp], 2
	jne	.L9
	.loc 1 48 30
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	.loc 1 48 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	read_file
	.loc 1 48 14
	mov	QWORD PTR user_input[rip], rax
	.loc 1 61 1
	jmp	.L8
.L9:
	.loc 1 49 10
	cmp	DWORD PTR -4[rbp], 3
	jne	.L11
	.loc 1 50 18
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	.loc 1 50 7
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	strcmp@PLT
	.loc 1 50 5
	test	eax, eax
	jne	.L12
	.loc 1 51 15
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR user_input[rip], rax
	.loc 1 52 4
	movabs	rax, 2334111871611531107
	mov	QWORD PTR filename[rip], rax
	mov	DWORD PTR filename[rip+8], 1701734764
	mov	BYTE PTR filename[rip+12], 0
	.loc 1 61 1
	jmp	.L8
.L12:
	.loc 1 54 4
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 17
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
	.loc 1 55 4
	mov	edi, 1
	call	exit@PLT
.L11:
	.loc 1 58 3
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 30
	mov	esi, 1
	lea	rdi, .LC5[rip]
	call	fwrite@PLT
	.loc 1 59 3
	mov	edi, 1
	call	exit@PLT
.L8:
	.loc 1 61 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	get_code, .-get_code
	.section	.rodata
.LC6:
	.string	".intel_syntax noprefix"
.LC7:
	.string	".globl main"
.LC8:
	.string	".comm\t%.*s, %d, %d\n"
.LC9:
	.string	".section .tbss,\"awT\",@nobits"
.LC10:
	.string	"%.*s:\n\t.zero %d\n"
.LC11:
	.string	".LC%d:\n"
.LC12:
	.string	"\t.string \"%.*s\"\n"
.LC13:
	.string	"%s:\n"
.LC14:
	.string	"\tpush rbp"
.LC15:
	.string	"\tmov rbp,rsp"
.LC16:
	.string	"\tsub rsp,%d\n"
.LC17:
	.string	"main"
.LC18:
	.string	"\tmov rsp,rbp"
.LC19:
	.string	"\tpop rbp"
.LC20:
	.string	"\tret\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 63 32
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	.loc 1 66 6
	mov	eax, 0
	call	three@PLT
	mov	DWORD PTR -4[rbp], eax
	.loc 1 69 2
	mov	rdx, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR -52[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_code
	.loc 1 72 10
	mov	rax, QWORD PTR user_input[rip]
	mov	rdi, rax
	call	tokenize@PLT
	.loc 1 72 8
	mov	QWORD PTR token[rip], rax
	.loc 1 74 2
	call	program@PLT
	.loc 1 82 2
	lea	rdi, .LC6[rip]
	call	puts@PLT
	.loc 1 83 2
	lea	rdi, .LC7[rip]
	call	puts@PLT
	.loc 1 86 8
	mov	rax, QWORD PTR globals[rip]
	mov	QWORD PTR -40[rbp], rax
.LBB2:
	.loc 1 87 13
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	.loc 1 87 2
	jmp	.L14
.L17:
	.loc 1 88 9
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 88 15
	mov	eax, DWORD PTR 28[rax]
	.loc 1 88 5
	test	eax, eax
	jne	.L15
	.loc 1 89 10
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 89 16
	mov	eax, DWORD PTR 32[rax]
	.loc 1 89 6
	test	eax, eax
	jne	.L16
	.loc 1 90 74
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 90 5
	mov	esi, DWORD PTR 20[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	mov	r8d, esi
	mov	esi, eax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L15
.L16:
	.loc 1 92 5
	lea	rdi, .LC9[rip]
	call	puts@PLT
	.loc 1 93 5
	mov	rax, QWORD PTR -16[rbp]
	mov	ecx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
.L15:
	.loc 1 87 33 discriminator 2
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L14:
	.loc 1 87 2 discriminator 1
	cmp	QWORD PTR -16[rbp], 0
	jne	.L17
.LBE2:
.LBB3:
	.loc 1 99 12
	mov	rax, QWORD PTR strings[rip]
	mov	QWORD PTR -24[rbp], rax
	.loc 1 99 2
	jmp	.L18
.L19:
	.loc 1 100 3 discriminator 3
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	esi, eax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 101 3 discriminator 3
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 99 34 discriminator 3
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -24[rbp], rax
.L18:
	.loc 1 99 2 discriminator 1
	cmp	QWORD PTR -24[rbp], 0
	jne	.L19
.LBE3:
	.loc 1 104 17
	mov	DWORD PTR llid[rip], 0
	.loc 1 105 17
	mov	DWORD PTR label_num[rip], 0
	.loc 1 106 17
	mov	DWORD PTR label_loop_end[rip], 0
	.loc 1 107 17
	mov	QWORD PTR labels_head[rip], 0
	.loc 1 108 17
	mov	QWORD PTR labels_tail[rip], 0
	.loc 1 111 8
	mov	DWORD PTR -4[rbp], 0
	.loc 1 111 2
	jmp	.L20
.L28:
	.loc 1 112 28
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 112 3
	mov	rax, QWORD PTR 8[rax]
	mov	rsi, rax
	lea	rdi, .LC13[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 113 3
	lea	rdi, .LC14[rip]
	call	puts@PLT
	.loc 1 114 3
	lea	rdi, .LC15[rip]
	call	puts@PLT
	.loc 1 115 36
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 115 3
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC16[rip]
	mov	eax, 0
	call	printf@PLT
	.loc 1 117 15
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 117 18
	mov	rax, QWORD PTR 24[rax]
	.loc 1 117 5
	test	rax, rax
	je	.L21
	.loc 1 119 17
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 119 4
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	gen@PLT
.L21:
	.loc 1 123 23
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 123 26
	mov	rax, QWORD PTR 8[rax]
	.loc 1 123 6
	mov	edx, 4
	lea	rsi, .LC17[rip]
	mov	rdi, rax
	call	strncmp@PLT
	.loc 1 123 5
	test	eax, eax
	jne	.L22
.LBB4:
	.loc 1 124 10
	mov	rax, QWORD PTR globals[rip]
	mov	QWORD PTR -48[rbp], rax
.LBB5:
	.loc 1 125 15
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -32[rbp], rax
	.loc 1 125 4
	jmp	.L23
.L25:
	.loc 1 126 11
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	.loc 1 126 7
	test	rax, rax
	je	.L24
	.loc 1 126 19 discriminator 1
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdi, rax
	call	expand_next@PLT
.L24:
	.loc 1 125 35 discriminator 2
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -32[rbp], rax
.L23:
	.loc 1 125 4 discriminator 1
	cmp	QWORD PTR -32[rbp], 0
	jne	.L25
.L22:
.LBE5:
.LBE4:
	.loc 1 130 9
	mov	DWORD PTR -8[rbp], 0
	.loc 1 130 3
	jmp	.L26
.L27:
	.loc 1 132 17 discriminator 3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 132 4 discriminator 3
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	rax, QWORD PTR [rax+rdx*8]
	mov	rdi, rax
	call	gen@PLT
	.loc 1 130 44 discriminator 3
	add	DWORD PTR -8[rbp], 1
.L26:
	.loc 1 130 22 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 130 31 discriminator 1
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	rax, QWORD PTR [rax+rdx*8]
	.loc 1 130 3 discriminator 1
	test	rax, rax
	jne	.L27
	.loc 1 137 3 discriminator 2
	lea	rdi, .LC18[rip]
	call	puts@PLT
	.loc 1 138 3 discriminator 2
	lea	rdi, .LC19[rip]
	call	puts@PLT
	.loc 1 139 3 discriminator 2
	lea	rdi, .LC20[rip]
	call	puts@PLT
	.loc 1 111 26 discriminator 2
	add	DWORD PTR -4[rbp], 1
.L20:
	.loc 1 111 21 discriminator 1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 111 2 discriminator 1
	test	rax, rax
	jne	.L28
	.loc 1 142 9
	mov	eax, 0
	.loc 1 143 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "../include/cc_sakura.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd6d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF189
	.byte	0xc
	.long	.LASF190
	.long	.LASF191
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
	.long	.LASF192
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
	.byte	0x11
	.long	0x65
	.uleb128 0x17
	.long	.LASF166
	.byte	0x7
	.value	0x101
	.byte	0x12
	.long	0x8b
	.uleb128 0xb
	.long	0x91
	.long	0xa4b
	.uleb128 0xc
	.long	0x39
	.byte	0x63
	.byte	0
	.uleb128 0x17
	.long	.LASF167
	.byte	0x7
	.value	0x102
	.byte	0x11
	.long	0xa3b
	.uleb128 0x17
	.long	.LASF168
	.byte	0x7
	.value	0x103
	.byte	0x12
	.long	0x9b0
	.uleb128 0xb
	.long	0x9d9
	.long	0xa76
	.uleb128 0x16
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x17
	.long	.LASF169
	.byte	0x7
	.value	0x104
	.byte	0x12
	.long	0xa65
	.uleb128 0x17
	.long	.LASF170
	.byte	0x7
	.value	0x105
	.byte	0x12
	.long	0x9eb
	.uleb128 0x17
	.long	.LASF171
	.byte	0x7
	.value	0x106
	.byte	0x12
	.long	0x9e5
	.uleb128 0x17
	.long	.LASF172
	.byte	0x7
	.value	0x107
	.byte	0x12
	.long	0x9df
	.uleb128 0x17
	.long	.LASF173
	.byte	0x7
	.value	0x108
	.byte	0x12
	.long	0x9fd
	.uleb128 0x17
	.long	.LASF174
	.byte	0x7
	.value	0x109
	.byte	0x12
	.long	0xa03
	.uleb128 0x17
	.long	.LASF175
	.byte	0x7
	.value	0x10a
	.byte	0x12
	.long	0x9bc
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
	.long	0x9f1
	.uleb128 0x17
	.long	.LASF178
	.byte	0x7
	.value	0x10d
	.byte	0x12
	.long	0x9eb
	.uleb128 0x17
	.long	.LASF179
	.byte	0x7
	.value	0x10e
	.byte	0x12
	.long	0x9fd
	.uleb128 0x17
	.long	.LASF180
	.byte	0x7
	.value	0x10f
	.byte	0x12
	.long	0xa03
	.uleb128 0x17
	.long	.LASF181
	.byte	0x7
	.value	0x110
	.byte	0x12
	.long	0x9bc
	.uleb128 0x17
	.long	.LASF152
	.byte	0x7
	.value	0x168
	.byte	0xc
	.long	0x65
	.uleb128 0x17
	.long	.LASF182
	.byte	0x7
	.value	0x169
	.byte	0xc
	.long	0x65
	.uleb128 0x18
	.long	0xa09
	.byte	0x1
	.byte	0x3
	.byte	0x7
	.uleb128 0x9
	.byte	0x3
	.quad	llid
	.uleb128 0x18
	.long	0xb1f
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.uleb128 0x9
	.byte	0x3
	.quad	label_num
	.uleb128 0x18
	.long	0xb2c
	.byte	0x1
	.byte	0x5
	.byte	0x7
	.uleb128 0x9
	.byte	0x3
	.quad	label_loop_end
	.uleb128 0x18
	.long	0xa2e
	.byte	0x1
	.byte	0x6
	.byte	0x8
	.uleb128 0x9
	.byte	0x3
	.quad	user_input
	.uleb128 0x18
	.long	0xa4b
	.byte	0x1
	.byte	0x7
	.byte	0x7
	.uleb128 0x9
	.byte	0x3
	.quad	filename
	.uleb128 0x18
	.long	0xa76
	.byte	0x1
	.byte	0x8
	.byte	0x8
	.uleb128 0x9
	.byte	0x3
	.quad	func_list
	.uleb128 0x18
	.long	0xad1
	.byte	0x1
	.byte	0x9
	.byte	0x8
	.uleb128 0x9
	.byte	0x3
	.quad	labels_head
	.uleb128 0x18
	.long	0xade
	.byte	0x1
	.byte	0xa
	.byte	0x8
	.uleb128 0x9
	.byte	0x3
	.quad	labels_tail
	.uleb128 0x19
	.long	.LASF193
	.byte	0x1
	.byte	0x3f
	.byte	0x5
	.long	0x65
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xcd3
	.uleb128 0x1a
	.long	.LASF183
	.byte	0x1
	.byte	0x3f
	.byte	0xe
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1a
	.long	.LASF184
	.byte	0x1
	.byte	0x3f
	.byte	0x1b
	.long	0xcd3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.string	"j"
	.byte	0x1
	.byte	0x40
	.byte	0x9
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF194
	.byte	0x1
	.byte	0x42
	.byte	0x6
	.long	0x65
	.long	0xc37
	.uleb128 0x1d
	.byte	0
	.uleb128 0x1e
	.long	.LASF185
	.byte	0x1
	.byte	0x56
	.byte	0x8
	.long	0x9e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0xc6b
	.uleb128 0x1b
	.string	"var"
	.byte	0x1
	.byte	0x57
	.byte	0xd
	.long	0x9e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1f
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0xc90
	.uleb128 0x1b
	.string	"var"
	.byte	0x1
	.byte	0x63
	.byte	0xc
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x20
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1e
	.long	.LASF185
	.byte	0x1
	.byte	0x7c
	.byte	0xa
	.long	0x9e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1b
	.string	"var"
	.byte	0x1
	.byte	0x7d
	.byte	0xf
	.long	0x9e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x21
	.long	.LASF186
	.byte	0x1
	.byte	0x2e
	.byte	0x6
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xd16
	.uleb128 0x1a
	.long	.LASF183
	.byte	0x1
	.byte	0x2e
	.byte	0x13
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	.LASF184
	.byte	0x1
	.byte	0x2e
	.byte	0x20
	.long	0xcd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x22
	.long	.LASF187
	.byte	0x1
	.byte	0xc
	.byte	0x7
	.long	0x8b
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.long	.LASF188
	.byte	0x1
	.byte	0xc
	.byte	0x17
	.long	0x8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.string	"fp"
	.byte	0x1
	.byte	0xd
	.byte	0x8
	.long	0x28c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.string	"buf"
	.byte	0x1
	.byte	0xe
	.byte	0x8
	.long	0x8b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF155
	.byte	0x1
	.byte	0x1b
	.byte	0x9
	.long	0x2d
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
.LASF7:
	.string	"size_t"
.LASF109:
	.string	"ND_FOR"
.LASF30:
	.string	"_shortbuf"
.LASF146:
	.string	"Func"
.LASF179:
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
.LASF194:
	.string	"three"
.LASF139:
	.string	"GVar"
.LASF120:
	.string	"CHAR"
.LASF51:
	.string	"TK_NUM"
.LASF123:
	.string	"ENUM"
.LASF176:
	.string	"labels_head"
.LASF186:
	.string	"get_code"
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
.LASF104:
	.string	"ND_NULL_STMT"
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
.LASF180:
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
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF193:
	.string	"main"
.LASF165:
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
.LASF190:
	.string	"../src/main.c"
.LASF92:
	.string	"ND_ADDRESS"
.LASF1:
	.string	"unsigned int"
.LASF159:
	.string	"is_thread_local"
.LASF36:
	.string	"_freeres_buf"
.LASF169:
	.string	"func_list"
.LASF177:
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
.LASF181:
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
.LASF175:
	.string	"defined_types"
.LASF97:
	.string	"ND_GARRAY"
.LASF162:
	.string	"tag_len"
.LASF172:
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
.LASF182:
	.string	"label_loop_end"
.LASF119:
	.string	"BOOL"
.LASF113:
	.string	"ND_CONTINUE"
.LASF50:
	.string	"TK_IDENT"
.LASF64:
	.string	"TK_CONTINUE"
.LASF187:
	.string	"read_file"
.LASF163:
	.string	"llid"
.LASF89:
	.string	"ND_ARROW"
.LASF178:
	.string	"outside_lvar"
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
.LASF192:
	.string	"_IO_lock_t"
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
.LASF164:
	.string	"lvar_count"
.LASF91:
	.string	"ND_NOT"
.LASF55:
	.string	"TK_CASE"
.LASF144:
	.string	"Enum"
.LASF168:
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
.LASF191:
	.string	"/home/takana/git/cc_sakura/self_host"
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
.LASF75:
	.string	"ND_DIV"
.LASF40:
	.string	"FILE"
.LASF166:
	.string	"user_input"
.LASF81:
	.string	"ND_EQ"
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
.LASF189:
	.string	"GNU C11 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c11 -fasynchronous-unwind-tables"
.LASF108:
	.string	"ND_SWITCH"
.LASF68:
	.string	"TK_THREAD_LOCAL"
.LASF170:
	.string	"locals"
.LASF174:
	.string	"enumerations"
.LASF9:
	.string	"__off64_t"
.LASF63:
	.string	"TK_BREAK"
.LASF173:
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
.LASF188:
	.string	"path"
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
.LASF184:
	.string	"argv"
.LASF21:
	.string	"_IO_backup_base"
.LASF57:
	.string	"TK_DO"
.LASF167:
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
.LASF183:
	.string	"argc"
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
.LASF185:
	.string	"start"
.LASF150:
	.string	"Label"
.LASF148:
	.string	"args"
.LASF171:
	.string	"globals"
.LASF79:
	.string	"ND_LT"
.LASF15:
	.string	"_IO_write_base"
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
