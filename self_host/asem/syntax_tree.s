	.file	"syntax_tree.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.comm	alloc_size,4,4
	.comm	token,8,8
	.comm	strings,8,8
	.section	.rodata
.LC0:
	.string	"("
.LC1:
	.string	")"
.LC2:
	.string	"\""
	.align 8
.LC3:
	.string	"this variable is not declaration"
	.text
	.globl	data
	.type	data, @function
data:
.LFB0:
	.file 1 "../src/syntax_tree.c"
	.loc 1 9 17
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	.loc 1 10 5
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 10 4
	test	al, al
	je	.L2
.LBB2:
	.loc 1 11 16
	call	expr
	mov	QWORD PTR -104[rbp], rax
	.loc 1 12 3
	lea	rdi, .LC1[rip]
	call	expect@PLT
	.loc 1 13 10
	mov	rax, QWORD PTR -104[rbp]
	jmp	.L3
.L2:
.LBE2:
	.loc 1 17 10
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 17 4
	cmp	eax, 21
	jne	.L4
.LBB3:
	.loc 1 18 16
	mov	eax, 0
	call	compiler_directive@PLT
	mov	QWORD PTR -96[rbp], rax
	.loc 1 19 10
	mov	rax, QWORD PTR -96[rbp]
	jmp	.L3
.L4:
.LBE3:
	.loc 1 23 10
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 23 4
	cmp	eax, 14
	jne	.L5
.LBB4:
	.loc 1 24 3
	lea	rdi, .LC2[rip]
	call	consume@PLT
	.loc 1 25 16
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -64[rbp], rax
	.loc 1 26 14
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR [rax], 26
	.loc 1 27 16
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	.loc 1 27 14
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 28 7
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 28 18
	mov	DWORD PTR [rax], 4
	.loc 1 30 16
	call	consume_string@PLT
	mov	QWORD PTR -72[rbp], rax
	.loc 1 31 15
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	find_string@PLT
	mov	QWORD PTR -80[rbp], rax
	.loc 1 34 5
	cmp	QWORD PTR -80[rbp], 0
	je	.L6
	.loc 1 35 20
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR 8[rax]
	.loc 1 35 14
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 56[rax], rdx
	.loc 1 36 20
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 36 14
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 48[rax], edx
	.loc 1 37 23
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR [rax]
	.loc 1 37 17
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 64[rax], edx
	jmp	.L7
