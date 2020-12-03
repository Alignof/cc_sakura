	.file	"parse_sys.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%s\n"
.LC1:
	.string	" "
.LC2:
	.string	"%*s"
.LC3:
	.string	"^ "
	.text
	.globl	error
	.type	error, @function
error:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 224
	mov	QWORD PTR -216[rbp], rdi
	mov	QWORD PTR -224[rbp], rsi
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], rcx
	mov	QWORD PTR -144[rbp], r8
	mov	QWORD PTR -136[rbp], r9
	test	al, al
	je	.L3
	movaps	XMMWORD PTR -128[rbp], xmm0
	movaps	XMMWORD PTR -112[rbp], xmm1
	movaps	XMMWORD PTR -96[rbp], xmm2
	movaps	XMMWORD PTR -80[rbp], xmm3
	movaps	XMMWORD PTR -64[rbp], xmm4
	movaps	XMMWORD PTR -48[rbp], xmm5
	movaps	XMMWORD PTR -32[rbp], xmm6
	movaps	XMMWORD PTR -16[rbp], xmm7
.L3:
	mov	DWORD PTR -208[rbp], 16
	mov	DWORD PTR -204[rbp], 48
	lea	rax, 16[rbp]
	mov	QWORD PTR -200[rbp], rax
	lea	rax, -176[rbp]
	mov	QWORD PTR -192[rbp], rax
	mov	rax, QWORD PTR user_input[rip]
	mov	rdx, QWORD PTR -216[rbp]
	sub	rdx, rax
	mov	rax, rdx
	mov	DWORD PTR -180[rbp], eax
	mov	rdx, QWORD PTR user_input[rip]
	mov	rax, QWORD PTR stderr[rip]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR stderr[rip]
	mov	edx, DWORD PTR -180[rbp]
	lea	rcx, .LC1[rip]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 2
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT
	mov	rax, QWORD PTR stderr[rip]
	lea	rdx, -208[rbp]
	mov	rcx, QWORD PTR -224[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	vfprintf@PLT
	mov	rax, QWORD PTR stderr[rip]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	error, .-error
	.section	.rodata
.LC4:
	.string	"%s:%d "
.LC5:
	.string	"%.*s\n"
.LC6:
	.string	"^ %s\n"
	.text
	.globl	error_at
	.type	error_at, @function
error_at:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	jmp	.L5
.L7:
	sub	QWORD PTR -56[rbp], 1
.L5:
	mov	rax, QWORD PTR user_input[rip]
	cmp	QWORD PTR -56[rbp], rax
	jbe	.L6
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	je	.L7
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 9
	je	.L7
.L6:
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L8
.L10:
	sub	QWORD PTR -8[rbp], 1
.L8:
	mov	rax, QWORD PTR user_input[rip]
	cmp	QWORD PTR -8[rbp], rax
	jbe	.L9
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	jne	.L10
.L9:
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L11
.L12:
	add	QWORD PTR -16[rbp], 1
.L11:
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	jne	.L12
	mov	DWORD PTR -20[rbp], 1
	mov	rax, QWORD PTR user_input[rip]
	mov	QWORD PTR -32[rbp], rax
	jmp	.L13
.L15:
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	jne	.L14
	add	DWORD PTR -20[rbp], 1
.L14:
	add	QWORD PTR -32[rbp], 1
.L13:
	mov	rax, QWORD PTR -32[rbp]
	cmp	rax, QWORD PTR -56[rbp]
	jb	.L15
	jmp	.L16
.L17:
	add	QWORD PTR -8[rbp], 1
.L16:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 9
	je	.L17
	mov	rax, QWORD PTR stderr[rip]
	mov	edx, DWORD PTR -20[rbp]
	mov	ecx, edx
	lea	rdx, filename[rip]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	DWORD PTR -36[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	esi, eax
	mov	rax, QWORD PTR stderr[rip]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rcx, rdx
	mov	edx, esi
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	sub	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR -40[rbp], eax
	mov	rax, QWORD PTR stderr[rip]
	mov	edx, DWORD PTR -40[rbp]
	lea	rcx, .LC1[rip]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR stderr[rip]
	mov	rdx, QWORD PTR -64[rbp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE7:
	.size	error_at, .-error_at
	.globl	check
	.type	check, @function
check:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	je	.L19
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 13
	jne	.L20
.L19:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rdx, QWORD PTR token[rip]
	mov	edx, DWORD PTR 32[rdx]
	movsx	rdx, edx
	cmp	rax, rdx
	jne	.L20
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	mov	rcx, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	je	.L21
.L20:
	mov	eax, 0
	jmp	.L22
.L21:
	mov	eax, 1
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	check, .-check
	.globl	consume
	.type	consume, @function
consume:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	je	.L24
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 13
	jne	.L25
.L24:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rdx, QWORD PTR token[rip]
	mov	edx, DWORD PTR 32[rdx]
	movsx	rdx, edx
	cmp	rax, rdx
	jne	.L25
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	mov	rcx, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	je	.L26
.L25:
	mov	eax, 0
	jmp	.L27
.L26:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	mov	eax, 1
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	consume, .-consume
	.globl	string_len
	.type	string_len, @function
string_len:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], 0
	jmp	.L29
.L30:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	add	DWORD PTR -4[rbp], 1
.L29:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 14
	je	.L30
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	string_len, .-string_len
	.section	.rodata
.LC7:
	.string	"return"
	.text
	.globl	consume_ret
	.type	consume_ret, @function
consume_ret:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 19
	jne	.L33
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	cmp	eax, 6
	jne	.L33
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	je	.L34
.L33:
	mov	eax, 0
	jmp	.L35
.L34:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	mov	eax, 1
.L35:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	consume_ret, .-consume_ret
	.globl	consume_reserved_word
	.type	consume_reserved_word, @function
consume_reserved_word:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -28[rbp], eax
	jne	.L37
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rbx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax
	jne	.L37
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	je	.L38
.L37:
	mov	eax, 0
	jmp	.L39
.L38:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	mov	eax, 1
.L39:
	add	rsp, 24
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	consume_reserved_word, .-consume_reserved_word
	.globl	consume_string
	.type	consume_string, @function
consume_string:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 14
	jne	.L41
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jns	.L42
.L41:
	mov	eax, 0
	jmp	.L43
.L42:
	mov	rax, QWORD PTR token[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L44
.L45:
	add	DWORD PTR -4[rbp], 1
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
.L44:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 14
	je	.L45
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -16[rbp]
.L43:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	consume_string, .-consume_string
	.globl	consume_ident
	.type	consume_ident, @function
consume_ident:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	jne	.L47
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	is_alnum@PLT
	test	eax, eax
	jne	.L48
.L47:
	mov	eax, 0
	jmp	.L49
.L48:
	mov	rax, QWORD PTR token[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	len_val@PLT
	mov	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L50
.L51:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	add	DWORD PTR -4[rbp], 1
.L50:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L51
	mov	rax, QWORD PTR -16[rbp]
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	consume_ident, .-consume_ident
	.section	.rodata
.LC8:
	.string	"not a charctor."
	.text
	.globl	expect
	.type	expect, @function
expect:
.LFB15:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	je	.L53
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 13
	jne	.L54
.L53:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rdx, QWORD PTR token[rip]
	mov	edx, DWORD PTR 32[rdx]
	movsx	rdx, edx
	cmp	rax, rdx
	jne	.L54
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	mov	rcx, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	je	.L55
.L54:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	error_at
.L55:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	expect, .-expect
	.section	.rodata
.LC9:
	.string	"not a number"
	.text
	.globl	expect_number
	.type	expect_number, @function
expect_number:
.LFB16:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	je	.L57
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	error_at
.L57:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	mov	eax, DWORD PTR -4[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	expect_number, .-expect_number
	.globl	label_register
	.type	label_register, @function
label_register:
.LFB17:
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
	mov	DWORD PTR -44[rbp], esi
	mov	rax, QWORD PTR labels_tail[rip]
	test	rax, rax
	je	.L60
	mov	rbx, QWORD PTR labels_tail[rip]
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR 16[rbx], rax
	mov	rax, QWORD PTR labels_tail[rip]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L61
.L60:
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR labels_head[rip], rax
	mov	rax, QWORD PTR labels_head[rip]
	mov	QWORD PTR -24[rbp], rax
.L61:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -44[rbp]
	mov	DWORD PTR 24[rax], edx
	mov	edx, DWORD PTR llid[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	edx, DWORD PTR llid[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR labels_tail[rip]
	test	rax, rax
	je	.L62
	mov	rax, QWORD PTR labels_tail[rip]
	mov	rax, QWORD PTR 16[rax]
	jmp	.L63
.L62:
	mov	rax, QWORD PTR labels_head[rip]
.L63:
	mov	QWORD PTR labels_tail[rip], rax
	mov	eax, DWORD PTR llid[rip]
	add	eax, 1
	mov	DWORD PTR llid[rip], eax
	cmp	DWORD PTR -44[rbp], 1
	jne	.L64
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	jmp	.L66
.L64:
	cmp	DWORD PTR -44[rbp], 2
	jne	.L66
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
.L66:
	nop
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	label_register, .-label_register
	.globl	find_func
	.type	find_func, @function
find_func:
.LFB18:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L68
.L72:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rcx+rax]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L69
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	jmp	.L70
.L69:
	add	DWORD PTR -4[rbp], 1
.L68:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	test	rax, rax
	je	.L71
	cmp	DWORD PTR -4[rbp], 299
	jle	.L72
.L71:
	mov	eax, 0
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	find_func, .-find_func
	.globl	find_gvar
	.type	find_gvar, @function
find_gvar:
.LFB19:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR globals[rip]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L74
.L77:
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L75
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L75
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L76
.L75:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
.L74:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L77
	mov	eax, 0
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	find_gvar, .-find_gvar
	.globl	find_lvar
	.type	find_lvar, @function
find_lvar:
.LFB20:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR locals[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L79
.L85:
	mov	rax, QWORD PTR outside_lvar[rip]
	cmp	QWORD PTR -16[rbp], rax
	jne	.L80
	mov	DWORD PTR -4[rbp], 1
.L80:
	cmp	DWORD PTR -28[rbp], 0
	je	.L81
	cmp	DWORD PTR -4[rbp], 0
	jne	.L86
.L81:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L83
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L83
	mov	rax, QWORD PTR -16[rbp]
	jmp	.L84
.L83:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L79:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L85
	jmp	.L82
.L86:
	nop
.L82:
	mov	eax, 0
.L84:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	find_lvar, .-find_lvar
	.globl	find_string
	.type	find_string, @function
find_string:
.LFB21:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR strings[rip]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L88
.L91:
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L89
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L89
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L90
.L89:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
.L88:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L91
	mov	eax, 0
.L90:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	find_string, .-find_string
	.globl	find_struc
	.type	find_struc, @function
find_struc:
.LFB22:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L93
.L99:
	mov	rax, QWORD PTR outside_struct[rip]
	cmp	QWORD PTR -16[rbp], rax
	jne	.L94
	mov	DWORD PTR -4[rbp], 1
.L94:
	cmp	DWORD PTR -28[rbp], 0
	je	.L95
	cmp	DWORD PTR -4[rbp], 0
	jne	.L100
.L95:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L97
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L97
	mov	rax, QWORD PTR -16[rbp]
	jmp	.L98
.L97:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L93:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L99
	jmp	.L96
.L100:
	nop
.L96:
	mov	eax, 0
.L98:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	find_struc, .-find_struc
	.globl	find_struct_member
	.type	find_struct_member, @function
find_struct_member:
.LFB23:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -44[rbp], esi
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 36[rax]
	mov	DWORD PTR -28[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L102
.L108:
	mov	rax, QWORD PTR outside_struct[rip]
	cmp	QWORD PTR -16[rbp], rax
	jne	.L103
	mov	DWORD PTR -4[rbp], 1
.L103:
	cmp	DWORD PTR -44[rbp], 0
	je	.L104
	cmp	DWORD PTR -4[rbp], 0
	jne	.L109
.L104:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -28[rbp], eax
	jne	.L106
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L106
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	jmp	.L107
.L106:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L102:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L108
	jmp	.L105
.L109:
	nop
.L105:
	mov	eax, 0
.L107:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	find_struct_member, .-find_struct_member
	.globl	find_enum
	.type	find_enum, @function
find_enum:
.LFB24:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L111
.L117:
	mov	rax, QWORD PTR outside_enum[rip]
	cmp	QWORD PTR -16[rbp], rax
	jne	.L112
	mov	DWORD PTR -4[rbp], 1
.L112:
	cmp	DWORD PTR -28[rbp], 0
	je	.L113
	cmp	DWORD PTR -4[rbp], 0
	jne	.L118
.L113:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L115
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L115
	mov	rax, QWORD PTR -16[rbp]
	jmp	.L116
.L115:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L111:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L117
	jmp	.L114
.L118:
	nop
.L114:
	mov	eax, 0
.L116:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	find_enum, .-find_enum
	.globl	find_enumerator
	.type	find_enumerator, @function
find_enumerator:
.LFB25:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -44[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L120
.L128:
	mov	rax, QWORD PTR outside_enum[rip]
	cmp	QWORD PTR -16[rbp], rax
	jne	.L121
	mov	DWORD PTR -4[rbp], 1
.L121:
	cmp	DWORD PTR -44[rbp], 0
	je	.L122
	cmp	DWORD PTR -4[rbp], 0
	jne	.L129
.L122:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L124
.L127:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L125
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L125
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L126
.L125:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -24[rbp], rax
.L124:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L127
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L120:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L128
	jmp	.L123
.L129:
	nop
.L123:
	mov	eax, 0
.L126:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	find_enumerator, .-find_enumerator
	.globl	find_defined_type
	.type	find_defined_type, @function
find_defined_type:
.LFB26:
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
	mov	DWORD PTR -44[rbp], esi
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR defined_types[rip]
	mov	QWORD PTR -32[rbp], rax
	jmp	.L131
.L137:
	mov	rax, QWORD PTR outside_deftype[rip]
	cmp	QWORD PTR -32[rbp], rax
	jne	.L132
	mov	DWORD PTR -20[rbp], 1
.L132:
	cmp	DWORD PTR -20[rbp], 0
	jne	.L138
	mov	rax, QWORD PTR -32[rbp]
	mov	ebx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	len_val@PLT
	cmp	ebx, eax
	jne	.L135
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR 8[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L135
	mov	rax, QWORD PTR -32[rbp]
	jmp	.L136
.L135:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	QWORD PTR -32[rbp], rax
.L131:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L137
	jmp	.L134
.L138:
	nop
.L134:
	mov	eax, 0
.L136:
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	find_defined_type, .-find_defined_type
	.globl	new_node
	.type	new_node, @function
new_node:
.LFB27:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	QWORD PTR -56[rbp], rdx
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -36[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	QWORD PTR 16[rax], rdx
	cmp	DWORD PTR -36[rbp], 0
	je	.L140
	cmp	DWORD PTR -36[rbp], 1
	jne	.L141
.L140:
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	ja	.L142
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jbe	.L141
.L142:
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR 40[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	pointer_calc@PLT
	mov	QWORD PTR -24[rbp], rax
.L141:
	cmp	DWORD PTR -36[rbp], 13
	jne	.L143
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L143
	mov	edi, 0
	call	new_node_num
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rsi, rax
	mov	edi, 10
	call	new_node
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rdx], rax
.L143:
	cmp	DWORD PTR -36[rbp], 13
	ja	.L144
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jbe	.L145
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 40[rax]
	jmp	.L146
.L145:
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
.L146:
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rdx], rax
.L144:
	cmp	DWORD PTR -36[rbp], 16
	je	.L147
	cmp	DWORD PTR -36[rbp], 17
	jne	.L148
.L147:
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rax], rdx
.L148:
	cmp	DWORD PTR -36[rbp], 20
	jne	.L149
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 4
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_size@PLT
	mov	DWORD PTR 16[rbx], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_align@PLT
	mov	DWORD PTR 20[rbx], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 40[rdx]
	mov	QWORD PTR 8[rax], rdx
.L149:
	cmp	DWORD PTR -36[rbp], 21
	jne	.L150
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L151
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	je	.L152
.L151:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L150
.L152:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -56[rbp]
	jmp	.L153
.L150:
	mov	rax, QWORD PTR -24[rbp]
.L153:
	add	rsp, 56
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	new_node, .-new_node
	.globl	new_node_num
	.type	new_node_num, @function
new_node_num:
.LFB28:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	DWORD PTR -36[rbp], edi
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], 27
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -36[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 3
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_size@PLT
	mov	DWORD PTR 16[rbx], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_align@PLT
	mov	DWORD PTR 20[rbx], eax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	new_node_num, .-new_node_num
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
