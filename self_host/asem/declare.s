	.file	"declare.c"
	.intel_syntax noprefix
	.text
.Ltext0:
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
.LFB0:
	.file 1 "../src/declare.c"
	.loc 1 17 39
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	.loc 1 18 9
	mov	QWORD PTR -8[rbp], 0
	.loc 1 19 9
	mov	QWORD PTR -16[rbp], 0
	.loc 1 20 6
	mov	DWORD PTR -20[rbp], 0
	.loc 1 22 13
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 22 2
	cmp	eax, 7
	je	.L2
	cmp	eax, 7
	ja	.L3
	cmp	eax, 5
	jbe	.L16
	cmp	eax, 6
	jne	.L3
	.loc 1 32 18
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_struc@PLT
	mov	QWORD PTR -16[rbp], rax
	.loc 1 33 21
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 33 16
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 36[rax], edx
	.loc 1 34 21
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 34 16
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 35 6
	cmp	QWORD PTR -16[rbp], 0
	je	.L6
	.loc 1 36 14
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	.loc 1 37 31
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 37 18
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], edx
	.loc 1 39 19
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 39 7
	test	rax, rax
	jne	.L17
	.loc 1 39 39 discriminator 1
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 39 36 discriminator 1
	test	al, al
	je	.L17
	.loc 1 40 28
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 4
	mov	rdi, rax
	call	register_struc_member
	.loc 1 40 26
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 59 4
	jmp	.L17
.L6:
.LBB2:
	.loc 1 43 24
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 44 27
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 44 22
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 45 27
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 45 22
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 47 8
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 47 7
	test	al, al
	je	.L8
	.loc 1 48 6
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	declare_struct
	.loc 1 49 22
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	.loc 1 50 31
	mov	rax, QWORD PTR structs[rip]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 50 22
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 16[rax], edx
.LBE2:
	.loc 1 59 4
	jmp	.L17
.L8:
.LBB3:
	.loc 1 53 22
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 6
	.loc 1 54 22
	mov	rdx, QWORD PTR structs[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 55 22
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR structs[rip], rax
.LBE3:
	.loc 1 59 4
	jmp	.L17
.L2:
	.loc 1 61 6
	cmp	QWORD PTR -64[rbp], 0
	je	.L9
	.loc 1 62 18
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enum@PLT
	mov	QWORD PTR -8[rbp], rax
.L9:
	.loc 1 65 6
	cmp	QWORD PTR -8[rbp], 0
	je	.L10
	.loc 1 66 14
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
	.loc 1 67 18
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 67 7
	test	rax, rax
	jne	.L18
	.loc 1 67 38 discriminator 1
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 67 35 discriminator 1
	test	al, al
	je	.L18
	.loc 1 68 27
	call	register_enum_member
	.loc 1 68 25
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 86 4
	jmp	.L18
.L10:
.LBB4:
	.loc 1 71 22
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 72 7
	cmp	QWORD PTR -64[rbp], 0
	je	.L12
	.loc 1 73 27
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 73 22
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 74 27
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 74 22
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 8[rax], rdx
.L12:
	.loc 1 76 8
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 76 7
	test	al, al
	je	.L13
	.loc 1 77 8
	cmp	QWORD PTR -8[rbp], 0
	je	.L14
	.loc 1 77 35 discriminator 1
	mov	rax, QWORD PTR token[rip]
	.loc 1 77 21 discriminator 1
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	error_at@PLT
.L14:
	.loc 1 78 6
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	declare_enum
	.loc 1 79 22
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
.LBE4:
	.loc 1 86 4
	jmp	.L18
.L13:
.LBB5:
	.loc 1 81 22
	mov	rdx, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 82 22
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR enumerations[rip], rax
	.loc 1 83 22
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 7
.LBE5:
	.loc 1 86 4
	jmp	.L18
.L16:
	.loc 1 29 4
	nop
	jmp	.L3
.L17:
	.loc 1 59 4
	nop
	jmp	.L3
.L18:
	.loc 1 86 4
	nop
.L3:
	.loc 1 89 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 90 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
.LFB1:
	.loc 1 92 23
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	.loc 1 93 19
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 94 6
	mov	DWORD PTR -12[rbp], 0
	.loc 1 95 6
	mov	DWORD PTR -16[rbp], 0
	.loc 1 98 5
	mov	esi, 0
	lea	rdi, .LC2[rip]
	call	consume_reserved_word@PLT
	.loc 1 98 4
	test	al, al
	je	.L20
	.loc 1 99 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 0
	.loc 1 100 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L20:
	.loc 1 101 11
	mov	esi, 0
	lea	rdi, .LC3[rip]
	call	consume_reserved_word@PLT
	.loc 1 101 10
	test	al, al
	je	.L22
	.loc 1 102 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 1
	.loc 1 103 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L22:
	.loc 1 104 11
	mov	esi, 0
	lea	rdi, .LC4[rip]
	call	consume_reserved_word@PLT
	.loc 1 104 10
	test	al, al
	je	.L23
	.loc 1 105 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 2
	.loc 1 106 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L23:
	.loc 1 107 11
	mov	esi, 0
	lea	rdi, .LC5[rip]
	call	consume_reserved_word@PLT
	.loc 1 107 10
	test	al, al
	je	.L24
	.loc 1 108 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 3
	.loc 1 109 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L24:
	.loc 1 110 11
	mov	esi, 0
	lea	rdi, .LC6[rip]
	call	consume_reserved_word@PLT
	.loc 1 110 10
	test	al, al
	je	.L25
	.loc 1 111 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 6
	.loc 1 112 10
	call	consume_ident@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L25:
	.loc 1 113 11
	mov	esi, 0
	lea	rdi, .LC7[rip]
	call	consume_reserved_word@PLT
	.loc 1 113 10
	test	al, al
	je	.L26
	.loc 1 114 12
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 7
	.loc 1 115 10
	call	consume_ident@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L26:
.LBB6:
	.loc 1 117 16
	call	consume_ident@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 118 25
	mov	edx, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 119 5
	cmp	QWORD PTR -32[rbp], 0
	je	.L27
	.loc 1 120 24
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 120 13
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 121 24
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 24[rax]
	.loc 1 121 13
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	.loc 1 122 15
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	set_type
	mov	QWORD PTR -8[rbp], rax
	jmp	.L21
.L27:
	.loc 1 124 4
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	error_at@PLT
.L21:
.LBE6:
	.loc 1 128 16
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 128 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rdx], eax
	.loc 1 129 16
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 129 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 20[rdx], eax
	.loc 1 132 7
	jmp	.L28