.L6:
.LBB5:
	.loc 1 40 15
	mov	esi, 24
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -88[rbp], rax
	.loc 1 41 18
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 41 13
	mov	rax, QWORD PTR -88[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 42 18
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 42 13
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 43 29
	mov	rax, QWORD PTR strings[rip]
	.loc 1 43 52
	test	rax, rax
	je	.L8
	.loc 1 43 38 discriminator 1
	mov	rax, QWORD PTR strings[rip]
	mov	eax, DWORD PTR 4[rax]
	.loc 1 43 52 discriminator 1
	lea	edx, 1[rax]
	jmp	.L9
.L8:
	.loc 1 43 52 is_stmt 0 discriminator 2
	mov	edx, 0
.L9:
	.loc 1 43 19 is_stmt 1 discriminator 4
	mov	rax, QWORD PTR -88[rbp]
	mov	DWORD PTR 4[rax], edx
	.loc 1 44 19 discriminator 4
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR 8[rax]
	.loc 1 44 14 discriminator 4
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR 56[rax], rdx
	.loc 1 45 22 discriminator 4
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR [rax]
	.loc 1 45 17 discriminator 4
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 64[rax], edx
	.loc 1 46 19 discriminator 4
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 46 14 discriminator 4
	mov	rax, QWORD PTR -64[rbp]
	mov	DWORD PTR 48[rax], edx
	.loc 1 48 15 discriminator 4
	mov	rax, QWORD PTR strings[rip]
	.loc 1 48 6 discriminator 4
	test	rax, rax
	jne	.L10
	.loc 1 49 13
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR strings[rip], rax
	jmp	.L7
.L10:
	.loc 1 51 15
	mov	rdx, QWORD PTR strings[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 52 13
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR strings[rip], rax
.L7:
.LBE5:
	.loc 1 56 10
	mov	rax, QWORD PTR -64[rbp]
	jmp	.L3
.L5:
.LBE4:
	.loc 1 60 6
	mov	DWORD PTR -12[rbp], 0
	.loc 1 61 15
	call	consume_ident@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 62 4
	cmp	QWORD PTR -24[rbp], 0
	je	.L11
.LBB6:
	.loc 1 63 16
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 65 16
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_lvar@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 66 5
	cmp	QWORD PTR -32[rbp], 0
	je	.L12
	.loc 1 67 24
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 67 30
	mov	eax, DWORD PTR [rax]
	.loc 1 67 56
	cmp	eax, 5
	jne	.L13
	.loc 1 67 56 is_stmt 0 discriminator 1
	mov	edx, 24
	jmp	.L14
.L13:
	.loc 1 67 56 discriminator 2
	mov	edx, 22
.L14:
	.loc 1 67 17 is_stmt 1 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 68 23 discriminator 4
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 4[rax]
	.loc 1 68 17 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 64[rax], edx
	.loc 1 69 23 discriminator 4
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 69 17 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L15
.L12:
	.loc 1 71 12
	lea	rdi, .LC0[rip]
	call	check@PLT
	.loc 1 71 11
	test	al, al
	je	.L16
.LBB7:
	.loc 1 72 19
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	find_func@PLT
	mov	QWORD PTR -56[rbp], rax
	.loc 1 73 6
	cmp	QWORD PTR -56[rbp], 0
	je	.L17
	.loc 1 74 24
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 74 16
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L18
.L17:
	.loc 1 76 18
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	.loc 1 76 16
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 77 9
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	.loc 1 77 20
	mov	DWORD PTR [rax], 3
.L18:
	.loc 1 80 11
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	call_function@PLT
	mov	QWORD PTR -8[rbp], rax
.LBE7:
	jmp	.L15
.L16:
.LBB8:
	.loc 1 82 17
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	find_gvar@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 83 6
	cmp	QWORD PTR -40[rbp], 0
	je	.L19
	.loc 1 85 23
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 85 29
	mov	eax, DWORD PTR [rax]
	.loc 1 85 55
	cmp	eax, 5
	jne	.L20
	.loc 1 85 55 is_stmt 0 discriminator 1
	mov	edx, 25
	jmp	.L21
.L20:
	.loc 1 85 55 discriminator 2
	mov	edx, 23
.L21:
	.loc 1 85 16 is_stmt 1 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 86 22 discriminator 4
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 86 16 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 87 21 discriminator 4
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 87 16 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 56[rax], rdx
	.loc 1 88 21 discriminator 4
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 88 16 discriminator 4
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rax], edx
	jmp	.L15
.L19:
.LBB9:
	.loc 1 90 21
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enumerator@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 91 7
	cmp	QWORD PTR -48[rbp], 0
	je	.L22
	.loc 1 92 13
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L15
.L22:
	.loc 1 95 20
	mov	rax, QWORD PTR token[rip]
	.loc 1 95 6
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	error_at@PLT
.L15:
.LBE9:
.LBE8:
	.loc 1 100 10
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L3
.L11:
.LBE6:
	.loc 1 102 16
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 102 10
	cmp	eax, 3
	jne	.L23
	.loc 1 103 10
	call	expect_number@PLT
	mov	edi, eax
	call	new_node_num@PLT
	jmp	.L3
.L23:
	.loc 1 108 9
	mov	edx, 0
	mov	esi, 0
	mov	edi, 32
	call	new_node@PLT
.L3:
	.loc 1 109 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	data, .-data
	.section	.rodata
.LC4:
	.string	"]"
.LC5:
	.string	"["
.LC6:
	.string	"++"
.LC7:
	.string	"--"
.LC8:
	.string	"."
.LC9:
	.string	"->"
	.text
	.globl	primary
	.type	primary, @function
primary:
.LFB1:
	.loc 1 111 20
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 112 15
	call	data
	mov	QWORD PTR -8[rbp], rax
	.loc 1 115 7
	jmp	.L25
.L26:
	.loc 1 116 10
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 117 3
	lea	rdi, .LC4[rip]
	call	expect@PLT
.L25:
	.loc 1 115 8
	lea	rdi, .LC5[rip]
	call	consume@PLT
	.loc 1 115 7
	test	al, al
	jne	.L26
	.loc 1 121 5
	lea	rdi, .LC6[rip]
	call	consume@PLT
	.loc 1 121 4
	test	al, al
	je	.L27
	.loc 1 122 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 2
	mov	rdi, rax
	call	incdec@PLT
	mov	QWORD PTR -8[rbp], rax
.L27:
	.loc 1 126 5
	lea	rdi, .LC7[rip]
	call	consume@PLT
	.loc 1 126 4
	test	al, al
	je	.L29
	.loc 1 127 10
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 3
	mov	rdi, rax
	call	incdec@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 131 7
	jmp	.L29
.L35:
	.loc 1 133 6
	lea	rdi, .LC8[rip]
	call	consume@PLT
	.loc 1 133 5
	test	al, al
	je	.L30
	.loc 1 134 11
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 134 6
	cmp	eax, 22
	jne	.L31
	.loc 1 135 12
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 20
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
.L31:
	.loc 1 137 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 16
	call	dot_arrow@PLT
	mov	QWORD PTR -8[rbp], rax
.L30:
	.loc 1 141 6
	lea	rdi, .LC9[rip]
	call	consume@PLT
	.loc 1 141 5
	test	al, al
	je	.L33
	.loc 1 142 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 17
	call	dot_arrow@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 146 8
	jmp	.L33
.L34:
	.loc 1 147 11
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 148 4
	lea	rdi, .LC4[rip]
	call	expect@PLT
.L33:
	.loc 1 146 9
	lea	rdi, .LC5[rip]
	call	consume@PLT
	.loc 1 146 8
	test	al, al
	jne	.L34
.L29:
	.loc 1 131 8
	lea	rdi, .LC8[rip]
	call	check@PLT
	.loc 1 131 7
	test	al, al
	jne	.L35
	.loc 1 131 22 discriminator 1
	lea	rdi, .LC9[rip]
	call	check@PLT
	.loc 1 131 19 discriminator 1
	test	al, al
	jne	.L35
	.loc 1 152 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 153 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	primary, .-primary
	.section	.rodata
.LC10:
	.string	"!"
.LC11:
	.string	"*"
.LC12:
	.string	"&"
.LC13:
	.string	"+"
.LC14:
	.string	"-"
.LC15:
	.string	"sizeof"
	.text
	.globl	unary
	.type	unary, @function
unary:
.LFB2:
	.loc 1 155 18
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	.loc 1 156 8
	mov	QWORD PTR -24[rbp], 0
	.loc 1 159 5
	lea	rdi, .LC10[rip]
	call	consume@PLT
	.loc 1 159 4
	test	al, al
	je	.L38
	.loc 1 160 10
	call	logical
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 19
	call	new_node@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 161 10
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L39
.L38:
	.loc 1 164 5
	lea	rdi, .LC11[rip]
	call	consume@PLT
	.loc 1 164 4
	test	al, al
	je	.L40
	.loc 1 165 10
	call	unary
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 21
	call	new_node@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 167 10
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L39
.L40:
	.loc 1 170 5
	lea	rdi, .LC12[rip]
	call	consume@PLT
	.loc 1 170 4
	test	al, al
	je	.L41
	.loc 1 171 10
	call	unary
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 20
	call	new_node@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 173 10
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L39
.L41:
	.loc 1 176 5
	lea	rdi, .LC13[rip]
	call	consume@PLT
	.loc 1 176 4
	test	al, al
	je	.L42
	.loc 1 178 10
	call	primary
	jmp	.L39
.L42:
	.loc 1 181 5
	lea	rdi, .LC14[rip]
	call	consume@PLT
	.loc 1 181 4
	test	al, al
	je	.L43
	.loc 1 183 10
	call	primary
	mov	rbx, rax
	mov	edi, 0
	call	new_node_num@PLT
	mov	rdx, rbx
	mov	rsi, rax
	mov	edi, 1
	call	new_node@PLT
	jmp	.L39
.L43:
	.loc 1 187 5
	lea	rdi, .LC6[rip]
	call	consume@PLT
	.loc 1 187 4
	test	al, al
	je	.L44
	.loc 1 188 10
	call	primary
	mov	esi, 0
	mov	rdi, rax
	call	incdec@PLT
	jmp	.L39
.L44:
	.loc 1 192 5
	lea	rdi, .LC7[rip]
	call	consume@PLT
	.loc 1 192 4
	test	al, al
	je	.L45
	.loc 1 193 10
	call	primary
	mov	esi, 1
	mov	rdi, rax
	call	incdec@PLT
	jmp	.L39
.L45:
	.loc 1 196 5
	mov	esi, 12
	lea	rdi, .LC15[rip]
	call	consume_reserved_word@PLT
	.loc 1 196 4
	test	al, al
	je	.L46
	.loc 1 200 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 200 5
	test	al, al
	je	.L47
.LBB10:
	.loc 1 201 8
	mov	DWORD PTR -28[rbp], 0
	.loc 1 202 12
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 202 6
	test	eax, eax
	je	.L48
	.loc 1 202 33 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -28[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	.loc 1 202 30 discriminator 1
	test	rax, rax
	je	.L49
.L48:
.LBB11:
	.loc 1 203 25
	call	parse_type@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 204 12
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 27
	call	new_node@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 205 28
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 16[rax]
	.loc 1 205 15
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 48[rax], edx
.LBE11:
	.loc 1 202 71
	jmp	.L50
.L49:
.LBB12:
	.loc 1 207 20
	call	expr
	mov	QWORD PTR -40[rbp], rax
	.loc 1 208 12
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 27
	call	new_node@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 209 21
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 209 26
	mov	rax, QWORD PTR 40[rax]
	.loc 1 209 32
	mov	edx, DWORD PTR 16[rax]
	.loc 1 209 15
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 48[rax], edx
.L50:
.LBE12:
	.loc 1 211 4
	lea	rdi, .LC1[rip]
	call	expect@PLT
.L47:
.LBE10:
	.loc 1 214 10
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L39
.L46:
	.loc 1 217 9
	call	primary
.L39:
	.loc 1 218 1
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	unary, .-unary
	.section	.rodata
.LC16:
	.string	"/"
.LC17:
	.string	"%"
	.text
	.globl	mul
	.type	mul, @function
mul:
.LFB3:
	.loc 1 220 16
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 222 15
	call	unary
	mov	QWORD PTR -8[rbp], rax
.L57:
	.loc 1 226 6
	lea	rdi, .LC11[rip]
	call	consume@PLT
	.loc 1 226 5
	test	al, al
	je	.L52
	.loc 1 228 11
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L52:
	.loc 1 229 12
	lea	rdi, .LC16[rip]
	call	consume@PLT
	.loc 1 229 11
	test	al, al
	je	.L54
	.loc 1 230 11
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L54:
	.loc 1 231 12
	lea	rdi, .LC17[rip]
	call	consume@PLT
	.loc 1 231 11
	test	al, al
	je	.L55
	.loc 1 232 11
	call	unary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 4
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L57
.L55:
	.loc 1 234 11
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 237 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	mul, .-mul
	.globl	add
	.type	add, @function
add:
.LFB4:
	.loc 1 239 16
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 241 15
	call	mul
	mov	QWORD PTR -8[rbp], rax
.L64:
	.loc 1 244 6
	lea	rdi, .LC13[rip]
	call	consume@PLT
	.loc 1 244 5
	test	al, al
	je	.L60
	.loc 1 245 11
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L64
.L60:
	.loc 1 246 12
	lea	rdi, .LC14[rip]
	call	consume@PLT
	.loc 1 246 11
	test	al, al
	je	.L62
	.loc 1 247 11
	call	mul
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L64
.L62:
	.loc 1 249 11
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 252 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	add, .-add
	.section	.rodata
.LC18:
	.string	">="
.LC19:
	.string	"<="
.LC20:
	.string	">"
.LC21:
	.string	"<"
	.text
	.globl	relational
	.type	relational, @function
relational:
.LFB5:
	.loc 1 254 23
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 255 15
	call	add
	mov	QWORD PTR -8[rbp], rax
.L73:
	.loc 1 259 6
	lea	rdi, .LC18[rip]
	call	consume@PLT
	.loc 1 259 5
	test	al, al
	je	.L67
	.loc 1 260 11
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 6
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L67:
	.loc 1 261 12
	lea	rdi, .LC19[rip]
	call	consume@PLT
	.loc 1 261 11
	test	al, al
	je	.L69
	.loc 1 262 11
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 8
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L69:
	.loc 1 263 12
	lea	rdi, .LC20[rip]
	call	consume@PLT
	.loc 1 263 11
	test	al, al
	je	.L70
	.loc 1 264 11
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 5
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L70:
	.loc 1 265 12
	lea	rdi, .LC21[rip]
	call	consume@PLT
	.loc 1 265 11
	test	al, al
	je	.L71
	.loc 1 266 11
	call	add
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 7
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L73
.L71:
	.loc 1 268 11
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 271 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	relational, .-relational
	.section	.rodata
.LC22:
	.string	"=="
.LC23:
	.string	"!="
	.text
	.globl	equelity
	.type	equelity, @function
equelity:
.LFB6:
	.loc 1 273 21
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 274 15
	call	relational
	mov	QWORD PTR -8[rbp], rax
.L80:
	.loc 1 277 6
	lea	rdi, .LC22[rip]
	call	consume@PLT
	.loc 1 277 5
	test	al, al
	je	.L76
	.loc 1 278 11
	call	relational
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L80
.L76:
	.loc 1 279 12
	lea	rdi, .LC23[rip]
	call	consume@PLT
	.loc 1 279 11
	test	al, al
	je	.L78
	.loc 1 280 11
	call	relational
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L80
.L78:
	.loc 1 282 11
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 285 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	equelity, .-equelity
	.section	.rodata
.LC24:
	.string	"&&"
.LC25:
	.string	"||"
	.text
	.globl	logical
	.type	logical, @function
logical:
.LFB7:
	.loc 1 287 20
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 288 15
	call	equelity
	mov	QWORD PTR -8[rbp], rax
.L87:
	.loc 1 290 6
	lea	rdi, .LC24[rip]
	call	consume@PLT
	.loc 1 290 5
	test	al, al
	je	.L83
	.loc 1 291 11
	call	equelity
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 11
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L87
.L83:
	.loc 1 292 12
	lea	rdi, .LC25[rip]
	call	consume@PLT
	.loc 1 292 11
	test	al, al
	je	.L85
	.loc 1 293 11
	call	equelity
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 12
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L87
.L85:
	.loc 1 295 11
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 298 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	logical, .-logical
	.section	.rodata
.LC26:
	.string	"?"
.LC27:
	.string	":"
	.text
	.globl	ternary
	.type	ternary, @function
ternary:
.LFB8:
	.loc 1 300 20
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 301 15
	call	logical
	mov	QWORD PTR -8[rbp], rax
	.loc 1 302 5
	lea	rdi, .LC26[rip]
	call	consume@PLT
	.loc 1 302 4
	test	al, al
	je	.L90
	.loc 1 304 15
	call	ternary
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 30
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 305 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 305 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 306 3
	lea	rdi, .LC27[rip]
	call	expect@PLT
	.loc 1 308 16
	call	ternary
	.loc 1 308 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rdx], rax
.L90:
	.loc 1 311 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 312 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ternary, .-ternary
	.section	.rodata
.LC28:
	.string	"="
.LC29:
	.string	"+="
.LC30:
	.string	"-="
.LC31:
	.string	"*="
.LC32:
	.string	"/="
	.text
	.globl	assign
	.type	assign, @function
assign:
.LFB9:
	.loc 1 314 19
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	.loc 1 315 15
	call	ternary
	mov	QWORD PTR -8[rbp], rax
	.loc 1 317 5
	lea	rdi, .LC28[rip]
	call	consume@PLT
	.loc 1 317 4
	test	al, al
	je	.L93
	.loc 1 318 10
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L93:
	.loc 1 319 11
	lea	rdi, .LC29[rip]
	call	consume@PLT
	.loc 1 319 10
	test	al, al
	je	.L95
	.loc 1 320 10
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L95:
	.loc 1 321 11
	lea	rdi, .LC30[rip]
	call	consume@PLT
	.loc 1 321 10
	test	al, al
	je	.L96
	.loc 1 322 10
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L96:
	.loc 1 323 11
	lea	rdi, .LC31[rip]
	call	consume@PLT
	.loc 1 323 10
	test	al, al
	je	.L97
	.loc 1 324 10
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L94
.L97:
	.loc 1 325 11
	lea	rdi, .LC32[rip]
	call	consume@PLT
	.loc 1 325 10
	test	al, al
	je	.L94
	.loc 1 326 10
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 3
	call	compound_assign@PLT
	mov	QWORD PTR -8[rbp], rax
.L94:
	.loc 1 330 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 331 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	assign, .-assign
	.section	.rodata
.LC33:
	.string	";"
.LC34:
	.string	"not a variable."
.LC35:
	.string	"{"
.LC36:
	.string	"break"
.LC37:
	.string	"continue"
	.text
	.globl	expr
	.type	expr, @function
expr:
.LFB10:
	.loc 1 333 17
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	.loc 1 334 6
	mov	DWORD PTR -12[rbp], 0
	.loc 1 335 6
	mov	DWORD PTR -16[rbp], 1
	.loc 1 338 10
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 338 4
	test	eax, eax
	je	.L100
	.loc 1 338 31 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	edx, DWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_defined_type@PLT
	.loc 1 338 28 discriminator 1
	test	rax, rax
	je	.L101
.L100:
.LBB13:
	.loc 1 339 13
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 340 14
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 22
	.loc 1 343 16
	call	parse_type@PLT
	.loc 1 343 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rdx], rax
	.loc 1 346 6
	lea	rdi, .LC33[rip]
	call	check@PLT
	.loc 1 346 5
	test	al, al
	je	.L102
	.loc 1 347 11
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L103
.L102:
	.loc 1 351 16
	call	consume_ident@PLT
	mov	QWORD PTR -24[rbp], rax
	.loc 1 352 5
	cmp	QWORD PTR -24[rbp], 0
	je	.L104
