	.file	"calc.c"
	.text
	.type	add_float, @function
add_float:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add_float, .-add_float
	.type	subtract_float, @function
subtract_float:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0
	subss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	subtract_float, .-subtract_float
	.type	multiply_float, @function
multiply_float:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	multiply_float, .-multiply_float
	.type	divide_float, @function
divide_float:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-8(%rbp), %xmm0
	jp	.L8
	pxor	%xmm0, %xmm0
	ucomiss	-8(%rbp), %xmm0
	jne	.L8
	movl	$1, %eax
	jmp	.L10
.L8:
	movss	-4(%rbp), %xmm0
	divss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	divide_float, .-divide_float
	.type	power_of_float, @function
power_of_float:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movq	%rdi, -32(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jp	.L13
	pxor	%xmm0, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jne	.L13
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L13
	movl	$1, %eax
	jmp	.L16
.L13:
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L17
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jne	.L17
	movq	-32(%rbp), %rax
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, (%rax)
	movl	$0, %eax
	jmp	.L16
.L17:
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L33
	movss	-24(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	cvttss2sil	%xmm0, %eax
	jmp	.L21
.L33:
	movss	-24(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
.L21:
	movl	%eax, -8(%rbp)
	movss	-20(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L22
.L24:
	movl	-8(%rbp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L23
	movss	-12(%rbp), %xmm0
	mulss	-4(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
.L23:
	movss	-4(%rbp), %xmm0
	mulss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
.L22:
	cmpl	$0, -8(%rbp)
	jg	.L24
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L34
	movss	.LC1(%rip), %xmm0
	divss	-12(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movss	%xmm0, (%rax)
	jmp	.L27
.L34:
	movq	-32(%rbp), %rax
	movss	-12(%rbp), %xmm0
	movss	%xmm0, (%rax)
.L27:
	movl	$0, %eax
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	power_of_float, .-power_of_float
	.section	.rodata
.LC3:
	.string	"None"
.LC4:
	.string	"Cannot divide by zero"
	.align 8
.LC5:
	.string	"Square root of negative number is not supported"
	.text
	.globl	get_calc_err_msg
	.type	get_calc_err_msg, @function
get_calc_err_msg:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L36
	cmpl	$2, -4(%rbp)
	jg	.L37
	cmpl	$0, -4(%rbp)
	je	.L38
	cmpl	$1, -4(%rbp)
	je	.L39
	jmp	.L37
.L38:
	leaq	.LC3(%rip), %rax
	jmp	.L40
.L39:
	leaq	.LC4(%rip), %rax
	jmp	.L40
.L36:
	leaq	.LC5(%rip), %rax
	jmp	.L40
.L37:
	leaq	.LC3(%rip), %rax
.L40:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_calc_err_msg, .-get_calc_err_msg
	.section	.rodata
.LC11:
	.string	"final result is %f\r\n"
	.text
	.globl	create_calc_queue
	.type	create_calc_queue, @function
create_calc_queue:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	init_queue@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movss	.LC6(%rip), %xmm1
	movl	.LC6(%rip), %edx
	movd	%edx, %xmm0
	movl	$5, %edx
	leaq	power_of_float(%rip), %rsi
	movq	%rax, %rdi
	call	enqueue@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movss	.LC7(%rip), %xmm1
	movl	.LC0(%rip), %edx
	movd	%edx, %xmm0
	movl	$4, %edx
	leaq	multiply_float(%rip), %rsi
	movq	%rax, %rdi
	call	enqueue@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movss	.LC8(%rip), %xmm1
	movl	.LC0(%rip), %edx
	movd	%edx, %xmm0
	movl	$3, %edx
	leaq	subtract_float(%rip), %rsi
	movq	%rax, %rdi
	call	enqueue@PLT
	movq	-24(%rbp), %rax
	movl	$1, %r8d
	movl	$0, %ecx
	movss	.LC1(%rip), %xmm1
	movl	.LC9(%rip), %edx
	movd	%edx, %xmm0
	movl	$2, %edx
	leaq	add_float(%rip), %rsi
	movq	%rax, %rdi
	call	enqueue@PLT
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movl	$1, %ecx
	movss	.LC10(%rip), %xmm1
	movl	.LC0(%rip), %edx
	movd	%edx, %xmm0
	movl	$1, %edx
	leaq	divide_float(%rip), %rsi
	movq	%rax, %rdi
	call	enqueue@PLT
	movq	-24(%rbp), %rax
	movss	.LC6(%rip), %xmm1
	movl	.LC6(%rip), %edx
	movd	%edx, %xmm0
	movq	%rax, %rdi
	call	process_queue@PLT
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movq	%xmm2, %rdx
	movq	stdout(%rip), %rax
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	create_calc_queue, .-create_calc_queue
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-20(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	create_calc_queue
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L44
	call	__stack_chk_fail@PLT
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.align 4
.LC1:
	.long	1065353216
	.align 16
.LC2:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC6:
	.long	1077936128
	.align 4
.LC7:
	.long	1091567616
	.align 4
.LC8:
	.long	1092616192
	.align 4
.LC9:
	.long	1073741824
	.align 4
.LC10:
	.long	1078981768
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