.L30:
	.loc 1 133 13
	add	DWORD PTR -12[rbp], 1
	.loc 1 134 16
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 134 9
	mov	QWORD PTR token[rip], rax
.L28:
	.loc 1 132 13
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 132 7
	cmp	eax, 1
	jne	.L29
	.loc 1 132 45 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 132 38 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 132 35 discriminator 1
	cmp	al, 42
	je	.L30
.L29:
	.loc 1 138 9
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type
	mov	QWORD PTR -8[rbp], rax
	.loc 1 140 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 141 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	parse_type, .-parse_type
	.globl	insert_ptr_type
	.type	insert_ptr_type, @function
insert_ptr_type:
.LFB2:
	.loc 1 143 50
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	.loc 1 145 4
	cmp	DWORD PTR -28[rbp], 0
	je	.L33
.LBB7:
	.loc 1 146 11
	mov	DWORD PTR -12[rbp], 0
	.loc 1 146 3
	jmp	.L34
.L35:
	.loc 1 147 14 discriminator 3
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 148 20 discriminator 3
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 4
	.loc 1 149 22 discriminator 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 149 20 discriminator 3
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rdx], eax
	.loc 1 150 22 discriminator 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 150 20 discriminator 3
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 20[rdx], eax
	.loc 1 151 20 discriminator 3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 152 9 discriminator 3
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -24[rbp], rax
	.loc 1 146 31 discriminator 3
	add	DWORD PTR -12[rbp], 1
.L34:
	.loc 1 146 3 discriminator 1
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L35
.LBE7:
	.loc 1 155 10
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L36
.L33:
	.loc 1 157 10
	mov	rax, QWORD PTR -24[rbp]
.L36:
	.loc 1 159 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