.LBB14:
	.loc 1 353 8
	mov	DWORD PTR -28[rbp], 1
	.loc 1 355 4
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_enumerator@PLT
	.loc 1 356 11
	mov	edx, DWORD PTR -12[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	declare_local_variable@PLT
	mov	QWORD PTR -8[rbp], rax
.LBE14:
	jmp	.L105
.L104:
	.loc 1 358 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 358 4
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC34[rip]
	mov	rdi, rax
	call	error_at@PLT
.L105:
	.loc 1 362 6
	lea	rdi, .LC28[rip]
	call	consume@PLT
	.loc 1 362 5
	test	al, al
	je	.L111
	.loc 1 363 7
	lea	rdi, .LC35[rip]
	call	consume@PLT
	.loc 1 363 6
	test	al, al
	je	.L107
	.loc 1 364 12
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	array_block@PLT
	mov	QWORD PTR -8[rbp], rax
.LBE13:
	.loc 1 338 70
	jmp	.L111
.L107:
.LBB15:
	.loc 1 366 12
	call	assign
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	mov	QWORD PTR -8[rbp], rax
.LBE15:
	.loc 1 338 70
	jmp	.L111
.L101:
	.loc 1 369 11
	mov	esi, 15
	lea	rdi, .LC36[rip]
	call	consume_reserved_word@PLT
	.loc 1 369 10
	test	al, al
	je	.L109
	.loc 1 370 13
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 371 14
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 40
	.loc 1 372 14
	mov	edx, DWORD PTR label_loop_end[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rax], edx
	jmp	.L108
.L109:
	.loc 1 373 11
	mov	esi, 16
	lea	rdi, .LC37[rip]
	call	consume_reserved_word@PLT
	.loc 1 373 10
	test	al, al
	je	.L110
	.loc 1 374 13
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 375 14
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 41
	.loc 1 376 14
	mov	edx, DWORD PTR label_loop_end[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rax], edx
	jmp	.L108
.L110:
	.loc 1 378 10
	call	assign
	mov	QWORD PTR -8[rbp], rax
	jmp	.L108
.L111:
	.loc 1 338 70
	nop
.L108:
	.loc 1 381 9
	mov	rax, QWORD PTR -8[rbp]
.L103:
	.loc 1 382 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	expr, .-expr
	.section	.rodata
.LC38:
	.string	"return"
.LC39:
	.string	"not a ';' token."
.LC40:
	.string	"if"
.LC41:
	.string	"else"
.LC42:
	.string	"switch"
	.align 8
.LC43:
	.string	"expected \342\200\230(\342\200\231 before \342\200\230{\342\200\231 token"
	.align 8
.LC44:
	.string	"multiple default labels in one switch"
.LC45:
	.string	"case"
.LC46:
	.string	"default"
.LC47:
	.string	"for"
.LC48:
	.string	"do"
.LC49:
	.string	"while"
.LC50:
	.string	"}"
	.text
	.globl	stmt
	.type	stmt, @function
stmt:
.LFB11:
	.loc 1 384 17
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	.loc 1 385 6
	mov	eax, DWORD PTR label_loop_end[rip]
	mov	DWORD PTR -52[rbp], eax
	.loc 1 386 8
	mov	QWORD PTR -8[rbp], 0
	.loc 1 388 5
	mov	esi, 19
	lea	rdi, .LC38[rip]
	call	consume_reserved_word@PLT
	.loc 1 388 4
	test	al, al
	je	.L113
	.loc 1 389 10
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 42
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 390 7
	lea	rdi, .LC33[rip]
	call	consume@PLT
	.loc 1 390 6
	xor	eax, 1
	.loc 1 390 5
	test	al, al
	je	.L114
	.loc 1 391 16
	call	expr
	.loc 1 391 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 392 8
	lea	rdi, .LC33[rip]
	call	consume@PLT
	.loc 1 392 7
	xor	eax, 1
	.loc 1 392 6
	test	al, al
	je	.L114
	.loc 1 392 36 discriminator 1
	mov	rax, QWORD PTR token[rip]
	.loc 1 392 22 discriminator 1
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC39[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L114
.L113:
	.loc 1 394 11
	mov	esi, 4
	lea	rdi, .LC40[rip]
	call	consume_reserved_word@PLT
	.loc 1 394 10
	test	al, al
	je	.L115
	.loc 1 406 15
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 33
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 407 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 407 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 408 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 408 5
	test	al, al
	je	.L116
.LBB16:
	.loc 1 410 17
	call	expr
	mov	QWORD PTR -104[rbp], rax
	.loc 1 412 4
	lea	rdi, .LC1[rip]
	call	expect@PLT
	.loc 1 415 14
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 416 16
	call	stmt
	.loc 1 416 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
.L116:
.LBE16:
	.loc 1 419 6
	mov	esi, 5
	lea	rdi, .LC41[rip]
	call	consume_reserved_word@PLT
	.loc 1 419 5
	test	al, al
	je	.L114
.LBB17:
	.loc 1 421 23
	call	stmt
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 34
	call	new_node@PLT
	mov	QWORD PTR -112[rbp], rax
	.loc 1 422 27
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 422 21
	mov	rax, QWORD PTR -112[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 423 15
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -112[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 424 15
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 35
	jmp	.L114
.L115:
.LBE17:
	.loc 1 427 12
	mov	esi, 6
	lea	rdi, .LC42[rip]
	call	consume_reserved_word@PLT
	.loc 1 427 11
	test	al, al
	je	.L117
.LBB18:
	.loc 1 439 11
	mov	QWORD PTR -16[rbp], 0
	.loc 1 440 10
	mov	rax, QWORD PTR labels_tail[rip]
	mov	QWORD PTR -96[rbp], rax
	.loc 1 441 10
	mov	QWORD PTR -24[rbp], 0
	.loc 1 443 16
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 36
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 444 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 444 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 445 24
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	.loc 1 445 18
	mov	DWORD PTR label_loop_end[rip], eax
	.loc 1 447 7
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 447 6
	test	al, al
	je	.L118
	.loc 1 449 12
	call	expr
	mov	QWORD PTR -16[rbp], rax
	.loc 1 451 5
	lea	rdi, .LC1[rip]
	call	expect@PLT
	jmp	.L119
.L118:
	.loc 1 453 19
	mov	rax, QWORD PTR token[rip]
	.loc 1 453 5
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC43[rip]
	mov	rdi, rax
	call	error_at@PLT
.L119:
	.loc 1 457 15
	call	stmt
	.loc 1 457 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 460 9
	mov	QWORD PTR -32[rbp], 0
	.loc 1 461 8
	mov	rax, QWORD PTR -96[rbp]
	mov	QWORD PTR -24[rbp], rax
	.loc 1 462 44
	cmp	QWORD PTR -96[rbp], 0
	je	.L120
	.loc 1 462 44 is_stmt 0 discriminator 1
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	jmp	.L121
.L120:
	.loc 1 462 44 discriminator 2
	mov	rax, QWORD PTR labels_head[rip]
.L121:
	.loc 1 462 10 is_stmt 1 discriminator 4
	mov	QWORD PTR -40[rbp], rax
	.loc 1 463 8 discriminator 4
	jmp	.L122
.L128:
	.loc 1 464 9
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 24[rax]
	.loc 1 464 6
	cmp	eax, 1
	jne	.L123
	.loc 1 465 7
	cmp	QWORD PTR -32[rbp], 0
	je	.L124
	.loc 1 466 30
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	.loc 1 466 28
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rdx], rax
	.loc 1 467 16
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 467 32
	mov	rdx, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR [rdx]
	.loc 1 467 28
	mov	DWORD PTR 48[rax], edx
	.loc 1 468 28
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L124:
	.loc 1 470 24
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	mov	edi, 9
	call	new_node@PLT
	mov	QWORD PTR -32[rbp], rax
	.loc 1 471 26
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR [rax]
	.loc 1 471 22
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], edx
	.loc 1 472 22
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rax], rdx
	jmp	.L125
.L123:
	.loc 1 474 15
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 24[rax]
	.loc 1 474 12
	cmp	eax, 2
	jne	.L125
	.loc 1 475 12
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 475 7
	test	rax, rax
	je	.L126
	.loc 1 476 20
	mov	rax, QWORD PTR token[rip]
	.loc 1 476 6
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC44[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L125
.L126:
	.loc 1 478 23
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 29
	call	new_node@PLT
	.loc 1 478 21
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rdx], rax
	.loc 1 479 10
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 479 25
	mov	rdx, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR [rdx]
	.loc 1 479 21
	mov	DWORD PTR 48[rax], edx
.L125:
	.loc 1 484 6
	cmp	QWORD PTR -24[rbp], 0
	je	.L127
	.loc 1 485 20
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR 16[rax]
	.loc 1 485 16
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 487 10
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -40[rbp], rax
	.loc 1 488 10
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L122
.L127:
	.loc 1 491 10
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -24[rbp], rax
	.loc 1 493 10
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -40[rbp], rax
	.loc 1 494 10
	mov	QWORD PTR -24[rbp], 0
.L122:
	.loc 1 463 8
	cmp	QWORD PTR -40[rbp], 0
	jne	.L128
	jmp	.L114
.L117:
.LBE18:
	.loc 1 497 11
	mov	esi, 7
	lea	rdi, .LC45[rip]
	call	consume_reserved_word@PLT
	.loc 1 497 10
	test	al, al
	je	.L129
	.loc 1 501 10
	call	logical
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 29
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 502 3
	lea	rdi, .LC27[rip]
	call	expect@PLT
	.loc 1 503 3
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 1
	mov	rdi, rax
	call	label_register@PLT
	.loc 1 504 15
	call	stmt
	.loc 1 504 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L114
.L129:
	.loc 1 505 11
	mov	esi, 8
	lea	rdi, .LC46[rip]
	call	consume_reserved_word@PLT
	.loc 1 505 10
	test	al, al
	je	.L130
	.loc 1 509 10
	mov	edx, 0
	mov	esi, 0
	mov	edi, 29
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 510 3
	lea	rdi, .LC27[rip]
	call	expect@PLT
	.loc 1 511 15
	call	stmt
	.loc 1 511 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 512 3
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 2
	mov	rdi, rax
	call	label_register@PLT
	jmp	.L114
.L130:
	.loc 1 513 11
	mov	esi, 11
	lea	rdi, .LC47[rip]
	call	consume_reserved_word@PLT
	.loc 1 513 10
	test	al, al
	je	.L131
	.loc 1 514 18
	mov	rax, QWORD PTR locals[rip]
	mov	QWORD PTR outside_lvar[rip], rax
	.loc 1 515 18
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR outside_enum[rip], rax
	.loc 1 516 18
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR outside_struct[rip], rax
	.loc 1 518 15
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 37
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 519 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 519 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 520 24
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	.loc 1 520 18
	mov	DWORD PTR label_loop_end[rip], eax
	.loc 1 522 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 522 5
	test	al, al
	je	.L132
.LBB19:
	.loc 1 524 17
	call	expr
	mov	QWORD PTR -72[rbp], rax
	.loc 1 525 4
	lea	rdi, .LC33[rip]
	call	expect@PLT
	.loc 1 526 17
	call	expr
	mov	QWORD PTR -80[rbp], rax
	.loc 1 527 4
	lea	rdi, .LC33[rip]
	call	expect@PLT
	.loc 1 528 17
	call	expr
	mov	QWORD PTR -88[rbp], rax
	.loc 1 530 4
	lea	rdi, .LC1[rip]
	call	expect@PLT
	.loc 1 534 16
	call	stmt
	.loc 1 534 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	.loc 1 535 14
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 536 8
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 536 20
	mov	rdx, QWORD PTR -80[rbp]
	mov	QWORD PTR 24[rax], rdx
	.loc 1 537 8
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 537 13
	mov	rax, QWORD PTR 24[rax]
	.loc 1 537 26
	mov	rdx, QWORD PTR -88[rbp]
	mov	QWORD PTR 24[rax], rdx
.L132:
.LBE19:
	.loc 1 540 16
	mov	rax, QWORD PTR outside_lvar[rip]
	mov	QWORD PTR locals[rip], rax
	.loc 1 541 16
	mov	rax, QWORD PTR outside_enum[rip]
	mov	QWORD PTR enumerations[rip], rax
	.loc 1 542 16
	mov	rax, QWORD PTR outside_struct[rip]
	mov	QWORD PTR structs[rip], rax
	jmp	.L114
.L131:
	.loc 1 543 11
	mov	esi, 9
	lea	rdi, .LC48[rip]
	call	consume_reserved_word@PLT
	.loc 1 543 10
	test	al, al
	je	.L133
	.loc 1 545 15
	call	stmt
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 39
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 546 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 546 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 547 24
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 48[rax]
	.loc 1 547 18
	mov	DWORD PTR label_loop_end[rip], eax
	.loc 1 549 3
	mov	esi, 10
	lea	rdi, .LC49[rip]
	call	consume_reserved_word@PLT
	.loc 1 550 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 550 5
	test	al, al
	je	.L134
	.loc 1 551 16
	call	expr
	.loc 1 551 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rdx], rax
	.loc 1 552 4
	lea	rdi, .LC1[rip]
	call	expect@PLT
