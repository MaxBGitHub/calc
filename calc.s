	.file	"calc.c"
	.text
	.type	is_operator_right_associative, @function
is_operator_right_associative:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$94, -4(%rbp)
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	is_operator_right_associative, .-is_operator_right_associative
	.type	is_operator_token, @function
is_operator_token:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	cmpl	$47, %eax
	jg	.L4
	cmpl	$37, %eax
	jge	.L5
	jmp	.L6
.L8:
	subl	$92, %eax
	movabsq	$4294967301, %rdx
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L7
	jmp	.L6
.L5:
	movl	%eax, %edx
	movabsq	$189253438930944, %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L7
	jmp	.L6
.L4:
	cmpl	$124, %eax
	jg	.L6
	cmpl	$92, %eax
	jge	.L8
	jmp	.L6
.L7:
	movl	$1, %eax
	jmp	.L9
.L6:
	movl	$0, %eax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	is_operator_token, .-is_operator_token
	.type	is_digit_or_floating_point, @function
is_digit_or_floating_point:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	cmpl	$46, %eax
	je	.L11
	cmpl	$46, %eax
	jl	.L12
	subl	$48, %eax
	cmpl	$9, %eax
	ja	.L12
.L11:
	movl	$1, %eax
	jmp	.L13
.L12:
	movl	$0, %eax
.L13:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	is_digit_or_floating_point, .-is_digit_or_floating_point
	.type	is_math_token, @function
is_math_token:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	cmpl	$57, %eax
	jg	.L15
	cmpl	$37, %eax
	jge	.L16
	jmp	.L17
.L19:
	subl	$92, %eax
	movabsq	$4294967301, %rdx
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L18
	jmp	.L17
.L16:
	movl	%eax, %edx
	movabsq	$288211821892993024, %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L18
	jmp	.L17
.L15:
	cmpl	$124, %eax
	jg	.L17
	cmpl	$92, %eax
	jge	.L19
	jmp	.L17
.L18:
	movl	$1, %eax
	jmp	.L20
.L17:
	movl	$0, %eax
.L20:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	is_math_token, .-is_math_token
	.type	precedence, @function
precedence:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	cmpl	$124, %eax
	je	.L22
	cmpl	$124, %eax
	jg	.L23
	cmpl	$94, %eax
	je	.L24
	cmpl	$94, %eax
	jg	.L23
	cmpl	$47, %eax
	jg	.L25
	cmpl	$37, %eax
	jl	.L23
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movabsq	$145272973819904, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L26
	movabsq	$43980465111040, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L27
	jmp	.L23
.L25:
	cmpl	$92, %eax
	je	.L26
	jmp	.L23
.L27:
	movl	$1, %eax
	jmp	.L28
.L26:
	movl	$2, %eax
	jmp	.L28
.L24:
	movl	$3, %eax
	jmp	.L28
.L22:
	movl	$4, %eax
	jmp	.L28
.L23:
	movl	$0, %eax
.L28:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	precedence, .-precedence
	.type	add_f, @function
add_f:
.LFB5:
	.cfi_startproc
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
.LFE5:
	.size	add_f, .-add_f
	.type	subtract_f, @function
subtract_f:
.LFB6:
	.cfi_startproc
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
.LFE6:
	.size	subtract_f, .-subtract_f
	.type	multiply_f, @function
multiply_f:
.LFB7:
	.cfi_startproc
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
.LFE7:
	.size	multiply_f, .-multiply_f
	.type	divide_f, @function
divide_f:
.LFB8:
	.cfi_startproc
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
	jp	.L36
	pxor	%xmm0, %xmm0
	ucomiss	-8(%rbp), %xmm0
	jne	.L36
	movl	$1, %eax
	jmp	.L38
.L36:
	movss	-4(%rbp), %xmm0
	divss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
.L38:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	divide_f, .-divide_f
	.type	modulo_f, @function
