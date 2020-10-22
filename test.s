	.file	"test.c"
	.option nopic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"hello"
	.align	3
.LC1:
	.string	"same!"
	.align	3
.LC2:
	.string	"different!"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	addi	a5,a5,1
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,101
	bne	a4,a5,.L2
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L3
.L2:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L3:
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