.LFB3:
	.loc 1 161 81
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
	.loc 1 163 4
	cmp	QWORD PTR -64[rbp], 0
	jne	.L38
	.loc 1 163 30 discriminator 1
	mov	rax, QWORD PTR token[rip]
	.loc 1 163 16 discriminator 1
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	error_at@PLT
.L38:
	.loc 1 167 15
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 168 13
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 23
	.loc 1 170 15
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 171 13
	mov	rdx, QWORD PTR globals[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 172 23
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 172 13
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 173 23
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 173 13
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 174 13
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 175 6
	mov	rax, QWORD PTR -40[rbp]
	mov	rbx, QWORD PTR 16[rax]
	.loc 1 175 22
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 175 20
	mov	DWORD PTR 16[rbx], eax
	.loc 1 176 6
	mov	rax, QWORD PTR -40[rbp]
	mov	rbx, QWORD PTR 16[rax]
	.loc 1 176 22
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 176 20
	mov	DWORD PTR 20[rbx], eax
	.loc 1 179 15
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -52[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type
	.loc 1 179 13
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 182 5
	lea	rdi, .LC10[rip]
	call	check@PLT
	.loc 1 182 4
	test	al, al
	je	.L39
.LBB8:
	.loc 1 183 7
	mov	DWORD PTR -24[rbp], -1
	.loc 1 184 14
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], -1
	.loc 1 185 14
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 25
	.loc 1 186 8
	jmp	.L40
.L44:
	.loc 1 187 14
	mov	DWORD PTR -20[rbp], -1
	.loc 1 188 8
	lea	rdi, .LC11[rip]
	call	check@PLT
	.loc 1 188 7
	xor	eax, 1
	.loc 1 188 6
	test	al, al
	je	.L41
	.loc 1 190 7
	cmp	DWORD PTR -24[rbp], -1
	jne	.L42
	.loc 1 191 19
	mov	rax, QWORD PTR token[rip]
	.loc 1 191 12
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -24[rbp], eax
	jmp	.L43
.L42:
	.loc 1 193 20
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	.loc 1 193 12
	mov	edx, DWORD PTR -24[rbp]
	imul	eax, edx
	mov	DWORD PTR -24[rbp], eax
.L43:
	.loc 1 195 22
	mov	rax, QWORD PTR token[rip]
	.loc 1 195 15
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -20[rbp], eax
	.loc 1 196 18
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 196 11
	mov	QWORD PTR token[rip], rax
.L41:
	.loc 1 199 14
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 200 25
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], 5
	.loc 1 201 31
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 201 25
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 202 25
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 24[rax], edx
	.loc 1 203 27
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 203 25
	mov	rdx, QWORD PTR -48[rbp]
	mov	DWORD PTR 16[rdx], eax
	.loc 1 204 27
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 204 25
	mov	rdx, QWORD PTR -48[rbp]
	mov	DWORD PTR 20[rdx], eax
	.loc 1 205 15
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 206 4
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L40:
	.loc 1 186 9
	lea	rdi, .LC10[rip]
	call	consume@PLT
	.loc 1 186 8
	test	al, al
	jne	.L44
	.loc 1 208 19
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	eax, DWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	.loc 1 208 17
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rdx], eax
.LBE8:
	jmp	.L45
.L39:
	.loc 1 210 20
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 210 18
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rdx], eax
.L45:
	.loc 1 214 10
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR globals[rip], rax
	.loc 1 216 19
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 216 13
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 217 19
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 8[rax]
	.loc 1 217 13
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 56[rax], rdx
	.loc 1 218 19
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR [rax]
	.loc 1 218 13
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], edx
	.loc 1 220 9
	mov	rax, QWORD PTR -32[rbp]
	.loc 1 221 1
	add	rsp, 72
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	declare_global_variable, .-declare_global_variable
	.section	.rodata
	.align 8
.LC12:
	.string	"this variable has already existed."
	.text
	.globl	declare_local_variable
	.type	declare_local_variable, @function
declare_local_variable:
.LFB4:
	.loc 1 223 69
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
	.loc 1 224 6
	mov	DWORD PTR -12[rbp], 1
	.loc 1 225 15
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_lvar@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 226 4
	cmp	QWORD PTR -24[rbp], 0
	je	.L48
	.loc 1 226 25 discriminator 1
	mov	rax, QWORD PTR token[rip]
	.loc 1 226 11 discriminator 1
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	error_at@PLT
.L48:
	.loc 1 228 9
	mov	esi, 32
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 229 13
	mov	rdx, QWORD PTR locals[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 230 18
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 230 13
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 231 18
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 231 13
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 232 19
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 40[rax]
	.loc 1 232 13
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 235 5
	lea	rdi, .LC10[rip]
	call	check@PLT
	.loc 1 235 4
	test	al, al
	je	.L49
.LBB9:
	.loc 1 238 7
	mov	DWORD PTR -28[rbp], 0
	.loc 1 239 7
	mov	DWORD PTR -8[rbp], -1
	.loc 1 240 14
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], 24
	.loc 1 241 8
	jmp	.L50
.L54:
	.loc 1 242 14
	mov	DWORD PTR -4[rbp], -1
	.loc 1 243 8
	lea	rdi, .LC11[rip]
	call	check@PLT
	.loc 1 243 7
	xor	eax, 1
	.loc 1 243 6
	test	al, al
	je	.L51
	.loc 1 244 7
	cmp	DWORD PTR -8[rbp], -1
	jne	.L52
	.loc 1 245 19
	mov	rax, QWORD PTR token[rip]
	.loc 1 245 12
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -8[rbp], eax
	jmp	.L53
.L52:
	.loc 1 247 20
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	.loc 1 247 12
	mov	edx, DWORD PTR -8[rbp]
	imul	eax, edx
	mov	DWORD PTR -8[rbp], eax
.L53:
	.loc 1 250 22
	mov	rax, QWORD PTR token[rip]
	.loc 1 250 15
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	.loc 1 251 22
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 251 15
	mov	QWORD PTR token[rip], rax
