	.file	"parse_util.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"unknown type"
	.text
	.globl	type_size
	.type	type_size, @function
type_size:
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
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	ja	.L2
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L4[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L4[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L11-.L4
	.long	.L10-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L11:
	mov	eax, 1
	jmp	.L12
.L10:
	mov	eax, 1
	jmp	.L12
.L9:
	mov	eax, 1
	jmp	.L12
.L8:
	mov	eax, 4
	jmp	.L12
.L7:
	mov	eax, 8
	jmp	.L12
.L6:
	mov	rax, QWORD PTR -24[rbp]
	mov	ebx, DWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	type_size
	imul	eax, ebx
	jmp	.L12
.L5:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	jmp	.L12
.L3:
	mov	eax, 4
	jmp	.L12
.L2:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	error_at@PLT
	mov	eax, -1
.L12:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	type_size, .-type_size
	.globl	type_align
	.type	type_align, @function
type_align:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 7
	ja	.L14
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L16[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L16[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L16:
	.long	.L23-.L16
	.long	.L22-.L16
	.long	.L21-.L16
	.long	.L20-.L16
	.long	.L19-.L16
	.long	.L18-.L16
	.long	.L17-.L16
	.long	.L15-.L16
	.text
.L23:
	mov	eax, 1
	jmp	.L24
.L22:
	mov	eax, 1
	jmp	.L24
.L21:
	mov	eax, 1
	jmp	.L24
.L20:
	mov	eax, 4
	jmp	.L24
.L19:
	mov	eax, 8
	jmp	.L24
.L18:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	type_align
	jmp	.L24
.L17:
	mov	edx, DWORD PTR -16[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	find_struct_member@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L25
.L27:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	rdi, rax
	call	type_align
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jge	.L26
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -20[rbp], eax
.L26:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -8[rbp], rax
.L25:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L27
	mov	eax, DWORD PTR -20[rbp]
	jmp	.L24
.L15:
	mov	eax, 4
	jmp	.L24
.L14:
	mov	rax, QWORD PTR token[rip]
	mov	rax, QWORD PTR 24[rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	error_at@PLT
	mov	eax, -1
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	type_align, .-type_align
	.globl	align_array_size
	.type	align_array_size, @function
align_array_size:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	and	eax, 7
	test	eax, eax
	je	.L29
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 7[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 3
	add	eax, 1
	sal	eax, 3
	jmp	.L31
.L29:
	mov	eax, DWORD PTR -4[rbp]
.L31:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	align_array_size, .-align_array_size
	.globl	get_pointer_type
	.type	get_pointer_type, @function
get_pointer_type:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi
	jmp	.L33
.L34:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
.L33:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	jne	.L34
	mov	rax, QWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_pointer_type, .-get_pointer_type
	.globl	pointer_calc
	.type	pointer_calc, @function
pointer_calc:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jbe	.L37
	mov	rax, QWORD PTR -48[rbp]
	jmp	.L38
.L37:
	mov	rax, QWORD PTR -56[rbp]
.L38:
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 40[rdx], rax
	mov	esi, 72
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 27
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	DWORD PTR [rax], 3
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_size
	mov	DWORD PTR 16[rbx], eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 40[rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rbx, QWORD PTR 40[rdx]
	mov	rdi, rax
	call	type_align
	mov	DWORD PTR 20[rbx], eax
	mov	rax, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jbe	.L39
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L39
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	new_node@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rdx], rax
	jmp	.L40
.L39:
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 3
	jbe	.L40
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L40
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 48[rax], edx
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rsi, rax
	mov	edi, 2
	call	new_node@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 8[rdx], rax
.L40:
	mov	rax, QWORD PTR -40[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	pointer_calc, .-pointer_calc
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