modulo_f:
.LFB9:
	.cfi_startproc
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
	jp	.L41
	pxor	%xmm0, %xmm0
	ucomiss	-8(%rbp), %xmm0
	jne	.L41
	movl	$1, %eax
	jmp	.L43
.L41:
	movss	-4(%rbp), %xmm0
	divss	-8(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movaps	%xmm0, %xmm1
	mulss	-8(%rbp), %xmm1
	movss	-4(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, %eax
.L43:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	modulo_f, .-modulo_f
	.type	powerof_f, @function
powerof_f:
.LFB10:
	.cfi_startproc
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
	jp	.L46
	pxor	%xmm0, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jne	.L46
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L46
	movl	$1, %eax
	jmp	.L49
.L46:
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jp	.L50
	pxor	%xmm0, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jne	.L50
	movq	-32(%rbp), %rax
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, (%rax)
	movl	$0, %eax
	jmp	.L49
.L50:
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L66
	movss	-24(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	cvttss2sil	%xmm0, %eax
	jmp	.L54
.L66:
	movss	-24(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
.L54:
	movl	%eax, -8(%rbp)
	movss	-20(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L55
.L57:
	movl	-8(%rbp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L56
	movss	-12(%rbp), %xmm0
	mulss	-4(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
.L56:
	movss	-4(%rbp), %xmm0
	mulss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
.L55:
	cmpl	$0, -8(%rbp)
	jg	.L57
	pxor	%xmm0, %xmm0
	comiss	-24(%rbp), %xmm0
	jbe	.L67
	movss	.LC1(%rip), %xmm0
	divss	-12(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movss	%xmm0, (%rax)
	jmp	.L60
.L67:
	movq	-32(%rbp), %rax
	movss	-12(%rbp), %xmm0
	movss	%xmm0, (%rax)
.L60:
	movl	$0, %eax
.L49:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	powerof_f, .-powerof_f
	.type	sqrtof_f, @function
sqrtof_f:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -36(%rbp)
	movq	%rdi, -48(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-36(%rbp), %xmm0
	jbe	.L83
	movl	$2, %eax
	jmp	.L71
.L83:
	pxor	%xmm0, %xmm0
	ucomiss	-36(%rbp), %xmm0
	jp	.L72
	pxor	%xmm0, %xmm0
	ucomiss	-36(%rbp), %xmm0
	jne	.L72
	movq	-48(%rbp), %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	$0, %eax
	jmp	.L71
.L72:
	movss	-36(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	$100, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L74
.L79:
	movss	-36(%rbp), %xmm0
	divss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	addss	-20(%rbp), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	-4(%rbp), %xmm1
	movss	-12(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L75
	movss	-4(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	-20(%rbp), %xmm1
	movss	-12(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L84
.L75:
	movss	-4(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
.L74:
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	cmpl	%eax, -8(%rbp)
	jg	.L79
	jmp	.L78
.L84:
	nop
.L78:
	movq	-48(%rbp), %rax
	movss	-20(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movl	$0, %eax
.L71:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	sqrtof_f, .-sqrtof_f
	.section	.rodata
.LC5:
	.string	"None"
.LC6:
	.string	"Cannot divide by zero"
	.align 8
.LC7:
	.string	"Square root of negative number is not supported"
	.text
	.globl	get_calc_err_msg
	.type	get_calc_err_msg, @function
get_calc_err_msg:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L86
	cmpl	$2, -4(%rbp)
	jg	.L87
	cmpl	$0, -4(%rbp)
	je	.L88
	cmpl	$1, -4(%rbp)
	je	.L89
	jmp	.L87
.L88:
	leaq	.LC5(%rip), %rax
	jmp	.L90
.L89:
	leaq	.LC6(%rip), %rax
	jmp	.L90
.L86:
	leaq	.LC7(%rip), %rax
	jmp	.L90
.L87:
	leaq	.LC5(%rip), %rax
.L90:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	get_calc_err_msg, .-get_calc_err_msg
	.globl	get_token_string_length
	.type	get_token_string_length, @function
get_token_string_length:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$1024, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L92
.L94:
	addq	$1, -16(%rbp)
.L92:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jnb	.L93
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L94
.L93:
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	get_token_string_length, .-get_token_string_length
	.globl	get_token_count
	.type	get_token_count, @function
get_token_count:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L97
.L99:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_math_token
	testl	%eax, %eax
	je	.L98
	addq	$1, -16(%rbp)
.L98:
	addq	$1, -8(%rbp)
.L97:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L99
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	get_token_count, .-get_token_count
	.section	.rodata
.LC8:
	.string	"invalid tokens array\r\n"
	.text
	.globl	normalize_calc_input
	.type	normalize_calc_input, @function
normalize_calc_input:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpq	$0, -136(%rbp)
	jne	.L102
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %eax
	jmp	.L103
.L102:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	get_token_string_length
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token_count
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -80(%rbp)
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%rax, %r12
	movl	$0, %r13d
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L104:
	cmpq	%rdx, %rsp
	je	.L105
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L104
.L105:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L106
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L106:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -72(%rbp)
	movl	$0, -116(%rbp)
	movq	$0, -112(%rbp)
	jmp	.L107
.L109:
	movq	-136(%rbp), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_math_token
	testl	%eax, %eax
	je	.L108
	movl	-116(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -116(%rbp)
	movq	-112(%rbp), %rdx
	movl	%edx, %ecx
	movq	-72(%rbp), %rdx
	cltq
	movl	%ecx, (%rdx,%rax,4)
.L108:
	addq	$1, -112(%rbp)
.L107:
	movq	-112(%rbp), %rax
	cmpq	-96(%rbp), %rax
	jb	.L109
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, %rdx
	movq	-144(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L110
	movl	$0, %eax
	jmp	.L103
.L110:
	movq	$0, -104(%rbp)
	jmp	.L111
.L112:
	movq	-72(%rbp), %rax
	movq	-104(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	-136(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-144(%rbp), %rax
	movq	(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
	addq	$1, -104(%rbp)
.L111:
	movq	-104(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jb	.L112
	movq	-144(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-64(%rbp), %rax
.L103:
	movq	%rbx, %rsp
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L114
	call	__stack_chk_fail@PLT
.L114:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	normalize_calc_input, .-normalize_calc_input
	.globl	char_stack_push
	.type	char_stack_push, @function
char_stack_push:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	cmpl	$1022, %eax
	jg	.L117
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 1024(%rax)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	movq	-8(%rbp), %rdx
	cltq
	movzbl	-12(%rbp), %ecx
	movb	%cl, (%rdx,%rax)
.L117:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	char_stack_push, .-char_stack_push
	.globl	char_stack_pop
	.type	char_stack_pop, @function
char_stack_pop:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	testl	%eax, %eax
	js	.L119
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, 1024(%rdx)
	movq	-8(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	jmp	.L120
.L119:
	movl	$0, %eax
.L120:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	char_stack_pop, .-char_stack_pop
	.globl	char_stack_peek
	.type	char_stack_peek, @function
char_stack_peek:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	testl	%eax, %eax
	js	.L122
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	movq	-8(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	jmp	.L123
.L122:
	movl	$0, %eax
.L123:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	char_stack_peek, .-char_stack_peek
	.globl	char_stack_is_empty
	.type	char_stack_is_empty, @function
char_stack_is_empty:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	cmpl	$-1, %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	char_stack_is_empty, .-char_stack_is_empty
	.globl	float_stack_push
	.type	float_stack_push, @function
float_stack_push:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	cmpl	$1022, %eax
	jg	.L128
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4096(%rax)
	movq	-8(%rbp), %rax
	movl	4096(%rax), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movss	-12(%rbp), %xmm0
	movss	%xmm0, (%rax,%rdx,4)
.L128:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	float_stack_push, .-float_stack_push
	.globl	float_stack_pop
	.type	float_stack_pop, @function
float_stack_pop:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	testl	%eax, %eax
	js	.L130
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, 4096(%rdx)
	movq	-8(%rbp), %rdx
	cltq
	movss	(%rdx,%rax,4), %xmm0
	jmp	.L131
.L130:
	pxor	%xmm0, %xmm0
.L131:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	float_stack_pop, .-float_stack_pop
	.globl	float_stack_peek
	.type	float_stack_peek, @function
float_stack_peek:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	testl	%eax, %eax
	js	.L133
	movq	-8(%rbp), %rax
	movl	4096(%rax), %edx
	movq	-8(%rbp), %rax
	movslq	%edx, %rdx
	movss	(%rax,%rdx,4), %xmm0
	jmp	.L134
.L133:
	pxor	%xmm0, %xmm0
.L134:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	float_stack_peek, .-float_stack_peek
	.globl	float_stack_is_empty
	.type	float_stack_is_empty, @function
float_stack_is_empty:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	4096(%rax), %eax
	cmpl	$-1, %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	float_stack_is_empty, .-float_stack_is_empty
	.globl	infix_to_postfix
	.type	infix_to_postfix, @function
infix_to_postfix:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1128, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -1160(%rbp)
	movq	%rsi, -1168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-1088(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$-1, -64(%rbp)
	movl	$0, -1144(%rbp)
	movl	$0, -1140(%rbp)
	movl	$32, -1128(%rbp)
	movb	$32, -1146(%rbp)
	jmp	.L138
.L159:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_digit_or_floating_point
	testl	%eax, %eax
	je	.L139
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	-1128(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, -1104(%rbp)
	movl	-1128(%rbp), %eax
	cltq
	movq	%rax, %r12
	movl	$0, %r13d
	movl	-1128(%rbp), %eax
	cltq
	movq	%rax, %r14
	movl	$0, %r15d
	movl	-1128(%rbp), %eax
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L140:
	cmpq	%rdx, %rsp
	je	.L141
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L140
.L141:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L142
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L142:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -1096(%rbp)
	movl	$0, -1136(%rbp)
	jmp	.L143
.L145:
	movl	-1144(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1144(%rbp)
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-1136(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1136(%rbp)
	movzbl	(%rcx), %ecx
	movq	-1096(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
.L143:
	movl	-1136(%rbp), %eax
	cmpl	-1128(%rbp), %eax
	jge	.L144
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_digit_or_floating_point
	testl	%eax, %eax
	jne	.L145
.L144:
	movq	-1096(%rbp), %rdx
	movl	-1136(%rbp), %eax
	cltq
	movb	$0, (%rdx,%rax)
	movl	$0, -1132(%rbp)
	jmp	.L146
.L147:
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-1096(%rbp), %rdx
	movl	-1132(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	movb	%al, (%rcx)
	addl	$1, -1132(%rbp)
.L146:
	movl	-1132(%rbp), %eax
	cmpl	-1136(%rbp), %eax
	jl	.L147
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-1146(%rbp), %eax
	movb	%al, (%rdx)
	movq	%rbx, %rsp
	jmp	.L138
.L139:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$40, %al
	jne	.L148
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-1088(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	char_stack_push
	addl	$1, -1144(%rbp)
	jmp	.L138
.L148:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$41, %al
	jne	.L149
	jmp	.L150
.L152:
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_pop
	movb	%al, (%rbx)
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-1146(%rbp), %eax
	movb	%al, (%rdx)
.L150:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_is_empty
	testl	%eax, %eax
	jne	.L151
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_peek
	cmpb	$40, %al
	jne	.L152
.L151:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_pop
	addl	$1, -1144(%rbp)
	jmp	.L138
.L149:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_operator_token
	testl	%eax, %eax
	je	.L138
	jmp	.L153
.L158:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_peek
	movb	%al, -1145(%rbp)
	movsbl	-1145(%rbp), %eax
	movl	%eax, %edi
	call	precedence
	movl	%eax, -1124(%rbp)
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	precedence
	movl	%eax, -1120(%rbp)
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_operator_right_associative
	movl	%eax, -1116(%rbp)
	movl	-1124(%rbp), %eax
	cmpl	-1120(%rbp), %eax
	setg	%al
	movzbl	%al, %eax
	movl	%eax, -1112(%rbp)
	movl	-1124(%rbp), %eax
	cmpl	-1120(%rbp), %eax
	jne	.L154
	cmpl	$0, -1116(%rbp)
	jne	.L154
	movl	$1, %eax
	jmp	.L155
.L154:
	movl	$0, %eax
.L155:
	movl	%eax, -1108(%rbp)
	cmpl	$0, -1112(%rbp)
	jne	.L156
	cmpl	$0, -1108(%rbp)
	je	.L157
.L156:
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_pop
	movb	%al, (%rbx)
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-1146(%rbp), %eax
	movb	%al, (%rdx)
.L153:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_is_empty
	testl	%eax, %eax
	je	.L158
.L157:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-1088(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	char_stack_push
	addl	$1, -1144(%rbp)
.L138:
	movl	-1144(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L159
	jmp	.L160
.L161:
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_pop
	movb	%al, (%rbx)
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-1146(%rbp), %eax
	movb	%al, (%rdx)
.L160:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	char_stack_is_empty
	testl	%eax, %eax
	je	.L161
	movl	-1140(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -1140(%rbp)
	movslq	%eax, %rdx
	movq	-1168(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L162
	call	__stack_chk_fail@PLT
.L162:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	infix_to_postfix, .-infix_to_postfix
	.section	.rodata
	.align 8
.LC9:
	.string	"add_f(a, b) -> add_f(%f, %f) -> %f\r\n"
	.align 8
.LC10:
	.string	"subtract_f(a, b) -> subtract_f(%f, %f) -> %f\r\n"
	.align 8
.LC11:
	.string	"multiply_f(a, b) -> multiply_f(%f, %f) -> %f\r\n"
	.align 8
.LC12:
	.string	"divide_f(a, b) -> divide_f(%f, %f) -> %f\r\n"
	.align 8
.LC13:
	.string	"modulo_f(a, b) -> modulo_f(%f, %f) -> %f\r\n"
	.align 8
.LC14:
	.string	"sqrtof_f(b) -> sqrtof_f(%f) -> %f\r\n"
	.align 8
.LC15:
	.string	"powerof_f(a, b) -> powerof_f(%f, %f) -> %f\r\n"
	.align 8
.LC16:
	.string	"%f %c %f resulted in error (%d): %s\r\n"
	.text
	.globl	execute_operation
	.type	execute_operation, @function
execute_operation:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %eax
	movq	%rsi, -48(%rbp)
	movb	%al, -36(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movsbl	-36(%rbp), %eax
	cmpl	$124, %eax
	je	.L164
	cmpl	$124, %eax
	jg	.L165
	cmpl	$94, %eax
	je	.L166
	cmpl	$94, %eax
	jg	.L165
	cmpl	$47, %eax
	jg	.L167
	cmpl	$37, %eax
	jl	.L165
	subl	$37, %eax
	cmpl	$10, %eax
	ja	.L165
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L169(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L169(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L169:
	.long	.L173-.L169
	.long	.L165-.L169
	.long	.L165-.L169
	.long	.L165-.L169
	.long	.L165-.L169
	.long	.L172-.L169
	.long	.L171-.L169
	.long	.L165-.L169
	.long	.L170-.L169
	.long	.L165-.L169
	.long	.L168-.L169
	.text
.L167:
	cmpl	$92, %eax
	je	.L168
	jmp	.L165
.L171:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	add_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	-20(%rbp), %xmm3
	movq	%xmm3, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L170:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	subtract_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	-20(%rbp), %xmm4
	movq	%xmm4, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L172:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	multiply_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	-20(%rbp), %xmm5
	movq	%xmm5, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L168:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	divide_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm6, %xmm6
	cvtss2sd	-20(%rbp), %xmm6
	movq	%xmm6, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L173:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	modulo_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm7, %xmm7
	cvtss2sd	-20(%rbp), %xmm7
	movq	%xmm7, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L164:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	leaq	-24(%rbp), %rdx
	movl	-16(%rbp), %eax
	movq	%rdx, %rdi
	movd	%eax, %xmm0
	call	sqrtof_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	-16(%rbp), %xmm3
	movq	%xmm3, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$2, %eax
	call	fprintf@PLT
	jmp	.L174
.L166:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	leaq	-24(%rbp), %rdx
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	powerof_f
	movl	%eax, -12(%rbp)
	movss	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	-20(%rbp), %xmm4
	movq	%xmm4, %rdx
	movq	stdout(%rip), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf@PLT
	jmp	.L174
.L165:
	movl	$3, -12(%rbp)
.L174:
	cmpl	$0, -12(%rbp)
	jne	.L175
	movl	-24(%rbp), %edx
	movq	-48(%rbp), %rax
	movd	%edx, %xmm0
	movq	%rax, %rdi
	call	float_stack_push
	jmp	.L178
.L175:
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	get_calc_err_msg
	movq	%rax, %rdi
	pxor	%xmm0, %xmm0
	cvtss2sd	-16(%rbp), %xmm0
	movsbl	-36(%rbp), %edx
	pxor	%xmm5, %xmm5
	cvtss2sd	-20(%rbp), %xmm5
	movq	%xmm5, %rsi
	movq	stdout(%rip), %rax
	movl	-12(%rbp), %ecx
	movq	%rdi, %r8
	movapd	%xmm0, %xmm1
	movq	%rsi, %xmm0
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	movl	$2, %eax
	call	fprintf@PLT
.L178:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L177
	call	__stack_chk_fail@PLT
.L177:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	execute_operation, .-execute_operation
	.globl	evaluate_postfix
	.type	evaluate_postfix, @function
evaluate_postfix:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$96, %rsp
	movq	%rdi, -4184(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-4160(%rbp), %rdx
	movl	$0, %eax
	movl	$512, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$-1, -64(%rbp)
	movl	$0, -4168(%rbp)
	jmp	.L180
.L186:
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L181
	addl	$1, -4168(%rbp)
	jmp	.L180
.L181:
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_digit_or_floating_point
	testl	%eax, %eax
	je	.L182
	movl	$0, -4164(%rbp)
	jmp	.L183
.L185:
	movl	-4168(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4168(%rbp)
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4164(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4164(%rbp)
	movzbl	(%rcx), %edx
	cltq
	movb	%dl, -48(%rbp,%rax)
.L183:
	cmpl	$31, -4164(%rbp)
	jg	.L184
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_digit_or_floating_point
	testl	%eax, %eax
	jne	.L185
.L184:
	movl	-4164(%rbp), %eax
	cltq
	movb	$0, -48(%rbp,%rax)
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtof@PLT
	movd	%xmm0, %eax
	leaq	-4160(%rbp), %rdx
	movd	%eax, %xmm0
	movq	%rdx, %rdi
	call	float_stack_push
	jmp	.L180
.L182:
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	is_operator_token
	testl	%eax, %eax
	je	.L180
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	leaq	-4160(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	execute_operation
	addl	$1, -4168(%rbp)
.L180:
	movl	-4168(%rbp), %eax
	movslq	%eax, %rdx
	movq	-4184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L186
	leaq	-4160(%rbp), %rax
	movq	%rax, %rdi
	call	float_stack_pop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L188
	call	__stack_chk_fail@PLT
.L188:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	evaluate_postfix, .-evaluate_postfix
	.section	.rodata
.LC17:
	.string	"input: %s\r\n"
	.align 8
.LC18:
	.string	"failed to get postfix from shunting yard\r\n"
	.align 8
.LC19:
	.string	"postfix shunting yard (%d): %s\r\n"
.LC20:
	.string	"result: %f\r\n"
.LC21:
	.string	"\r\n"
	.text
	.globl	evaluate_expression
	.type	evaluate_expression, @function
evaluate_expression:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movq	%rdi, -1080(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-1056(%rbp), %rdx
	movq	-1080(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	normalize_calc_input
	movq	-1056(%rbp), %rdx
	movq	stdout(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-1056(%rbp), %rax
	leaq	-1040(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	infix_to_postfix
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -1048(%rbp)
	cmpq	$0, -1048(%rbp)
	jne	.L190
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L189
.L190:
	movq	-1048(%rbp), %rax
	movl	%eax, %esi
	movq	stdout(%rip), %rax
	leaq	-1040(%rbp), %rdx
	movq	%rdx, %rcx
	movl	%esi, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	evaluate_postfix
	movd	%xmm0, %eax
	movl	%eax, -1060(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-1060(%rbp), %xmm1
	movq	%xmm1, %rdx
	movq	stdout(%rip), %rax
	movq	%rdx, %xmm0
	leaq	.LC20(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L189:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L192
	call	__stack_chk_fail@PLT
.L192:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	evaluate_expression, .-evaluate_expression
	.section	.rodata
.LC22:
	.string	"%s\r\n"
	.align 8
.LC23:
	.string	"\t\tSimple calculator by Max Bader (services.bader@gmail.com)\r\n"
.LC24:
	.string	"\t\t Available operators are:\r\n"
.LC25:
	.string	"\t\t\t%c        - Add (a + b)\r\n"
	.align 8
.LC26:
	.string	"\t\t\t%c        - Subtract (a - b)\r\n"
	.align 8
.LC27:
	.string	"\t\t\t%c        - Multiply (a * b)\r\n"
	.align 8
.LC28:
	.string	"\t\t\t%c        - Divide (a / b)\r\n"
	.align 8
.LC29:
	.string	"\t\t\t%c        - Divide (a \\ b)\r\n"
	.align 8
.LC30:
	.string	"\t\t\t%c        - Modulo (a %% b)\r\n"
	.align 8
.LC31:
	.string	"\t\t\t%c        - Power of (a ^ b)\r\n"
	.align 8
.LC32:
	.string	"\t\t\t%c        - Square root of (|a)\r\n"
.LC33:
	.string	"\t\t\t%c        - Start group\r\n"
.LC34:
	.string	"\t\t\t%c        - End group\r\n"
	.text
	.globl	print_help
	.type	print_help, @function
print_help:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$80, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$80, %edx
	movl	$61, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	stdout(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$61, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stdout(%rip), %rax
	movl	$43, %edx
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$45, %edx
	leaq	.LC26(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$42, %edx
	leaq	.LC27(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$47, %edx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$92, %edx
	leaq	.LC29(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$37, %edx
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$94, %edx
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$124, %edx
	leaq	.LC32(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$40, %edx
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movl	$41, %edx
	leaq	.LC34(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	print_help, .-print_help
	.section	.rodata
.LC35:
	.string	"Enter equation: "
.LC36:
	.string	"no valid input...\r\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	print_help
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -1048(%rbp)
	movzbl	-1040(%rbp), %eax
	testb	%al, %al
	je	.L195
	movzbl	-1040(%rbp), %eax
	cmpb	$10, %al
	jne	.L196
.L195:
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$0, %edi
	call	exit@PLT
.L196:
	cmpq	$0, -1048(%rbp)
	je	.L197
	movq	-1048(%rbp), %rax
	subq	$1, %rax
	movzbl	-1040(%rbp,%rax), %eax
	cmpb	$10, %al
	jne	.L197
	movq	-1048(%rbp), %rax
	subq	$1, %rax
	movb	$0, -1040(%rbp,%rax)
.L197:
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	evaluate_expression
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L199
	call	__stack_chk_fail@PLT
.L199:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	main, .-main
	.section	.rodata
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
.LC3:
	.long	897988541
	.align 4
.LC4:
	.long	1056964608
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