.L51:
	.loc 1 254 14
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 255 25
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], 5
	.loc 1 256 31
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 256 25
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 257 25
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 24[rax], edx
	.loc 1 258 27
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 258 25
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 16[rdx], eax
	.loc 1 259 27
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 259 25
	mov	rdx, QWORD PTR -40[rbp]
	mov	DWORD PTR 20[rdx], eax
	.loc 1 260 15
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 262 4
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L50:
	.loc 1 241 9
	lea	rdi, .LC10[rip]
	call	consume@PLT
	.loc 1 241 8
	test	al, al
	jne	.L54
	.loc 1 265 11
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	eax, DWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR -28[rbp], eax
	.loc 1 266 14
	mov	edx, DWORD PTR alloc_size[rip]
	mov	eax, DWORD PTR -28[rbp]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	.loc 1 267 28
	mov	rax, QWORD PTR locals[rip]
	.loc 1 267 47
	test	rax, rax
	je	.L55
	.loc 1 267 37 discriminator 1
	mov	rax, QWORD PTR locals[rip]
	.loc 1 267 47 discriminator 1
	mov	eax, DWORD PTR 4[rax]
	jmp	.L56
.L55:
	.loc 1 267 47 is_stmt 0 discriminator 2
	mov	eax, 0
.L56:
	.loc 1 267 52 is_stmt 1 discriminator 4
	mov	edx, DWORD PTR -28[rbp]
	add	edx, eax
	.loc 1 267 16 discriminator 4
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
.LBE9:
	jmp	.L57
.L49:
	.loc 1 269 10
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 269 16
	mov	eax, DWORD PTR [rax]
	.loc 1 269 5
	cmp	eax, 6
	jne	.L58
	.loc 1 270 29
	mov	rax, QWORD PTR locals[rip]
	.loc 1 270 67
	test	rax, rax
	je	.L59
	.loc 1 270 38 discriminator 1
	mov	rax, QWORD PTR locals[rip]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 270 54 discriminator 1
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 270 60 discriminator 1
	mov	eax, DWORD PTR 16[rax]
	.loc 1 270 67 discriminator 1
	add	eax, edx
	jmp	.L60
.L59:
	.loc 1 270 73 discriminator 2
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 270 67 discriminator 2
	mov	eax, DWORD PTR 16[rax]
.L60:
	.loc 1 270 17 discriminator 4
	mov	rdx, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rdx], eax
	.loc 1 271 24 discriminator 4
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 271 30 discriminator 4
	mov	edx, DWORD PTR 16[rax]
	.loc 1 271 17 discriminator 4
	mov	eax, DWORD PTR alloc_size[rip]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	jmp	.L57
.L58:
	.loc 1 273 29
	mov	rax, QWORD PTR locals[rip]
	.loc 1 273 50
	test	rax, rax
	je	.L61
	.loc 1 273 38 discriminator 1
	mov	rax, QWORD PTR locals[rip]
	mov	eax, DWORD PTR 4[rax]
	.loc 1 273 50 discriminator 1
	lea	edx, 8[rax]
	jmp	.L62
.L61:
	.loc 1 273 50 is_stmt 0 discriminator 2
	mov	edx, 8
.L62:
	.loc 1 273 17 is_stmt 1 discriminator 4
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	.loc 1 274 17 discriminator 4
	mov	eax, DWORD PTR alloc_size[rip]
	add	eax, 8
	mov	DWORD PTR alloc_size[rip], eax
.L57:
	.loc 1 278 19
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 278 13
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 279 21
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 279 15
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 64[rax], edx
	.loc 1 281 9
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR locals[rip], rax
	.loc 1 283 9
	mov	rax, QWORD PTR -56[rbp]
	.loc 1 284 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
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
.LFB5:
	.loc 1 286 46
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi
	.loc 1 288 6
	mov	DWORD PTR -28[rbp], 0
	.loc 1 289 10
	mov	QWORD PTR -40[rbp], 0
	.loc 1 290 10
	mov	QWORD PTR -16[rbp], 0