.L134:
	.loc 1 554 3
	lea	rdi, .LC33[rip]
	call	expect@PLT
	jmp	.L114
.L133:
	.loc 1 555 11
	mov	esi, 10
	lea	rdi, .LC49[rip]
	call	consume_reserved_word@PLT
	.loc 1 555 10
	test	al, al
	je	.L135
	.loc 1 556 15
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 38
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 557 24
	mov	eax, DWORD PTR label_num[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR label_num[rip], edx
	.loc 1 557 13
	mov	rdx, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rdx], eax
	.loc 1 558 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 558 5
	test	al, al
	je	.L114
.LBB20:
	.loc 1 560 17
	call	expr
	mov	QWORD PTR -64[rbp], rax
	.loc 1 562 4
	lea	rdi, .LC1[rip]
	call	expect@PLT
	.loc 1 565 14
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 8[rax], rdx
	.loc 1 566 16
	call	stmt
	.loc 1 566 14
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L114
.L135:
.LBE20:
	.loc 1 568 11
	lea	rdi, .LC35[rip]
	call	consume@PLT
	.loc 1 568 10
	test	al, al
	je	.L136
.LBB21:
	.loc 1 569 10
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 31
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	.loc 1 570 18
	mov	rax, QWORD PTR locals[rip]
	mov	QWORD PTR outside_lvar[rip], rax
	.loc 1 571 18
	mov	rax, QWORD PTR enumerations[rip]
	mov	QWORD PTR outside_enum[rip], rax
	.loc 1 572 18
	mov	rax, QWORD PTR structs[rip]
	mov	QWORD PTR outside_struct[rip], rax
	.loc 1 574 22
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 575 8
	jmp	.L137
.L139:
	.loc 1 577 11
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	.loc 1 577 6
	test	rax, rax
	je	.L138
	.loc 1 578 30
	call	stmt
	.loc 1 578 28
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 32[rdx], rax
	.loc 1 579 16
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -48[rbp], rax
	jmp	.L137
.L138:
	.loc 1 581 18
	call	stmt
	mov	QWORD PTR -48[rbp], rax
	.loc 1 582 15
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	QWORD PTR 16[rax], rdx
.L137:
	.loc 1 575 14
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 575 8
	cmp	eax, 13
	jne	.L139
	.loc 1 586 16
	mov	rax, QWORD PTR outside_lvar[rip]
	mov	QWORD PTR locals[rip], rax
	.loc 1 587 16
	mov	rax, QWORD PTR outside_enum[rip]
	mov	QWORD PTR enumerations[rip], rax
	.loc 1 588 16
	mov	rax, QWORD PTR outside_struct[rip]
	mov	QWORD PTR structs[rip], rax
	.loc 1 589 3
	lea	rdi, .LC50[rip]
	call	expect@PLT
.LBE21:
	jmp	.L114
.L136:
	.loc 1 591 10
	call	expr
	mov	QWORD PTR -8[rbp], rax
	.loc 1 592 7
	lea	rdi, .LC33[rip]
	call	consume@PLT
	.loc 1 592 6
	xor	eax, 1
	.loc 1 592 5
	test	al, al
	je	.L114
	.loc 1 593 9
	jmp	.L140
.L141:
	.loc 1 593 37 discriminator 2
	mov	rax, QWORD PTR token[rip]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 593 43 discriminator 2
	sub	rdx, 1
	mov	QWORD PTR 24[rax], rdx
.L140:
	.loc 1 593 17 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 593 10 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 593 9 discriminator 1
	cmp	al, 10
	jne	.L141
	.loc 1 594 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 594 4
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC39[rip]
	mov	rdi, rax
	call	error_at@PLT
.L114:
	.loc 1 599 17
	mov	eax, DWORD PTR -52[rbp]
	mov	DWORD PTR label_loop_end[rip], eax
	.loc 1 600 9
	mov	rax, QWORD PTR -8[rbp]
	.loc 1 601 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	stmt, .-stmt
	.globl	function
	.type	function, @function
function:
.LFB12:
	.loc 1 603 26
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
	.loc 1 604 6
	mov	DWORD PTR -20[rbp], 0
	.loc 1 606 12
	mov	rax, QWORD PTR defined_types[rip]
	mov	QWORD PTR -32[rbp], rax
	.loc 1 609 7
	jmp	.L144
