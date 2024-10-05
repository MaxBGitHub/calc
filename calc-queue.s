	.file	"queue.c"
	.text
	.globl	init_queue
	.type	init_queue, @function
init_queue:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	init_queue, .-init_queue
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movss	%xmm0, -40(%rbp)
	movss	%xmm1, -44(%rbp)
	movl	%ecx, -48(%rbp)
	movl	%r8d, -52(%rbp)
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movss	-40(%rbp), %xmm0
	movss	%xmm0, 12(%rax)
	movq	-8(%rbp), %rax
	movss	-44(%rbp), %xmm0
	movss	%xmm0, 16(%rax)
	movq	-8(%rbp), %rax
	movl	-48(%rbp), %edx
	movl	%edx, 20(%rax)
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	cmpl	%eax, -36(%rbp)
	jle	.L4
.L3:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L5
.L4:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L6
.L8:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
.L6:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L7
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movl	8(%rax), %eax
	cmpl	%eax, -36(%rbp)
	jle	.L8
.L7:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 32(%rax)
	nop
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	enqueue, .-enqueue
	.section	.rodata
	.align 8
.LC1:
	.string	"function %p resulted in error %s\r\n"
	.text
	.globl	process_queue
	.type	process_queue, @function
process_queue:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movss	%xmm0, -60(%rbp)
	movss	%xmm1, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movss	%xmm0, -36(%rbp)
	movl	$1, -32(%rbp)
	jmp	.L10
.L18:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	cmpl	$0, -32(%rbp)
	je	.L11
	movss	-60(%rbp), %xmm0
	movss	%xmm0, -28(%rbp)
	movss	-64(%rbp), %xmm0
	movss	%xmm0, -24(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L12
.L11:
	movq	-16(%rbp), %rax
	movl	20(%rax), %eax
	testl	%eax, %eax
	jne	.L13
	movq	-16(%rbp), %rax
	movss	12(%rax), %xmm0
	jmp	.L14
.L13:
	movss	-36(%rbp), %xmm0
.L14:
	movss	%xmm0, -28(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	jne	.L15
	movq	-16(%rbp), %rax
	movss	16(%rax), %xmm0
	jmp	.L16
.L15:
	movss	-36(%rbp), %xmm0
.L16:
	movss	%xmm0, -24(%rbp)
.L12:
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	leaq	-36(%rbp), %rdx
	movss	-24(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	*%rcx
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	cmpl	$0, -20(%rbp)
	je	.L10
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	get_calc_err_msg@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L17
.L10:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L18
.L17:
	movss	-36(%rbp), %xmm0
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	process_queue, .-process_queue
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