.L81:
.LBB10:
	.loc 1 293 13
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 293 5
	test	eax, eax
	je	.L65
	.loc 1 293 34 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -28[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	.loc 1 293 6 discriminator 1
	test	rax, rax
	jne	.L65
	.loc 1 294 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 294 4
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	call	error_at@PLT
.L65:
	.loc 1 297 14
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 300 23
	call	parse_type
	.loc 1 300 21
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 24[rdx], rax
	.loc 1 301 31
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 301 37
	mov	edx, DWORD PTR 16[rax]
	.loc 1 301 21
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 8[rax], edx
	.loc 1 304 22
	call	consume_ident@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 305 30
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 305 20
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 306 30
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 306 20
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 309 7
	mov	DWORD PTR -20[rbp], -1
	.loc 1 312 8
	jmp	.L66
.L69:
	.loc 1 313 6
	cmp	DWORD PTR -20[rbp], -1
	jne	.L67
	.loc 1 314 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 314 11
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -20[rbp], eax
	jmp	.L68
.L67:
	.loc 1 316 19
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR 16[rax]
	.loc 1 316 11
	mov	edx, DWORD PTR -20[rbp]
	imul	eax, edx
	mov	DWORD PTR -20[rbp], eax
.L68:
	.loc 1 318 21
	mov	rax, QWORD PTR token[rip]
	.loc 1 318 14
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -56[rbp], eax
	.loc 1 319 17
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 319 10
	mov	QWORD PTR token[rip], rax
	.loc 1 321 14
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -64[rbp], rax
	.loc 1 322 24
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR [rax], 5
	.loc 1 323 34
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 323 24
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 324 24
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR -56[rbp]
	mov	DWORD PTR 24[rax], edx
	.loc 1 325 21
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	type_size@PLT
	.loc 1 325 19
	mov	rdx, QWORD PTR -64[rbp]
	mov	DWORD PTR 16[rdx], eax
	.loc 1 326 21
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	type_align@PLT
	.loc 1 326 19
	mov	rdx, QWORD PTR -64[rbp]
	mov	DWORD PTR 20[rdx], eax
	.loc 1 327 19
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 329 4
	lea	rdi, .LC11[rip]
	call	expect@PLT
.L66:
	.loc 1 312 9
	lea	rdi, .LC10[rip]
	call	consume@PLT
	.loc 1 312 8
	test	al, al
	jne	.L69
	.loc 1 333 7
	mov	DWORD PTR -24[rbp], 0
	.loc 1 334 14
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 334 20
	mov	eax, DWORD PTR [rax]
	.loc 1 334 5
	cmp	eax, 5
	jne	.L70
	.loc 1 335 17
	mov	DWORD PTR -4[rbp], 8
	jmp	.L71
.L70:
	.loc 1 336 21
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 336 27
	mov	eax, DWORD PTR [rax]
	.loc 1 336 12
	cmp	eax, 6
	jne	.L72
	.loc 1 337 17
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -4[rbp], eax
	jmp	.L71
.L72:
	.loc 1 339 27
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 339 17
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
.L71:
	.loc 1 342 5
	cmp	QWORD PTR -16[rbp], 0
	je	.L73
.LBB11:
	.loc 1 343 81
	cmp	QWORD PTR -16[rbp], 0
	je	.L74
	.loc 1 343 47 discriminator 1
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 343 67 discriminator 1
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 343 73 discriminator 1
	mov	eax, DWORD PTR 16[rax]
	.loc 1 343 81 discriminator 1
	add	eax, edx
	jmp	.L75
.L74:
	.loc 1 343 81 is_stmt 0 discriminator 2
	mov	eax, 0
.L75:
	.loc 1 343 8 is_stmt 1 discriminator 4
	mov	DWORD PTR -52[rbp], eax
	.loc 1 344 44 discriminator 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 344 50 discriminator 4
	mov	ecx, DWORD PTR 20[rax]
	.loc 1 344 34 discriminator 4
	mov	eax, DWORD PTR -52[rbp]
	cdq
	idiv	ecx
	mov	eax, edx
	.loc 1 344 123 discriminator 4
	test	eax, eax
	je	.L76
	.loc 1 344 70 discriminator 1
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 344 76 discriminator 1
	mov	ecx, DWORD PTR 20[rax]
	.loc 1 344 107 discriminator 1
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 344 113 discriminator 1
	mov	esi, DWORD PTR 20[rax]
	.loc 1 344 97 discriminator 1
	mov	eax, DWORD PTR -52[rbp]
	cdq
	idiv	esi
	mov	eax, edx
	.loc 1 344 123 discriminator 1
	sub	ecx, eax
	mov	eax, ecx
	jmp	.L77
.L76:
	.loc 1 344 123 is_stmt 0 discriminator 2
	mov	eax, 0
.L77:
	.loc 1 344 21 is_stmt 1 discriminator 4
	mov	DWORD PTR -24[rbp], eax
	.loc 1 345 33 discriminator 4
	mov	edx, DWORD PTR -52[rbp]
	mov	eax, DWORD PTR -24[rbp]
	add	edx, eax
	.loc 1 345 21 discriminator 4
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rax], edx
.LBE11:
	jmp	.L78
.L73:
	.loc 1 347 21
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR 4[rax], 0
.L78:
	.loc 1 349 16
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 349 32
	mov	ecx, DWORD PTR -4[rbp]
	mov	edx, DWORD PTR -24[rbp]
	add	edx, ecx
	.loc 1 349 16
	add	edx, eax
	mov	rax, QWORD PTR -72[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 351 18
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rax], rdx
	.loc 1 352 18
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	.loc 1 354 3
	lea	rdi, .LC14[rip]
	call	expect@PLT
	.loc 1 355 6
	lea	rdi, .LC15[rip]
	call	consume@PLT
	.loc 1 355 5
	test	al, al
	jne	.L86
.LBE10:
	.loc 1 292 10
	jmp	.L81
.L86:
.LBB12:
	.loc 1 355 3
	nop