.L145:
	.loc 1 610 15
	mov	ebx, DWORD PTR -20[rbp]
	lea	eax, 1[rbx]
	mov	DWORD PTR -20[rbp], eax
	.loc 1 610 21
	call	stmt
	.loc 1 610 19
	mov	rdx, QWORD PTR -40[rbp]
	movsx	rcx, ebx
	add	rcx, 4
	mov	QWORD PTR [rdx+rcx*8], rax
.L144:
	.loc 1 609 9
	lea	rdi, .LC50[rip]
	call	consume@PLT
	.loc 1 609 8
	xor	eax, 1
	.loc 1 609 7
	test	al, al
	jne	.L145
	.loc 1 613 16
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR defined_types[rip], rax
	.loc 1 615 19
	mov	edx, DWORD PTR alloc_size[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	.loc 1 616 16
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	add	rdx, 4
	mov	QWORD PTR [rax+rdx*8], 0
	.loc 1 617 1
	nop
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	function, .-function
	.section	.rodata
.LC51:
	.string	"typedef"
.LC52:
	.string	"extern"
.LC53:
	.string	"_Thread_local"
.LC54:
	.string	"not a function."
	.text
	.globl	program
	.type	program, @function
program:
.LFB13:
	.loc 1 619 19
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	.loc 1 620 6
	mov	DWORD PTR -20[rbp], 0
	.loc 1 626 7
	jmp	.L147
.L161:
.LBB22:
	.loc 1 628 10
	mov	QWORD PTR locals[rip], 0
	.loc 1 631 14
	mov	DWORD PTR alloc_size[rip], 0
	.loc 1 632 14
	mov	DWORD PTR -32[rbp], 0
	.loc 1 635 19
	mov	DWORD PTR -24[rbp], 0
	.loc 1 636 19
	mov	DWORD PTR -28[rbp], 0
	.loc 1 639 6
	mov	esi, 17
	lea	rdi, .LC51[rip]
	call	consume_reserved_word@PLT
	.loc 1 639 5
	test	al, al
	je	.L148
.LBB23:
	.loc 1 640 29
	call	parse_type@PLT
	mov	QWORD PTR -64[rbp], rax
	.loc 1 641 29
	call	consume_ident@PLT
	mov	QWORD PTR -72[rbp], rax
	.loc 1 643 29
	mov	esi, 48
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -80[rbp], rax
	.loc 1 644 37
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 644 27
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR [rax], rdx
	.loc 1 645 37
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 645 27
	mov	rax, QWORD PTR -80[rbp]
	mov	DWORD PTR 8[rax], edx
	.loc 1 647 21
	mov	rax, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 647 6
	cmp	eax, 6
	jne	.L149
	.loc 1 648 36
	mov	rax, QWORD PTR structs[rip]
	mov	rdx, QWORD PTR 8[rax]
	.loc 1 648 27
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 649 36
	mov	rax, QWORD PTR structs[rip]
	mov	edx, DWORD PTR [rax]
	.loc 1 649 27
	mov	rax, QWORD PTR -80[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L150
.L149:
	.loc 1 650 27
	mov	rax, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 650 12
	cmp	eax, 7
	jne	.L150
	.loc 1 651 20
	mov	rax, QWORD PTR enumerations[rip]
	mov	rax, QWORD PTR 8[rax]
	.loc 1 651 7
	test	rax, rax
	je	.L151
	.loc 1 652 42
	mov	rax, QWORD PTR enumerations[rip]
	mov	rdx, QWORD PTR 8[rax]
	.loc 1 652 28
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 653 42
	mov	rax, QWORD PTR enumerations[rip]
	mov	edx, DWORD PTR [rax]
	.loc 1 653 28
	mov	rax, QWORD PTR -80[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L150
.L151:
	.loc 1 655 18
	mov	rax, QWORD PTR enumerations[rip]
	.loc 1 655 38
	mov	rdx, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 24[rdx]
	.loc 1 655 28
	mov	QWORD PTR 8[rax], rdx
	.loc 1 656 18
	mov	rax, QWORD PTR enumerations[rip]
	.loc 1 656 38
	mov	rdx, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR 32[rdx]
	.loc 1 656 28
	mov	DWORD PTR [rax], edx
	.loc 1 657 38
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR 24[rax]
	.loc 1 657 28
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 658 38
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR 32[rax]
	.loc 1 658 28
	mov	rax, QWORD PTR -80[rbp]
	mov	DWORD PTR 24[rax], edx
.L150:
	.loc 1 662 23
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	QWORD PTR 32[rax], rdx
	.loc 1 663 23
	mov	rdx, QWORD PTR defined_types[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR 40[rax], rdx
	.loc 1 664 23
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR defined_types[rip], rax
	.loc 1 666 4
	lea	rdi, .LC33[rip]
	call	expect@PLT
	.loc 1 667 4
	jmp	.L147
.L148:
.LBE23:
	.loc 1 671 6
	mov	esi, 18
	lea	rdi, .LC52[rip]
	call	consume_reserved_word@PLT
	.loc 1 671 5
	test	al, al
	je	.L152
	.loc 1 672 14
	mov	DWORD PTR -24[rbp], 1
.L152:
	.loc 1 676 6
	mov	esi, 20
	lea	rdi, .LC53[rip]
	call	consume_reserved_word@PLT
	.loc 1 676 5
	test	al, al
	je	.L153
	.loc 1 677 20
	mov	DWORD PTR -28[rbp], 1
.L153:
	.loc 1 682 16
	call	parse_type@PLT
	mov	QWORD PTR -40[rbp], rax
	.loc 1 683 31
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -24[rbp]
	mov	DWORD PTR 28[rax], edx
	.loc 1 684 31
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 32[rax], edx
	.loc 1 687 6
	lea	rdi, .LC33[rip]
	call	consume@PLT
	.loc 1 687 5
	test	al, al
	je	.L154
	.loc 1 688 4
	jmp	.L147
.L154:
	.loc 1 691 27
	mov	esi, 2440
	mov	edi, 1
	call	calloc@PLT
	mov	rcx, rax
	.loc 1 691 25
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	QWORD PTR [rdx+rax], rcx
	.loc 1 694 11
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	.loc 1 694 5
	cmp	eax, 2
	jne	.L155
	.loc 1 694 49 discriminator 1
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	.loc 1 694 43 discriminator 1
	movzx	eax, BYTE PTR [rax]
	.loc 1 694 34 discriminator 1
	movsx	eax, al
	mov	edi, eax
	call	is_alnum@PLT
	.loc 1 694 30 discriminator 1
	test	eax, eax
	jne	.L156
.L155:
	.loc 1 695 18
	mov	rax, QWORD PTR token[rip]
	.loc 1 695 4
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC54[rip]
	mov	rdi, rax
	call	error_at@PLT
.L156:
	.loc 1 698 21
	call	consume_ident@PLT
	mov	QWORD PTR -48[rbp], rax
	.loc 1 701 6
	lea	rdi, .LC0[rip]
	call	consume@PLT
	.loc 1 701 5
	test	al, al
	je	.L157
	.loc 1 702 13
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 702 32
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	.loc 1 703 49
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR 32[rax]
	.loc 1 703 34
	cdqe
	.loc 1 703 13
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	lea	rdx, func_list[rip]
	mov	rbx, QWORD PTR [rcx+rdx]
	.loc 1 703 34
	mov	esi, 1
	mov	rdi, rax
	call	calloc@PLT
	.loc 1 703 32
	mov	QWORD PTR 8[rbx], rax
	.loc 1 704 64
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR 32[rax]
	.loc 1 704 4
	movsx	rdx, eax
	.loc 1 704 49
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR 24[rax]
	.loc 1 704 21
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rsi, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rsi+rax]
	.loc 1 704 4
	mov	rax, QWORD PTR 8[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncpy@PLT
	.loc 1 707 59
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	.loc 1 707 34
	mov	rax, QWORD PTR 16[rax]
	.loc 1 707 13
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	lea	rdx, func_list[rip]
	mov	rbx, QWORD PTR [rcx+rdx]
	.loc 1 707 34
	mov	edx, DWORD PTR -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	insert_ptr_type@PLT
	.loc 1 707 32
	mov	QWORD PTR 16[rbx], rax
	.loc 1 710 4
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	get_argument@PLT
	.loc 1 713 4
	lea	rdi, .LC35[rip]
	call	consume@PLT
	.loc 1 714 33
	mov	eax, DWORD PTR -20[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -20[rbp], edx
	.loc 1 714 4
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdi, rax
	call	function
	.loc 1 715 4
	lea	rdi, .LC50[rip]
	call	consume@PLT
	jmp	.L147
.L157:
.LBB24:
	.loc 1 718 20
	mov	rdx, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -32[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	declare_global_variable@PLT
	mov	QWORD PTR -56[rbp], rax
	.loc 1 721 7
	lea	rdi, .LC28[rip]
	call	consume@PLT
	.loc 1 721 6
	test	al, al
	je	.L158
	.loc 1 722 8
	lea	rdi, .LC35[rip]
	call	consume@PLT
	.loc 1 722 7
	test	al, al
	je	.L159
	.loc 1 723 13
	mov	rbx, QWORD PTR globals[rip]
	.loc 1 723 22
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	array_block@PLT
	.loc 1 723 20
	mov	QWORD PTR 32[rbx], rax
	jmp	.L160
.L159:
	.loc 1 725 22
	call	assign
	mov	rdx, rax
	.loc 1 725 13
	mov	rbx, QWORD PTR globals[rip]
	.loc 1 725 22
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	.loc 1 725 20
	mov	QWORD PTR 32[rbx], rax
	jmp	.L160
.L158:
	.loc 1 728 15
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	.loc 1 728 7
	cmp	eax, 23
	jne	.L160
	.loc 1 729 22
	mov	edi, 0
	call	new_node_num@PLT
	mov	rdx, rax
	.loc 1 729 13
	mov	rbx, QWORD PTR globals[rip]
	.loc 1 729 22
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	init_formula@PLT
	.loc 1 729 20
	mov	QWORD PTR 32[rbx], rax
.L160:
	.loc 1 733 4
	lea	rdi, .LC33[rip]
	call	expect@PLT
.L147:
.LBE24:
.LBE22:
	.loc 1 626 9
	call	at_eof@PLT
	.loc 1 626 8
	xor	eax, 1
	.loc 1 626 7
	test	al, al
	jne	.L161
	.loc 1 736 24
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	QWORD PTR [rdx+rax], 0
	.loc 1 737 1
	nop
	add	rsp, 72
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	program, .-program
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "../include/cc_sakura.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x12b0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF224
	.byte	0xc
	.long	.LASF225
	.long	.LASF226
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
	.long	.LASF134
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
	.long	.LASF227
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
	.byte	0x6b
	.byte	0xd
	.long	0x4f1
	.uleb128 0xf
	.long	.LASF125
	.byte	0
	.uleb128 0xf
	.long	.LASF126
	.byte	0x1
	.uleb128 0xf
	.long	.LASF127
	.byte	0x2
	.uleb128 0xf
	.long	.LASF128
	.byte	0x3
	.byte	0
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0x7
	.byte	0x72
	.byte	0xd
	.long	0x512
	.uleb128 0xf
	.long	.LASF129
	.byte	0
	.uleb128 0xf
	.long	.LASF130
	.byte	0x1
	.uleb128 0xf
	.long	.LASF131
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF132
	.byte	0x7
	.byte	0x76
	.byte	0x2
	.long	0x4f1
	.uleb128 0x2
	.long	.LASF133
	.byte	0x7
	.byte	0x78
	.byte	0x17
	.long	0x52a
	.uleb128 0x7
	.long	.LASF133
	.byte	0x28
	.byte	0x7
	.byte	0x86
	.byte	0x8
	.long	0x579
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0x87
	.byte	0xc
	.long	0x34a
	.byte	0
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0x88
	.byte	0x9
	.long	0x9d7
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
	.long	.LASF137
	.byte	0x7
	.byte	0x79
	.byte	0x17
	.long	0x585
	.uleb128 0x7
	.long	.LASF137
	.byte	0x48
	.byte	0x7
	.byte	0xa6
	.byte	0x8
	.long	0x608
	.uleb128 0x8
	.long	.LASF135
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
	.long	0x9e9
	.byte	0x8
	.uleb128 0x11
	.string	"rhs"
	.byte	0x7
	.byte	0xa9
	.byte	0x8
	.long	0x9e9
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xaa
	.byte	0x8
	.long	0x9e9
	.byte	0x18
	.uleb128 0x8
	.long	.LASF138
	.byte	0x7
	.byte	0xab
	.byte	0x8
	.long	0x9e9
	.byte	0x20
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xac
	.byte	0x8
	.long	0x9dd
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
	.long	.LASF140
	.byte	0x7
	.byte	0xaf
	.byte	0x7
	.long	0x65
	.byte	0x40
	.byte	0
	.uleb128 0x2
	.long	.LASF141
	.byte	0x7
	.byte	0x7a
	.byte	0x17
	.long	0x614
	.uleb128 0x7
	.long	.LASF141
	.byte	0x20
	.byte	0x7
	.byte	0xd0
	.byte	0x8
	.long	0x663
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xd1
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF140
	.byte	0x7
	.byte	0xd2
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xd3
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xd4
	.byte	0x8
	.long	0x9dd
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xd5
	.byte	0x8
	.long	0xa12
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF143
	.byte	0x7
	.byte	0x7b
	.byte	0x17
	.long	0x66f
	.uleb128 0x7
	.long	.LASF143
	.byte	0x28
	.byte	0x7
	.byte	0xc6
	.byte	0x8
	.long	0x6cb
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xc7
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF144
	.byte	0x7
	.byte	0xc8
	.byte	0x6
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xc9
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xca
	.byte	0x8
	.long	0x9dd
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xcb
	.byte	0x8
	.long	0xa0c
	.byte	0x18
	.uleb128 0x8
	.long	.LASF145
	.byte	0x7
	.byte	0xcc
	.byte	0x8
	.long	0x9e9
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF146
	.byte	0x7
	.byte	0x7c
	.byte	0x17
	.long	0x6d7
	.uleb128 0x7
	.long	.LASF146
	.byte	0x20
	.byte	0x7
	.byte	0xe1
	.byte	0x8
	.long	0x726
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xe2
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF144
	.byte	0x7
	.byte	0xe3
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xe4
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF147
	.byte	0x7
	.byte	0xe5
	.byte	0xa
	.long	0xa1e
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xe6
	.byte	0xa
	.long	0xa24
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF148
	.byte	0x7
	.byte	0x7d
	.byte	0x17
	.long	0x732
	.uleb128 0x7
	.long	.LASF148
	.byte	0x20
	.byte	0x7
	.byte	0xea
	.byte	0x8
	.long	0x774
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xeb
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xec
	.byte	0xa
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF147
	.byte	0x7
	.byte	0xed
	.byte	0xa
	.long	0xa1e
	.byte	0x10
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xee
	.byte	0xa
	.long	0xa2a
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	.LASF149
	.byte	0x7
	.byte	0x7e
	.byte	0x17
	.long	0x780
	.uleb128 0x7
	.long	.LASF149
	.byte	0x28
	.byte	0x7
	.byte	0xf2
	.byte	0x8
	.long	0x7dc
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xf3
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF140
	.byte	0x7
	.byte	0xf4
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF144
	.byte	0x7
	.byte	0xf5
	.byte	0x9
	.long	0x65
	.byte	0x8
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xf6
	.byte	0xa
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xf7
	.byte	0xa
	.long	0x9dd
	.byte	0x18
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xf8
	.byte	0xa
	.long	0xa1e
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF150
	.byte	0x7
	.byte	0x7f
	.byte	0x17
	.long	0x7e8
	.uleb128 0x12
	.long	.LASF150
	.value	0x988
	.byte	0x7
	.byte	0xb3
	.byte	0x8
	.long	0x846
	.uleb128 0x8
	.long	.LASF151
	.byte	0x7
	.byte	0xb5
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0xb6
	.byte	0x8
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xb7
	.byte	0x8
	.long	0x9dd
	.byte	0x10
	.uleb128 0x8
	.long	.LASF152
	.byte	0x7
	.byte	0xb8
	.byte	0x8
	.long	0x9e9
	.byte	0x18
	.uleb128 0x8
	.long	.LASF153
	.byte	0x7
	.byte	0xb9
	.byte	0x8
	.long	0x9ef
	.byte	0x20
	.uleb128 0x13
	.long	.LASF136
	.byte	0x7
	.byte	0xba
	.byte	0x8
	.long	0xa00
	.value	0x980
	.byte	0
	.uleb128 0x2
	.long	.LASF154
	.byte	0x7
	.byte	0x80
	.byte	0x17
	.long	0x852
	.uleb128 0x7
	.long	.LASF154
	.byte	0x20
	.byte	0x7
	.byte	0xd9
	.byte	0x8
	.long	0x893
	.uleb128 0x11
	.string	"id"
	.byte	0x7
	.byte	0xda
	.byte	0xc
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF155
	.byte	0x7
	.byte	0xdb
	.byte	0xd
	.long	0x9e9
	.byte	0x8
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xdc
	.byte	0xd
	.long	0xa18
	.byte	0x10
	.uleb128 0x8
	.long	.LASF135
	.byte	0x7
	.byte	0xdd
	.byte	0xc
	.long	0x512
	.byte	0x18
	.byte	0
	.uleb128 0x14
	.string	"Str"
	.byte	0x7
	.byte	0x81
	.byte	0x17
	.long	0x89f
	.uleb128 0x15
	.string	"Str"
	.byte	0x18
	.byte	0x7
	.byte	0xbe
	.byte	0x8
	.long	0x8e1
	.uleb128 0x11
	.string	"len"
	.byte	0x7
	.byte	0xbf
	.byte	0x6
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF156
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
	.long	.LASF136
	.byte	0x7
	.byte	0xc2
	.byte	0x7
	.long	0xa06
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.long	.LASF157
	.byte	0x7
	.byte	0x82
	.byte	0x17
	.long	0x8ed
	.uleb128 0x7
	.long	.LASF157
	.byte	0x30
	.byte	0x7
	.byte	0x8f
	.byte	0x8
	.long	0x96f
	.uleb128 0x11
	.string	"ty"
	.byte	0x7
	.byte	0x90
	.byte	0xb
	.long	0x4be
	.byte	0
	.uleb128 0x8
	.long	.LASF158
	.byte	0x7
	.byte	0x91
	.byte	0x9
	.long	0x9dd
	.byte	0x8
	.uleb128 0x8
	.long	.LASF159
	.byte	0x7
	.byte	0x92
	.byte	0x7
	.long	0x65
	.byte	0x10
	.uleb128 0x8
	.long	.LASF160
	.byte	0x7
	.byte	0x93
	.byte	0x7
	.long	0x65
	.byte	0x14
	.uleb128 0x8
	.long	.LASF161
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x8
	.long	.LASF162
	.byte	0x7
	.byte	0x95
	.byte	0xb
	.long	0x65
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF163
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
	.long	.LASF142
	.byte	0x7
	.byte	0x98
	.byte	0xc
	.long	0x8b
	.byte	0x28
	.byte	0
	.uleb128 0x2
	.long	.LASF164
	.byte	0x7
	.byte	0x83
	.byte	0x19
	.long	0x97b
	.uleb128 0x7
	.long	.LASF164
	.byte	0x30
	.byte	0x7
	.byte	0x9c
	.byte	0x8
	.long	0x9d7
	.uleb128 0x8
	.long	.LASF142
	.byte	0x7
	.byte	0x9d
	.byte	0xc
	.long	0x8b
	.byte	0
	.uleb128 0x8
	.long	.LASF165
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
	.long	.LASF166
	.byte	0x7
	.byte	0xa0
	.byte	0xb
	.long	0x65
	.byte	0x18
	.uleb128 0x8
	.long	.LASF139
	.byte	0x7
	.byte	0xa1
	.byte	0xc
	.long	0x9dd
	.byte	0x20
	.uleb128 0x8
	.long	.LASF136
	.byte	0x7
	.byte	0xa2
	.byte	0xc
	.long	0x9e3
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x51e
	.uleb128 0x6
	.byte	0x8
	.long	0x8e1
	.uleb128 0x6
	.byte	0x8
	.long	0x96f
	.uleb128 0x6
	.byte	0x8
	.long	0x579
	.uleb128 0xb
	.long	0x9e9
	.long	0xa00
	.uleb128 0x16
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7dc
	.uleb128 0x6
	.byte	0x8
	.long	0x893
	.uleb128 0x6
	.byte	0x8
	.long	0x663
	.uleb128 0x6
	.byte	0x8
	.long	0x608
	.uleb128 0x6
	.byte	0x8
	.long	0x846
	.uleb128 0x6
	.byte	0x8
	.long	0x774
	.uleb128 0x6
	.byte	0x8
	.long	0x6cb
	.uleb128 0x6
	.byte	0x8
	.long	0x726
	.uleb128 0xd
	.long	.LASF167
	.byte	0x7
	.byte	0xfe
	.byte	0x11
	.long	0x65
	.uleb128 0xd
	.long	.LASF168
	.byte	0x7
	.byte	0xff
	.byte	0x11
	.long	0x65
	.uleb128 0x17
	.long	.LASF169
	.byte	0x7
	.value	0x100
	.byte	0x11
	.long	0x65
	.uleb128 0x17
	.long	.LASF170
	.byte	0x7
	.value	0x101
	.byte	0x12
	.long	0x8b
	.uleb128 0xb
	.long	0x91
	.long	0xa72
	.uleb128 0xc
	.long	0x39
	.byte	0x63
	.byte	0
	.uleb128 0x17
	.long	.LASF171
	.byte	0x7
	.value	0x102
	.byte	0x11
	.long	0xa62
	.uleb128 0x17
	.long	.LASF172
	.byte	0x7
	.value	0x103
	.byte	0x12
	.long	0x9d7
	.uleb128 0xb
	.long	0xa00
	.long	0xa9d
	.uleb128 0x16
	.long	0x39
	.value	0x12b
	.byte	0
	.uleb128 0x17
	.long	.LASF173
	.byte	0x7
	.value	0x104
	.byte	0x12
	.long	0xa8c
	.uleb128 0x17
	.long	.LASF174
	.byte	0x7
	.value	0x105
	.byte	0x12
	.long	0xa12
	.uleb128 0x17
	.long	.LASF175
	.byte	0x7
	.value	0x106
	.byte	0x12
	.long	0xa0c
	.uleb128 0x17
	.long	.LASF176
	.byte	0x7
	.value	0x107
	.byte	0x12
	.long	0xa06
	.uleb128 0x17
	.long	.LASF177
	.byte	0x7
	.value	0x108
	.byte	0x12
	.long	0xa24
	.uleb128 0x17
	.long	.LASF178
	.byte	0x7
	.value	0x109
	.byte	0x12
	.long	0xa2a
	.uleb128 0x17
	.long	.LASF179
	.byte	0x7
	.value	0x10a
	.byte	0x12
	.long	0x9e3
	.uleb128 0x17
	.long	.LASF180
	.byte	0x7
	.value	0x10b
	.byte	0x12
	.long	0xa18
	.uleb128 0x17
	.long	.LASF181
	.byte	0x7
	.value	0x10c
	.byte	0x12
	.long	0xa18
	.uleb128 0x17
	.long	.LASF182
	.byte	0x7
	.value	0x10d
	.byte	0x12
	.long	0xa12
	.uleb128 0x17
	.long	.LASF183
	.byte	0x7
	.value	0x10e
	.byte	0x12
	.long	0xa24
	.uleb128 0x17
	.long	.LASF184
	.byte	0x7
	.value	0x10f
	.byte	0x12
	.long	0xa2a
	.uleb128 0x17
	.long	.LASF185
	.byte	0x7
	.value	0x110
	.byte	0x12
	.long	0x9e3
	.uleb128 0x17
	.long	.LASF156
	.byte	0x7
	.value	0x168
	.byte	0xc
	.long	0x65
	.uleb128 0x17
	.long	.LASF186
	.byte	0x7
	.value	0x169
	.byte	0xc
	.long	0x65
	.uleb128 0x18
	.long	0xa48
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.uleb128 0x9
	.byte	0x3
	.quad	alloc_size
	.uleb128 0x18
	.long	0xa7f
	.byte	0x1
	.byte	0x4
	.byte	0x8
	.uleb128 0x9
	.byte	0x3
	.quad	token
	.uleb128 0x18
	.long	0xac4
	.byte	0x1
	.byte	0x5
	.byte	0x6
	.uleb128 0x9
	.byte	0x3
	.quad	strings
	.uleb128 0x19
	.long	.LASF194
	.byte	0x1
	.value	0x26b
	.byte	0x6
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0xc94
	.uleb128 0x1a
	.long	.LASF187
	.byte	0x1
	.value	0x26c
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF188
	.byte	0x1
	.value	0x26d
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF162
	.byte	0x1
	.value	0x26e
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF163
	.byte	0x1
	.value	0x26f
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF189
	.byte	0x1
	.value	0x270
	.byte	0x8
	.long	0x9dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x1a
	.long	.LASF190
	.byte	0x1
	.value	0x2ba
	.byte	0xa
	.long	0x9d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0xc6f
	.uleb128 0x1a
	.long	.LASF191
	.byte	0x1
	.value	0x280
	.byte	0xa
	.long	0x9dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1a
	.long	.LASF190
	.byte	0x1
	.value	0x281
	.byte	0xb
	.long	0x9d7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF192
	.byte	0x1
	.value	0x283
	.byte	0xe
	.long	0x9e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x1b
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x1a
	.long	.LASF193
	.byte	0x1
	.value	0x2ce
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF195
	.byte	0x1
	.value	0x25b
	.byte	0x6
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0xce2
	.uleb128 0x1d
	.long	.LASF228
	.byte	0x1
	.value	0x25b
	.byte	0x15
	.long	0xa00
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.value	0x25c
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF196
	.byte	0x1
	.value	0x25e
	.byte	0xc
	.long	0x9e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1f
	.long	.LASF204
	.byte	0x1
	.value	0x180
	.byte	0x7
	.long	0x9e9
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0xe6d
	.uleb128 0x1a
	.long	.LASF197
	.byte	0x1
	.value	0x181
	.byte	0x6
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x182
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0xd4d
	.uleb128 0x1a
	.long	.LASF155
	.byte	0x1
	.value	0x19a
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x1c
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0xd74
	.uleb128 0x1a
	.long	.LASF199
	.byte	0x1
	.value	0x1a5
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x1c
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0xdda
	.uleb128 0x1a
	.long	.LASF155
	.byte	0x1
	.value	0x1b7
	.byte	0xb
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF200
	.byte	0x1
	.value	0x1b8
	.byte	0xa
	.long	0xa18
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1a
	.long	.LASF201
	.byte	0x1
	.value	0x1b9
	.byte	0xa
	.long	0xa18
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF202
	.byte	0x1
	.value	0x1cc
	.byte	0x9
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.string	"lb"
	.byte	0x1
	.value	0x1ce
	.byte	0xa
	.long	0xa18
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1c
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0xe23
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.value	0x20c
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF155
	.byte	0x1
	.value	0x20e
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1a
	.long	.LASF203
	.byte	0x1
	.value	0x210
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x1c
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0xe4a
	.uleb128 0x1a
	.long	.LASF155
	.byte	0x1
	.value	0x230
	.byte	0xa
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x1b
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.uleb128 0x1a
	.long	.LASF138
	.byte	0x1
	.value	0x23e
	.byte	0x9
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF205
	.byte	0x1
	.value	0x14d
	.byte	0x7
	.long	0x9e9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0xef9
	.uleb128 0x1a
	.long	.LASF188
	.byte	0x1
	.value	0x14e
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.long	.LASF206
	.byte	0x1
	.value	0x14f
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x150
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.Ldebug_ranges0+0
	.uleb128 0x1e
	.string	"tok"
	.byte	0x1
	.value	0x15f
	.byte	0xa
	.long	0x9d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x1a
	.long	.LASF206
	.byte	0x1
	.value	0x161
	.byte	0x8
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF207
	.byte	0x1
	.value	0x13a
	.byte	0x7
	.long	0x9e9
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xf2d
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x13b
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF208
	.byte	0x1
	.value	0x12c
	.byte	0x7
	.long	0x9e9
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xf61
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x12d
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x1
	.value	0x11f
	.byte	0x7
	.long	0x9e9
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xf95
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x120
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF210
	.byte	0x1
	.value	0x111
	.byte	0x7
	.long	0x9e9
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc9
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x112
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	.LASF211
	.byte	0x1
	.byte	0xfe
	.byte	0x7
	.long	0x9e9
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xffb
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xff
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.string	"add"
	.byte	0x1
	.byte	0xef
	.byte	0x7
	.long	0x9e9
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x102d
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xf1
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.string	"mul"
	.byte	0x1
	.byte	0xdc
	.byte	0x7
	.long	0x9e9
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x105f
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xde
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	.LASF212
	.byte	0x1
	.byte	0x9b
	.byte	0x7
	.long	0x9e9
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x10f8
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x22
	.long	.LASF213
	.byte	0x1
	.byte	0xc9
	.byte	0x8
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x10d5
	.uleb128 0x22
	.long	.LASF214
	.byte	0x1
	.byte	0xcb
	.byte	0xb
	.long	0x9dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1b
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x22
	.long	.LASF215
	.byte	0x1
	.byte	0xcf
	.byte	0xb
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF216
	.byte	0x1
	.byte	0x6f
	.byte	0x7
	.long	0x9e9
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x112a
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0x70
	.byte	0x8
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	.LASF217
	.byte	0x1
	.byte	0x9
	.byte	0x7
	.long	0x9e9
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x22
	.long	.LASF218
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.string	"tok"
	.byte	0x1
	.byte	0x3d
	.byte	0x9
	.long	0x9d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x118c
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0xb
	.byte	0x9
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x1c
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x11b2
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x1c
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x121a
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0x19
	.byte	0x9
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x25
	.string	"tok"
	.byte	0x1
	.byte	0x1e
	.byte	0xa
	.long	0x9d7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x22
	.long	.LASF219
	.byte	0x1
	.byte	0x1f
	.byte	0x8
	.long	0xa06
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1b
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x25
	.string	"new"
	.byte	0x1
	.byte	0x28
	.byte	0x9
	.long	0xa06
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x22
	.long	.LASF198
	.byte	0x1
	.byte	0x3f
	.byte	0x9
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF220
	.byte	0x1
	.byte	0x41
	.byte	0x9
	.long	0xa12
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x126f
	.uleb128 0x22
	.long	.LASF221
	.byte	0x1
	.byte	0x48
	.byte	0xa
	.long	0xa00
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x1b
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x22
	.long	.LASF222
	.byte	0x1
	.byte	0x52
	.byte	0xa
	.long	0xa0c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x22
	.long	.LASF223
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.long	0xa1e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
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
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
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
.LASF150:
	.string	"Func"
.LASF201:
	.string	"prev"
.LASF183:
	.string	"outside_struct"
.LASF188:
	.string	"star_count"
.LASF165:
	.string	"name_len"
.LASF139:
	.string	"type"
.LASF145:
	.string	"init"
.LASF62:
	.string	"TK_STR"
.LASF18:
	.string	"_IO_buf_base"
.LASF141:
	.string	"LVar"
.LASF143:
	.string	"GVar"
.LASF120:
	.string	"CHAR"
.LASF217:
	.string	"data"
.LASF51:
	.string	"TK_NUM"
.LASF123:
	.string	"ENUM"
.LASF196:
	.string	"stash_def_types"
.LASF206:
	.string	"INSIDE_SCOPE"
.LASF180:
	.string	"labels_head"
.LASF136:
	.string	"next"
.LASF33:
	.string	"_codecvt"
.LASF65:
	.string	"TK_TYPEDEF"
.LASF197:
	.string	"stash_loop_end"
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
.LASF223:
	.string	"rator"
.LASF194:
	.string	"program"
.LASF195:
	.string	"function"
.LASF95:
	.string	"ND_GVAR"
.LASF121:
	.string	"ARRAY"
.LASF207:
	.string	"assign"
.LASF25:
	.string	"_fileno"
.LASF137:
	.string	"Node"
.LASF126:
	.string	"PRE_DEC"
.LASF155:
	.string	"cond"
.LASF13:
	.string	"_IO_read_end"
.LASF60:
	.string	"TK_SIZEOF"
.LASF133:
	.string	"Token"
.LASF184:
	.string	"outside_enum"
.LASF6:
	.string	"long int"
.LASF161:
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
.LASF129:
	.string	"LB_LABEL"
.LASF42:
	.string	"_IO_codecvt"
.LASF220:
	.string	"lvar"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF200:
	.string	"before_switch"
.LASF127:
	.string	"POST_INC"
.LASF169:
	.string	"alloc_size"
.LASF78:
	.string	"ND_GE"
.LASF140:
	.string	"offset"
.LASF100:
	.string	"ND_CALL_FUNC"
.LASF131:
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
.LASF163:
	.string	"is_thread_local"
.LASF36:
	.string	"_freeres_buf"
.LASF173:
	.string	"func_list"
.LASF181:
	.string	"labels_tail"
.LASF96:
	.string	"ND_LARRAY"
.LASF49:
	.string	"TK_RESERVED"
.LASF164:
	.string	"Def_Type"
.LASF0:
	.string	"long unsigned int"
.LASF213:
	.string	"INSIDE_FILE"
.LASF192:
	.string	"def_new_type"
.LASF84:
	.string	"ND_OR"
.LASF16:
	.string	"_IO_write_ptr"
.LASF99:
	.string	"ND_NUM"
.LASF142:
	.string	"name"
.LASF185:
	.string	"outside_deftype"
.LASF56:
	.string	"TK_DEFAULT"
.LASF162:
	.string	"is_extern"
.LASF135:
	.string	"kind"
.LASF53:
	.string	"TK_ELSE"
.LASF159:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF88:
	.string	"ND_DOT"
.LASF20:
	.string	"_IO_save_base"
.LASF179:
	.string	"defined_types"
.LASF97:
	.string	"ND_GARRAY"
.LASF198:
	.string	"node"
.LASF166:
	.string	"tag_len"
.LASF176:
	.string	"strings"
.LASF31:
	.string	"_lock"
.LASF73:
	.string	"ND_SUB"
.LASF203:
	.string	"calc"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF45:
	.string	"stdout"
.LASF112:
	.string	"ND_BREAK"
.LASF125:
	.string	"PRE_INC"
.LASF72:
	.string	"ND_ADD"
.LASF186:
	.string	"label_loop_end"
.LASF119:
	.string	"BOOL"
.LASF113:
	.string	"ND_CONTINUE"
.LASF50:
	.string	"TK_IDENT"
.LASF64:
	.string	"TK_CONTINUE"
.LASF225:
	.string	"../src/syntax_tree.c"
.LASF193:
	.string	"init_gv"
.LASF167:
	.string	"llid"
.LASF199:
	.string	"else_block"
.LASF89:
	.string	"ND_ARROW"
.LASF182:
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
.LASF227:
	.string	"_IO_lock_t"
.LASF134:
	.string	"_IO_FILE"
.LASF90:
	.string	"ND_PREID"
.LASF54:
	.string	"TK_SWITCH"
.LASF221:
	.string	"called"
.LASF93:
	.string	"ND_DEREF"
.LASF149:
	.string	"Member"
.LASF168:
	.string	"lvar_count"
.LASF91:
	.string	"ND_NOT"
.LASF55:
	.string	"TK_CASE"
.LASF148:
	.string	"Enum"
.LASF172:
	.string	"token"
.LASF157:
	.string	"Type"
.LASF23:
	.string	"_markers"
.LASF130:
	.string	"LB_CASE"
.LASF94:
	.string	"ND_LVAR"
.LASF205:
	.string	"expr"
.LASF222:
	.string	"gvar"
.LASF98:
	.string	"ND_STR"
.LASF211:
	.string	"relational"
.LASF2:
	.string	"unsigned char"
.LASF226:
	.string	"/home/takana/git/cc_sakura/self_host"
.LASF107:
	.string	"ND_IFELSE"
.LASF5:
	.string	"short int"
.LASF215:
	.string	"target"
.LASF43:
	.string	"_IO_wide_data"
.LASF102:
	.string	"ND_TERNARY"
.LASF210:
	.string	"equelity"
.LASF86:
	.string	"ND_COMPOUND"
.LASF156:
	.string	"label_num"
.LASF29:
	.string	"_vtable_offset"
.LASF75:
	.string	"ND_DIV"
.LASF214:
	.string	"target_type"
.LASF40:
	.string	"FILE"
.LASF170:
	.string	"user_input"
.LASF81:
	.string	"ND_EQ"
.LASF204:
	.string	"stmt"
.LASF66:
	.string	"TK_EXTERN"
.LASF67:
	.string	"TK_RETURN"
.LASF69:
	.string	"TK_COMPILER_DIRECTIVE"
.LASF76:
	.string	"ND_MOD"
.LASF132:
	.string	"LabelKind"
.LASF101:
	.string	"ND_CASE"
.LASF10:
	.string	"char"
.LASF228:
	.string	"func"
.LASF59:
	.string	"TK_FOR"
.LASF87:
	.string	"ND_POSTID"
.LASF83:
	.string	"ND_AND"
.LASF144:
	.string	"memsize"
.LASF224:
	.string	"GNU C11 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=c11 -fasynchronous-unwind-tables"
.LASF108:
	.string	"ND_SWITCH"
.LASF68:
	.string	"TK_THREAD_LOCAL"
.LASF189:
	.string	"toplv_type"
.LASF174:
	.string	"locals"
.LASF178:
	.string	"enumerations"
.LASF9:
	.string	"__off64_t"
.LASF63:
	.string	"TK_BREAK"
.LASF177:
	.string	"structs"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF146:
	.string	"Struc"
.LASF58:
	.string	"TK_WHILE"
.LASF103:
	.string	"ND_BLOCK"
.LASF216:
	.string	"primary"
.LASF37:
	.string	"__pad5"
.LASF114:
	.string	"ND_RETURN"
.LASF39:
	.string	"_unused2"
.LASF46:
	.string	"stderr"
.LASF153:
	.string	"code"
.LASF208:
	.string	"ternary"
.LASF202:
	.string	"cond_cases"
.LASF212:
	.string	"unary"
.LASF209:
	.string	"logical"
.LASF218:
	.string	"INSIDE_FUNC"
.LASF21:
	.string	"_IO_backup_base"
.LASF187:
	.string	"func_index"
.LASF57:
	.string	"TK_DO"
.LASF171:
	.string	"filename"
.LASF117:
	.string	"NodeKind"
.LASF151:
	.string	"stack_size"
.LASF138:
	.string	"block_code"
.LASF70:
	.string	"TK_EOF"
.LASF61:
	.string	"TK_BLOCK"
.LASF160:
	.string	"align"
.LASF147:
	.string	"member"
.LASF35:
	.string	"_freeres_list"
.LASF80:
	.string	"ND_LE"
.LASF219:
	.string	"fstr"
.LASF34:
	.string	"_wide_data"
.LASF190:
	.string	"def_name"
.LASF154:
	.string	"Label"
.LASF152:
	.string	"args"
.LASF175:
	.string	"globals"
.LASF191:
	.string	"specified_type"
.LASF79:
	.string	"ND_LT"
.LASF15:
	.string	"_IO_write_base"
.LASF111:
	.string	"ND_DOWHILE"
.LASF128:
	.string	"POST_DEC"
.LASF48:
	.string	"TK_TYPE"
.LASF158:
	.string	"ptr_to"
.LASF118:
	.string	"VOID"
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
