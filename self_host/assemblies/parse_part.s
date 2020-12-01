	.file	"parse_part.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"__NULL"
	.text
	.globl	compiler_directive
	.type	compiler_directive, @function
compiler_directive:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	mov	esi, 20
	lea	rdi, .LC0[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L2
	mov	edi, 0
	call	new_node_num@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 4
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR 16[rax], 8
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR 20[rax], 8
	mov	rax, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 40[rax]
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR 8[rbx], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	DWORD PTR [rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	DWORD PTR 16[rax], 1
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	DWORD PTR 20[rax], 1
.L2:
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 24
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	compiler_directive, .-compiler_directive
	.globl	compound_assign
	.type	compound_assign, @function
compound_assign:
.LFB7:
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
	mov	rdx, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	mov	edi, 14
	call	new_node@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	compound_assign, .-compound_assign
	.globl	dot_arrow
	.type	dot_arrow, @function
dot_arrow:
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
	mov	DWORD PTR -20[rbp], 0
	mov	rcx, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR -52[rbp]
	mov	edx, 0
	mov	rsi, rcx
	mov	edi, eax
	call	new_node@PLT
	mov	QWORD PTR -32[rbp], rax
	call	consume_ident@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 20
	jne	.L7
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -64[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 21
	jne	.L9
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L8
.L9:
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	QWORD PTR -8[rbp], rax
.L8:
	cmp	DWORD PTR -52[rbp], 16
	jne	.L10
	mov	edx, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_struct_member@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L12
.L10:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, DWORD PTR -20[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_struct_member@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L12
.L15:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	jne	.L13
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 32[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcmp@PLT
	test	eax, eax
	jne	.L13
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 4[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 40[rax], rdx
	jmp	.L14
.L13:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -16[rbp], rax
.L12:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L15
.L14:
	mov	rax, QWORD PTR -32[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	dot_arrow, .-dot_arrow
	.globl	incdec
	.type	incdec, @function
incdec:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	DWORD PTR -28[rbp], 0
	je	.L18
	cmp	DWORD PTR -28[rbp], 2
	jne	.L19
.L18:
	mov	edi, 1
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	new_node@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 14
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L20
.L19:
	mov	edi, 1
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	new_node@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	mov	edi, 14
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
.L20:
	cmp	DWORD PTR -28[rbp], 0
	je	.L21
	cmp	DWORD PTR -28[rbp], 1
	jne	.L22
.L21:
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 18
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rax], rdx
	jmp	.L23
.L22:
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 15
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
.L23:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	incdec, .-incdec
	.section	.rodata
.LC1:
	.string	"Invalid array size"
.LC2:
	.string	"Invalid assign"
	.text
	.globl	init_formula
	.type	init_formula, @function
init_formula:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 26
	jne	.L26
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 4
	jne	.L27
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L33
.L27:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 5
	jne	.L29
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	edx, DWORD PTR 24[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 64[rax]
	add	eax, 1
	cmp	edx, eax
	je	.L30
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	cmp	eax, -1
	jne	.L31
.L30:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_str
	mov	QWORD PTR -8[rbp], rax
	nop
	jmp	.L33
.L31:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L33
.L29:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L33
.L26:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	nop
.L33:
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	init_formula, .-init_formula
	.globl	array_str
	.type	array_str, @function
array_str:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	QWORD PTR -88[rbp], rdi
	mov	QWORD PTR -96[rbp], rsi
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	mov	DWORD PTR -36[rbp], eax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	edx, 0
	mov	esi, 0
	mov	edi, 37
	call	new_node@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rcx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, 72
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L36
.L39:
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index
	mov	QWORD PTR -72[rbp], rax
	cmp	DWORD PTR -20[rbp], 0
	jne	.L37
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rax], rdx
	jmp	.L38
.L37:
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR 56[rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rdx], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -32[rbp], rax
.L38:
	add	DWORD PTR -20[rbp], 1
.L36:
	mov	rax, QWORD PTR -96[rbp]
	mov	eax, DWORD PTR 64[rax]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L39
	mov	edi, 0
	call	new_node_num@PLT
	mov	rbx, rax
	mov	rax, QWORD PTR -96[rbp]
	mov	eax, DWORD PTR 64[rax]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index
	mov	rdx, rbx
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rdx], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -32[rbp], rax
	add	DWORD PTR -20[rbp], 1
	cmp	DWORD PTR -36[rbp], -1
	jne	.L40
	mov	rax, QWORD PTR -88[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 24
	jne	.L41
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR -60[rbp], eax
	mov	edx, DWORD PTR alloc_size[rip]
	mov	eax, DWORD PTR -60[rbp]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	mov	rax, QWORD PTR locals[rip]
	test	rax, rax
	je	.L42
	mov	rax, QWORD PTR locals[rip]
	mov	eax, DWORD PTR 4[rax]
	jmp	.L43
.L42:
	mov	eax, 0
.L43:
	mov	edx, DWORD PTR -60[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -88[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR 64[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR locals[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR 64[rdx]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR locals[rip]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L40
.L41:
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rbx, QWORD PTR globals[rip]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR 4[rbx], eax
.L40:
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 88
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	array_str, .-array_str
	.section	.rodata
.LC3:
	.string	","
.LC4:
	.string	"}"
	.text
	.globl	array_block
	.type	array_block, @function
array_block:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	QWORD PTR -88[rbp], rdi
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	mov	DWORD PTR -36[rbp], eax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	edx, 0
	mov	esi, 0
	mov	edi, 37
	call	new_node@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rcx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, 72
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L46
.L49:
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index
	mov	QWORD PTR -64[rbp], rax
	cmp	DWORD PTR -20[rbp], 0
	jne	.L47
	call	expr@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rax], rdx
	jmp	.L48
.L47:
	call	expr@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rdx], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -32[rbp], rax
.L48:
	lea	rdi, .LC3[rip]
	call	consume@PLT
	add	DWORD PTR -20[rbp], 1
.L46:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 13
	jne	.L49
	lea	rdi, .LC4[rip]
	call	expect@PLT
	cmp	DWORD PTR -36[rbp], -1
	jne	.L50
	mov	rax, QWORD PTR -88[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 24
	jne	.L51
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR -68[rbp], eax
	mov	edx, DWORD PTR alloc_size[rip]
	mov	eax, DWORD PTR -68[rbp]
	add	eax, edx
	mov	DWORD PTR alloc_size[rip], eax
	mov	rax, QWORD PTR locals[rip]
	test	rax, rax
	je	.L52
	mov	rax, QWORD PTR locals[rip]
	mov	eax, DWORD PTR 4[rax]
	jmp	.L53
.L52:
	mov	eax, 0
.L53:
	mov	edx, DWORD PTR -68[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -88[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR 64[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR 64[rax], edx
	mov	rax, QWORD PTR locals[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR 64[rdx]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR locals[rip]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR 24[rax], edx
	jmp	.L54
.L51:
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR 40[rax]
	mov	rbx, QWORD PTR globals[rip]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	align_array_size@PLT
	mov	DWORD PTR 4[rbx], eax
	jmp	.L54
.L50:
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	cmp	DWORD PTR -20[rbp], eax
	jle	.L55
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	error_at@PLT
	jmp	.L54
.L55:
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	cmp	DWORD PTR -20[rbp], eax
	jge	.L54
	jmp	.L56
.L57:
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	array_index
	mov	QWORD PTR -64[rbp], rax
	mov	edi, 0
	call	new_node_num@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 13
	call	new_node@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rdx], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -32[rbp], rax
	add	DWORD PTR -20[rbp], 1
	lea	rdi, .LC3[rip]
	call	consume@PLT
.L56:
	mov	rax, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	eax, DWORD PTR 24[rax]
	cmp	DWORD PTR -20[rbp], eax
	jne	.L57
.L54:
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 88
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	array_block, .-array_block
	.section	.rodata
.LC5:
	.string	"("
.LC6:
	.string	")"
	.text
	.globl	call_function
	.type	call_function, @function
call_function:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	lea	rdi, .LC5[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], 39
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 56[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 48[rax], edx
	lea	rdi, .LC6[rip]
	call	consume@PLT
	test	al, al
	je	.L60
	mov	rax, QWORD PTR -24[rbp]
	jmp	.L61
.L60:
	mov	DWORD PTR -4[rbp], 0
	mov	QWORD PTR -16[rbp], 0
.L66:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L62
	call	logical@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rax], rdx
	jmp	.L63
.L62:
	call	logical@PLT
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 24[rdx], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
.L63:
	add	DWORD PTR -4[rbp], 1
	lea	rdi, .LC3[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	jne	.L68
	jmp	.L66
.L68:
	nop
	lea	rdi, .LC6[rip]
	call	expect@PLT
	mov	rax, QWORD PTR -24[rbp]
.L61:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	call_function, .-call_function
	.globl	array_index
	.type	array_index, @function
array_index:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 21
	call	new_node@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	array_index, .-array_index
	.section	.rodata
.LC7:
	.string	"void"
	.text
	.globl	get_argument
	.type	get_argument, @function
get_argument:
.LFB15:
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
	mov	esi, 0
	lea	rdi, .LC7[rip]
	call	consume_reserved_word@PLT
	test	al, al
	je	.L72
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	QWORD PTR 24[rax], 0
	lea	rdi, .LC6[rip]
	call	expect@PLT
	jmp	.L71
.L72:
	lea	rdi, .LC6[rip]
	call	consume@PLT
	test	al, al
	je	.L74
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	QWORD PTR 24[rax], 0
	jmp	.L71
.L74:
	mov	QWORD PTR -24[rbp], 0
	mov	DWORD PTR -28[rbp], 0
	jmp	.L75
.L79:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L76
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], 38
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 48[rax], edx
	call	expr@PLT
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 16[rdx], rax
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, func_list[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	jmp	.L77
.L76:
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	DWORD PTR [rax], 38
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rbx, QWORD PTR 24[rax]
	call	expr@PLT
	mov	QWORD PTR 16[rbx], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -24[rbp], rax
.L77:
	add	DWORD PTR -28[rbp], 1
	lea	rdi, .LC3[rip]
	call	consume@PLT
	xor	eax, 1
	test	al, al
	jne	.L80
.L75:
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	je	.L79
	mov	rax, QWORD PTR token[rip]
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	je	.L79
	mov	rax, QWORD PTR token[rip]
	mov	esi, 0
	mov	rdi, rax
	call	find_defined_type@PLT
	test	rax, rax
	jne	.L79
	jmp	.L78
.L80:
	nop
.L78:
	lea	rdi, .LC6[rip]
	call	expect@PLT
.L71:
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	get_argument, .-get_argument
	.ident	"GCC: (Debian 9.3.0-18) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