.LBE12:
	.loc 1 358 19
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 358 34
	and	eax, 7
	.loc 1 358 55
	test	eax, eax
	je	.L82
	.loc 1 358 37 discriminator 1
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 358 48 discriminator 1
	lea	edx, 7[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 3
	.loc 1 358 52 discriminator 1
	add	eax, 1
	.loc 1 358 55 discriminator 1
	sal	eax, 3
	jmp	.L83
.L82:
	.loc 1 358 55 is_stmt 0 discriminator 2
	mov	rax, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR [rax]
.L83:
	.loc 1 358 15 is_stmt 1 discriminator 4
	mov	rdx, QWORD PTR -72[rbp]
	mov	DWORD PTR [rdx], eax
	.loc 1 359 9 discriminator 4
	mov	rax, QWORD PTR -16[rbp]
	.loc 1 360 1 discriminator 4
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	register_struc_member, .-register_struc_member
	.globl	declare_struct
	.type	declare_struct, @function
declare_struct:
.LFB6:
	.loc 1 362 38
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	.loc 1 363 6
	mov	DWORD PTR -4[rbp], 0
	.loc 1 365 23
	lea	rax, -4[rbp]
	mov	rdi, rax
	call	register_struc_member
	.loc 1 365 21
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 366 21
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], edx
	.loc 1 367 21
	mov	rdx, QWORD PTR structs[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 368 10
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR structs[rip], rax
	.loc 1 369 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
.LFB7:
	.loc 1 371 35
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	.loc 1 372 6
	mov	DWORD PTR -4[rbp], 0
	.loc 1 373 10
	mov	QWORD PTR -24[rbp], 0
	.loc 1 374 10
	mov	QWORD PTR -16[rbp], 0
.L95:
.LBB13:
	.loc 1 377 14
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 379 11
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 379 5
	cmp	eax, 2
	je	.L89
	.loc 1 379 45 discriminator 1
	mov	rax, QWORD PTR token[rip]
	.loc 1 379 31 discriminator 1
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC16[rip]
	mov	rdi, rax
	call	error_at@PLT
.L89:
	.loc 1 381 22
	call	consume_ident@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 382 30
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 382 20
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 383 30
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 383 20
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 385 6
	lea	rdi, .LC17[rip]
	call	consume@PLT
	.loc 1 385 5
	test	al, al
	je	.L90
	.loc 1 386 12
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 386 6
	cmp	eax, 3
	je	.L91
	.loc 1 387 19
	mov	rax, QWORD PTR token[rip]
	.loc 1 387 5
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	call	error_at@PLT
.L91:
	.loc 1 390 28
	mov	rax, QWORD PTR token[rip]
	.loc 1 390 21
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	.loc 1 391 21
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 4[rax], edx
	.loc 1 392 28
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 392 21
	mov	QWORD PTR token[rip], rax
	jmp	.L92
.L90:
	.loc 1 394 21
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 4[rax], edx
	.loc 1 395 11
	add	DWORD PTR -4[rbp], 1
.L92:
	.loc 1 398 20
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rax], rdx
	.loc 1 399 20
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -16[rbp], rax
	.loc 1 401 6
	lea	rdi, .LC19[rip]
	call	consume@PLT
	.loc 1 402 6
	lea	rdi, .LC15[rip]
	call	consume@PLT
	.loc 1 402 5
	test	al, al
	jne	.L98
.LBE13:
	.loc 1 376 10
	jmp	.L95
.L98:
.LBB14:
	.loc 1 402 3
	nop
.LBE14:
	.loc 1 405 9
	mov	rax, QWORD PTR -16[rbp]
	.loc 1 406 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	register_enum_member, .-register_enum_member
	.globl	declare_enum
	.type	declare_enum, @function
