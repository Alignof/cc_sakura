	.file	"declare.c"
	.intel_syntax noprefix
	.text
	.comm	locals,8,8
	.comm	globals,8,8
	.comm	structs,8,8
	.comm	enumerations,8,8
	.comm	defined_types,8,8
	.comm	outside_lvar,8,8
	.comm	outside_struct,8,8
	.comm	outside_enum,8,8
	.comm	outside_deftype,8,8
	.section	.rodata
.LC0:
	.string	"{"
.LC1:
	.string	"multiple definition"
	.text
	.globl	set_type
	.type	set_type, @function
set_type:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	je	.L2
	cmp	eax, 7
	ja	.L3
	cmp	eax, 5
	jbe	.L16
	cmp	eax, 6
	jne	.L3
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_struc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 36[rax], edx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR 40[rax], rdx
	cmp	QWORD PTR -16[rbp], 0
	je	.L6
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], edx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	jne	.L17
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L17
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 4
	mov	rdi, rax
	call	register_struc_member
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L17
.L6:
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L8
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	declare_struct
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	mov	rax, QWORD PTR structs[rip]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], edx
	jmp	.L17
.L8:
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	mov	rdx, QWORD PTR structs[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR structs[rip], rax
	jmp	.L17
.L2:
	cmp	QWORD PTR -64[rbp], 0
	je	.L9
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enum@PLT
	mov	QWORD PTR -8[rbp], rax
.L9:
	cmp	QWORD PTR -8[rbp], 0
	je	.L10
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	jne	.L18
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L18
	call	register_enum_member
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L18
.L10:
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -64[rbp], 0
	je	.L12
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 8[rax], rdx
.L12:
	lea	rdi, .LC0[rip]
	call	consume@PLT
	test	al, al
	je	.L13
	cmp	QWORD PTR -8[rbp], 0
	je	.L14
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	error_at@PLT
.L14:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	declare_enum
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
	jmp	.L18
.L13:
	mov	rdx, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR enumerations[rip], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
	jmp	.L18
.L16:
	nop
	jmp	.L3
.L17:
	nop
	jmp	.L3
.L18:
	nop
.L3:
	mov	rax, QWORD PTR -56[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	set_type, .-set_type
	.section	.rodata
.LC2:
	.string	"void"
.LC3:
	.string	"_Bool"
.LC4:
	.string	"char"
.LC5:
	.string	"int"
.LC6:
	.string	"struct"
.LC7:
	.string	"enum"
.LC8:
	.string	"unknown type."
	.text
	.globl	parse_type
	.type	parse_type, @function
parse_type:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	esi, 0
	lea	rdi, .LC2[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L20
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L20:
	mov	esi, 0
	lea	rdi, .LC3[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L22
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 1
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L22:
	mov	esi, 0
	lea	rdi, .LC4[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L23
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 2
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L23:
	mov	esi, 0
	lea	rdi, .LC5[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L24
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 3
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L24:
	mov	esi, 0
	lea	rdi, .LC6[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L25
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 6
	call	consume_ident@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L25:
	mov	esi, 0
	lea	rdi, .LC7[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L26
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 7
	call	consume_ident@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L26:
	call	consume_ident@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	edx, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L27
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L27:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	error_at@PLT
.L21:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rdx], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 20[rdx], eax
	jmp	.L28
.L30:
	add	DWORD PTR -12[rbp], 1
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
.L28:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 1
	jne	.L29
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 42
	je	.L30
.L29:
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	parse_type, .-parse_type
	.globl	insert_ptr_type
	.type	insert_ptr_type, @function
insert_ptr_type:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	cmp	DWORD PTR -28[rbp], 0
	je	.L33
	mov	DWORD PTR -12[rbp], 0
	jmp	.L34
.L35:
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 4
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rdx], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 20[rdx], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -24[rbp], rax
	add	DWORD PTR -12[rbp], 1
.L34:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L35
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L36
.L33:
	mov	rax, QWORD PTR -24[rbp]
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	insert_ptr_type, .-insert_ptr_type
	.section	.rodata
.LC9:
	.string	"not a variable."
.LC10:
	.string	"["
.LC11:
	.string	"]"
	.text
	.globl	declare_global_variable
	.type	declare_global_variable, @function
declare_global_variable:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	QWORD PTR -72[rbp], rdx
	cmp	QWORD PTR -64[rbp], 0
	jne	.L38
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	error_at@PLT
.L38:
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 23
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rdx, QWORD PTR globals[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	rbx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	DWORD PTR 16[rbx], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rbx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	DWORD PTR 20[rbx], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -52[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rdx], rax
	lea	rdi, .LC10[rip]
	call	check@PLT
	test	al, al
	je	.L39
	mov	DWORD PTR -24[rbp], -1
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], -1
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 25
	jmp	.L40
.L44:
	mov	DWORD PTR -20[rbp], -1
	lea	rdi, .LC11[rip]
	call	check@PLT
	xor	eax, 1
	test	al, al
	je	.L41
	cmp	DWORD PTR -24[rbp], -1
	jne	.L42
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -24[rbp], eax
	jmp	.L43
.L42:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, DWORD PTR -24[rbp]
	imul	eax, edx
	mov	DWORD PTR -24[rbp], eax
.L43:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
.L41:
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], 5
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 24[rax], edx
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -48[rbp]
	mov	DWORD PTR 16[rdx], eax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	rdx, QWORD PTR -48[rbp]
	mov	DWORD PTR 20[rdx], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 16[rax], rdx
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L40:
	lea	rdi, .LC10[rip]
	call	consume@PLT
	test	al, al
	jne	.L44
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	eax, DWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rdx], eax
	jmp	.L45
.L39:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rdx], eax
.L45:
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR globals[rip], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 56[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 72
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	declare_global_variable, .-declare_global_variable
	.section	.rodata
	.align 8
.LC12:
	.string	"this variable has already existed."
	.text
	.globl	declare_local_variable
	.type	declare_local_variable, @function
declare_local_variable:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	mov	DWORD PTR -68[rbp], edx
	mov	DWORD PTR -12[rbp], 1
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_lvar@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L48
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	error_at@PLT
.L48:
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR locals[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	lea	rdi, .LC10[rip]
	call	check@PLT
	test	al, al
	je	.L49
	mov	DWORD PTR -28[rbp], 0
	mov	DWORD PTR -8[rbp], -1
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 24
	jmp	.L50
.L54:
	mov	DWORD PTR -4[rbp], -1
	lea	rdi, .LC11[rip]
	call	check@PLT
	xor	eax, 1
	test	al, al
	je	.L51
	cmp	DWORD PTR -8[rbp], -1
	jne	.L52
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -8[rbp], eax
	jmp	.L53
.L52:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, DWORD PTR -8[rbp]
	imul	eax, edx
	mov	DWORD PTR -8[rbp], eax
.L53:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
.L51:
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], 5
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 24[rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 16[rdx], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 20[rdx], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L50:
	lea	rdi, .LC10[rip]
	call	consume@PLT
	test	al, al
	jne	.L54
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	eax, DWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR -28[rbp], eax
	mov	edx, DWORD PTR alloc_size[rip]
	mov	eax, DWORD PTR -28[rbp]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	mov	rax, QWORD PTR locals[rip]
	test	rax, rax
	je	.L55
	mov	rax, QWORD PTR locals[rip]
	mov	eax, DWORD PTR 4[rax]
	jmp	.L56
.L55:
	mov	eax, 0
.L56:
	mov	edx, DWORD PTR -28[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	jmp	.L57
.L49:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 6
	jne	.L58
	mov	rax, QWORD PTR locals[rip]
	test	rax, rax
	je	.L59
	mov	rax, QWORD PTR locals[rip]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	eax, DWORD PTR 16[rax]
	add	eax, edx
	jmp	.L60
.L59:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	eax, DWORD PTR 16[rax]
.L60:
	mov	rdx, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rdx], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR 16[rax]
	mov	eax, DWORD PTR alloc_size[rip]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	jmp	.L57
.L58:
	mov	rax, QWORD PTR locals[rip]
	test	rax, rax
	je	.L61
	mov	rax, QWORD PTR locals[rip]
	mov	eax, DWORD PTR 4[rax]
	lea	edx, 8[rax]
	jmp	.L62
.L61:
	mov	edx, 8
.L62:
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	eax, DWORD PTR alloc_size[rip]
	add	eax, 8
	mov	DWORD PTR alloc_size[rip], eax
.L57:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR locals[rip], rax
	mov	rax, QWORD PTR -56[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	declare_local_variable, .-declare_local_variable
	.section	.rodata
.LC13:
	.string	"not a type."
.LC14:
	.string	";"
.LC15:
	.string	"}"
	.text
	.globl	register_struc_member
	.type	register_struc_member, @function
register_struc_member:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi
	mov	DWORD PTR -28[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -16[rbp], 0
.L81:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L65
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -28[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	test	rax, rax
	jne	.L65
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	call	error_at@PLT
.L65:
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	call	parse_type
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rdx], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 8[rax], edx
	call	consume_ident@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	mov	DWORD PTR -20[rbp], -1
	jmp	.L66
.L69:
	cmp	DWORD PTR -20[rbp], -1
	jne	.L67
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -20[rbp], eax
	jmp	.L68
.L67:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, DWORD PTR -20[rbp]
	imul	eax, edx
	mov	DWORD PTR -20[rbp], eax
.L68:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -56[rbp], eax
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR [rax], 5
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR -56[rbp]
	mov	DWORD PTR 24[rax], edx
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	type_size@PLT
	mov	rdx, QWORD PTR -64[rbp]
	mov	DWORD PTR 16[rdx], eax
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	type_align@PLT
	mov	rdx, QWORD PTR -64[rbp]
	mov	DWORD PTR 20[rdx], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 24[rax], rdx
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L66:
	lea	rdi, .LC10[rip]
	call	consume@PLT
	test	al, al
	jne	.L69
	mov	DWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	jne	.L70
	mov	DWORD PTR -4[rbp], 8
	jmp	.L71
.L70:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 6
	jne	.L72
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -4[rbp], eax
	jmp	.L71
.L72:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
.L71:
	cmp	QWORD PTR -16[rbp], 0
	je	.L73
	cmp	QWORD PTR -16[rbp], 0
	je	.L74
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	eax, DWORD PTR 16[rax]
	add	eax, edx
	jmp	.L75
.L74:
	mov	eax, 0
.L75:
	mov	DWORD PTR -52[rbp], eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	ecx, DWORD PTR 20[rax]
	mov	eax, DWORD PTR -52[rbp]
	cdq
	idiv	ecx
	mov	eax, edx
	test	eax, eax
	je	.L76
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	ecx, DWORD PTR 20[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	esi, DWORD PTR 20[rax]
	mov	eax, DWORD PTR -52[rbp]
	cdq
	idiv	esi
	mov	eax, edx
	sub	ecx, eax
	mov	eax, ecx
	jmp	.L77
.L76:
	mov	eax, 0
.L77:
	mov	DWORD PTR -24[rbp], eax
	mov	edx, DWORD PTR -52[rbp]
	mov	eax, DWORD PTR -24[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rax], edx
	jmp	.L78
.L73:
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rax], 0
.L78:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	mov	ecx, DWORD PTR -4[rbp]
	mov	edx, DWORD PTR -24[rbp]
	add	edx, ecx
	add	edx, eax
	mov	rax, QWORD PTR -72[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rdi, .LC14[rip]
	call	expect@PLT
	lea	rdi, .LC15[rip]
	call	consume@PLT
	test	al, al
	jne	.L86
	jmp	.L81
.L86:
	nop
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	and	eax, 7
	test	eax, eax
	je	.L82
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 7[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 3
	add	eax, 1
	sal	eax, 3
	jmp	.L83
.L82:
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
.L83:
	mov	rdx, QWORD PTR -72[rbp]
	mov	DWORD PTR [rdx], eax
	mov	rax, QWORD PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	register_struc_member, .-register_struc_member
	.globl	declare_struct
	.type	declare_struct, @function
declare_struct:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	lea	rax, -4[rbp]
	mov	rdi, rax
	call	register_struc_member
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rdx, QWORD PTR structs[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR structs[rip], rax
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	declare_struct, .-declare_struct
	.section	.rodata
.LC16:
	.string	"expected \342\200\230,\342\200\231 or \342\200\230}\342\200\231"
.LC17:
	.string	"="
	.align 8
.LC18:
	.string	"enumerator value is not an integer constant"
.LC19:
	.string	","
	.text
	.globl	register_enum_member
	.type	register_enum_member, @function
register_enum_member:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -4[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	QWORD PTR -16[rbp], 0
.L95:
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 2
	je	.L89
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC16[rip]
	mov	rdi, rax
	call	error_at@PLT
.L89:
	call	consume_ident@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	lea	rdi, .LC17[rip]
	call	consume@PLT
	test	al, al
	je	.L90
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	je	.L91
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	call	error_at@PLT
.L91:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR token[rip], rax
	jmp	.L92
.L90:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 4[rax], edx
	add	DWORD PTR -4[rbp], 1
.L92:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rdi, .LC19[rip]
	call	consume@PLT
	lea	rdi, .LC15[rip]
	call	consume@PLT
	test	al, al
	jne	.L98
	jmp	.L95
.L98:
	nop
	mov	rax, QWORD PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	register_enum_member, .-register_enum_member
	.globl	declare_enum
	.type	declare_enum, @function
declare_enum:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	call	register_enum_member
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	rdx, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR enumerations[rip], rax
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	declare_enum, .-declare_enum
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
