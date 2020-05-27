.intel_syntax noprefix
.globl main
main:
	push rbp
	mov rbp,rsp
	sub rsp,8
	mov rax,rbp
	sub rax,8
	push rax
	push 0
	pop rdi
	pop rax
	mov [rax],rdi
	push rdi
	pop rax
	push 3
	push 2
	pop rdi
	pop rax
	cmp rdi,rax
	setl al
	movzb rax,al
	push rax
	pop rax
	cmp rax,0
	je .Lend000
	mov rax,rbp
	sub rax,8
	push rax
	push 1
	pop rdi
	pop rax
	mov [rax],rdi
	push rdi
.Lend000:
	pop rax
	mov rax,rbp
	sub rax,8
	push rax
	pop rax
	mov rax,[rax]
	push rax
	pop rax
	mov rsp,rbp
	pop rbp
	ret