declare_enum:
.LFB8:
	.loc 1 408 34
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	.loc 1 409 21
	call	register_enum_member
	.loc 1 409 19
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 410 19
	mov	rdx, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 411 19
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR enumerations[rip], rax
	.loc 1 412 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	declare_enum, .-declare_enum
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "../include/cc_sakura.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x10a0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF217
	.byte	0xc
	.long	.LASF218
	.long	.LASF219
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
	.long	.LASF220
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
	.long	0xa83
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	locals
	.uleb128 0x18
	.long	0xa90
	.byte	0x1
	.byte	0x4
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	globals
	.uleb128 0x18
	.long	0xaaa
	.byte	0x1
	.byte	0x5
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	structs
	.uleb128 0x18
	.long	0xab7
	.byte	0x1
	.byte	0x6
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	enumerations
	.uleb128 0x18
	.long	0xac4
	.byte	0x1
	.byte	0x7
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	defined_types
	.uleb128 0x18
	.long	0xaeb
	.byte	0x1
	.byte	0x8
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	outside_lvar
	.uleb128 0x18
	.long	0xaf8
	.byte	0x1
	.byte	0x9
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	outside_struct
	.uleb128 0x18
	.long	0xb05
	.byte	0x1
	.byte	0xa
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	outside_enum
	.uleb128 0x18
	.long	0xb12
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.uleb128 0x9
	.byte	0x3
	.quad	outside_deftype
	.uleb128 0x19
	.long	.LASF187
	.byte	0x1
	.value	0x198
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xc0b
	.uleb128 0x1a
	.long	.LASF189
	.byte	0x1
	.value	0x198
	.byte	0x19
	.long	0xa03
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	.LASF192
	.byte	0x1
	.value	0x173
	.byte	0x9
	.long	0x9f7
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xc75
	.uleb128 0x1c
	.long	.LASF183
	.byte	0x1
	.value	0x174
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.long	.LASF184
	.byte	0x1
	.value	0x175
	.byte	0xa
	.long	0x9f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF185
	.byte	0x1
	.value	0x176
	.byte	0xa
	.long	0x9f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x90
	.uleb128 0x1c
	.long	.LASF186
	.byte	0x1
	.value	0x17d
	.byte	0xa
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF188
	.byte	0x1
	.value	0x16a
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xcb5
	.uleb128 0x1a
	.long	.LASF190
	.byte	0x1
	.value	0x16a
	.byte	0x1c
	.long	0x9fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF191
	.byte	0x1
	.value	0x16b
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.long	.LASF193
	.byte	0x1
	.value	0x11e
	.byte	0x9
	.long	0x9f7
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xda5
	.uleb128 0x1a
	.long	.LASF194
	.byte	0x1
	.value	0x11e
	.byte	0x24
	.long	0xda5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1c
	.long	.LASF195
	.byte	0x1
	.value	0x11f
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.long	.LASF196
	.byte	0x1
	.value	0x120
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.long	.LASF184
	.byte	0x1
	.value	0x121
	.byte	0xa
	.long	0x9f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.long	.LASF185
	.byte	0x1
	.value	0x122
	.byte	0xa
	.long	0x9f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x60
	.uleb128 0x1c
	.long	.LASF186
	.byte	0x1
	.value	0x130
	.byte	0xa
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.long	.LASF197
	.byte	0x1
	.value	0x135
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.long	.LASF198
	.byte	0x1
	.value	0x136
	.byte	0x7
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1c
	.long	.LASF199
	.byte	0x1
	.value	0x137
	.byte	0x9
	.long	0x9b6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1c
	.long	.LASF200
	.byte	0x1
	.value	0x14d
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x1c
	.long	.LASF201
	.byte	0x1
	.value	0x157
	.byte	0x8
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x65
	.uleb128 0x1f
	.long	.LASF202
	.byte	0x1
	.byte	0xdf
	.byte	0x7
	.long	0x9c2
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xe6a
	.uleb128 0x20
	.long	.LASF203
	.byte	0x1
	.byte	0xdf
	.byte	0x24
	.long	0x9c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x21
	.string	"tok"
	.byte	0x1
	.byte	0xdf
	.byte	0x31
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF204
	.byte	0x1
	.byte	0xdf
	.byte	0x3a
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x22
	.long	.LASF205
	.byte	0x1
	.byte	0xe0
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x22
	.long	.LASF206
	.byte	0x1
	.byte	0xe1
	.byte	0x8
	.long	0x9eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x22
	.long	.LASF199
	.byte	0x1
	.byte	0xec
	.byte	0x9
	.long	0x9b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xed
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.long	.LASF191
	.byte	0x1
	.byte	0xee
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x22
	.long	.LASF197
	.byte	0x1
	.byte	0xef
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF207
	.byte	0x1
	.byte	0xa1
	.byte	0x7
	.long	0x9c2
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0xf1a
	.uleb128 0x20
	.long	.LASF204
	.byte	0x1
	.byte	0xa1
	.byte	0x23
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF186
	.byte	0x1
	.byte	0xa1
	.byte	0x36
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.long	.LASF208
	.byte	0x1
	.byte	0xa1
	.byte	0x46
	.long	0x9b6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xa5
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x22
	.long	.LASF199
	.byte	0x1
	.byte	0xa6
	.byte	0x8
	.long	0x9b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF203
	.byte	0x1
	.byte	0xa7
	.byte	0x8
	.long	0x9c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.long	.LASF209
	.byte	0x1
	.byte	0xaa
	.byte	0x8
	.long	0x9e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x22
	.long	.LASF197
	.byte	0x1
	.byte	0xb7
	.byte	0x7
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF210
	.byte	0x1
	.byte	0x8f
	.byte	0x7
	.long	0x9b6
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xf89
	.uleb128 0x20
	.long	.LASF211
	.byte	0x1
	.byte	0x8f
	.byte	0x1d
	.long	0x9b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF204
	.byte	0x1
	.byte	0x8f
	.byte	0x27
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x22
	.long	.LASF199
	.byte	0x1
	.byte	0x90
	.byte	0x8
	.long	0x9b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x23
	.string	"i"
	.byte	0x1
	.byte	0x92
	.byte	0xb
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF212
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.long	0x9b6
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x1009
	.uleb128 0x22
	.long	.LASF135
	.byte	0x1
	.byte	0x5d
	.byte	0x8
	.long	0x9b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF204
	.byte	0x1
	.byte	0x5e
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x22
	.long	.LASF196
	.byte	0x1
	.byte	0x5f
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x23
	.string	"tok"
	.byte	0x1
	.byte	0x75
	.byte	0xa
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF213
	.byte	0x1
	.byte	0x76
	.byte	0xd
	.long	0x9bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF214
	.byte	0x1
	.byte	0x11
	.byte	0x7
	.long	0x9b6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.long	.LASF135
	.byte	0x1
	.byte	0x11
	.byte	0x16
	.long	0x9b6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x21
	.string	"tok"
	.byte	0x1
	.byte	0x11
	.byte	0x23
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x22
	.long	.LASF215
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.long	0xa03
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF216
	.byte	0x1
	.byte	0x13
	.byte	0x9
	.long	0x9fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.long	.LASF196
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.long	.Ldebug_ranges0+0
	.long	0x108d
	.uleb128 0x22
	.long	.LASF190
	.byte	0x1
	.byte	0x2b
	.byte	0xc
	.long	0x9fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x22
	.long	.LASF189
	.byte	0x1
	.byte	0x47
	.byte	0xb
	.long	0xa03
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2-.Ltext0
	.quad	.LBE2-.Ltext0
	.quad	.LBB3-.Ltext0
	.quad	.LBE3-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB4-.Ltext0
	.quad	.LBE4-.Ltext0
	.quad	.LBB5-.Ltext0
	.quad	.LBE5-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB10-.Ltext0
	.quad	.LBE10-.Ltext0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	.LBB14-.Ltext0
	.quad	.LBE14-.Ltext0
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
.LASF191:
	.string	"asize"
