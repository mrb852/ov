	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _true
	ori	$3, $0, 4
	sw	$3, 0($4)
	la	$3, _false
	ori	$4, $0, 5
	sw	$4, 0($3)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
greater:
	sw	$31, -4($29)
	addi	$29, $29, -8
	ori	$3, $0, 5
	slt	$2, $3, $2
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
filterFun:
	sw	$31, -4($29)
	sw	$21, -28($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -32
	lw	$17, 0($2)
	ori	$16, $28, 0
	sll	$3, $17, 2
	addi	$3, $3, 4
	add	$28, $28, $3
	sw	$17, 0($16)
	addi	$20, $16, 4
	ori	$18, $0, 0
	ori	$19, $0, 0
	addi	$21, $2, 4
_loop_beg_14_:
	sub	$2, $18, $17
	bgez	$2, _loop_end_15_
	lw	$2, 0($21)
	jal	greater
	beq	$2, $0, _loop_continue_16_
	lw	$2, 0($21)
	sw	$2, 0($20)
	addi	$20, $20, 4
	addi	$19, $19, 1
_loop_continue_16_:
	addi	$18, $18, 1
	addi	$21, $21, 4
	j	_loop_beg_14_
_loop_end_15_:
	sw	$19, 0($16)
	ori	$2, $16, 0
	addi	$29, $29, 32
	lw	$21, -28($29)
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
main:
	sw	$31, -4($29)
	addi	$29, $29, -8
	ori	$4, $0, 7
	ori	$2, $28, 0
	sll	$3, $4, 2
	addi	$3, $3, 4
	add	$28, $28, $3
	sw	$4, 0($2)
	addi	$3, $2, 4
	ori	$4, $0, 1
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 2
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 3
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 4
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 10
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 20
	sw	$4, 0($3)
	addi	$3, $3, 4
	ori	$4, $0, 30
	sw	$4, 0($3)
	addi	$3, $3, 4
	jal	filterFun
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
dynalloc:
	ori	$4, $2, 0
	ori	$2, $0, 9
	syscall
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_IllegalArrSizeError_:
	la	$4, _IllegalArrSizeString_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
_IllegalArrSizeString_:
	.asciiz	"Error: Array size less or equal to 0 at line "
	.align	2
_true:
	.space	4
	.asciiz	"True"
	.align	2
_false:
	.space	4
	.asciiz	"False"
	.align	2
_heap_:
	.space	100000