.LASF7:
	.string	"size_t"
.LASF109:
	.string	"ND_FOR"
.LASF30:
	.string	"_shortbuf"
.LASF146:
	.string	"Func"
.LASF197:
	.string	"isize"
.LASF211:
	.string	"prev"
.LASF179:
	.string	"outside_struct"
.LASF204:
	.string	"star_count"
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
.LASF210:
	.string	"insert_ptr_type"
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
.LASF205:
	.string	"INSIDE_SCOPE"
.LASF176:
	.string	"labels_head"
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
.LASF201:
	.string	"prev_tail"
.LASF95:
	.string	"ND_GVAR"
.LASF121:
	.string	"ARRAY"
.LASF187:
	.string	"declare_enum"
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
.LASF184:
	.string	"new_memb"
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
.LASF206:
	.string	"lvar"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF214:
	.string	"set_type"
.LASF188:
	.string	"declare_struct"
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
.LASF200:
	.string	"padding"
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
.LASF196:
	.string	"INSIDE_FILE"
.LASF218:
	.string	"../src/declare.c"
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
.LASF203:
	.string	"node"
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
.LASF202:
	.string	"declare_local_variable"
.LASF50:
	.string	"TK_IDENT"
.LASF64:
	.string	"TK_CONTINUE"
.LASF198:
	.string	"index_num"
.LASF163:
	.string	"llid"
.LASF207:
	.string	"declare_global_variable"
.LASF89:
	.string	"ND_ARROW"
.LASF178:
	.string	"outside_lvar"
.LASF189:
	.string	"new_enum"
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
.LASF220:
	.string	"_IO_lock_t"
.LASF130:
	.string	"_IO_FILE"
.LASF90:
	.string	"ND_PREID"
.LASF190:
	.string	"new_struc"
.LASF54:
	.string	"TK_SWITCH"
.LASF213:
	.string	"def_found"
.LASF93:
	.string	"ND_DEREF"
.LASF212:
	.string	"parse_type"
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
.LASF192:
	.string	"register_enum_member"
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
.LASF199:
	.string	"newtype"
.LASF209:
	.string	"gvar"
.LASF98:
	.string	"ND_STR"
.LASF2:
	.string	"unsigned char"
.LASF195:
	.string	"size_of_type"
.LASF219:
	.string	"/home/takana/git/cc_sakura/self_host"
.LASF107:
	.string	"ND_IFELSE"
.LASF5:
	.string	"short int"
.LASF183:
	.string	"counter"
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
.LASF185:
	.string	"memb_head"
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
.LASF217:
	.string	"GNU C11 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c11 -fasynchronous-unwind-tables"
.LASF108:
	.string	"ND_SWITCH"
.LASF68:
	.string	"TK_THREAD_LOCAL"
.LASF216:
	.string	"struc_found"
.LASF208:
	.string	"toplv_type"
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
.LASF193:
	.string	"register_struc_member"
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
.LASF215:
	.string	"enum_found"
.LASF194:
	.string	"asize_ptr"
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
.LASF186:
	.string	"def_name"
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
