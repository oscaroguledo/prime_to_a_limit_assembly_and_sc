	.file	"vigenere.c"
	.text
	.globl	isLetterInString
	.type	isLetterInString, @function
isLetterInString:
.LFB6:
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
	jmp	.L2
.L5:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -12(%rbp)
	jne	.L3
	movl	$1, %eax
	jmp	.L4
.L3:
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	isLetterInString, .-isLetterInString
	.globl	toUpperCase
	.type	toUpperCase, @function
toUpperCase:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$96, -4(%rbp)
	jle	.L7
	cmpb	$122, -4(%rbp)
	jg	.L7
	movzbl	-4(%rbp), %eax
	subl	$32, %eax
	jmp	.L8
.L7:
	movzbl	-4(%rbp), %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	toUpperCase, .-toUpperCase
	.globl	toLowerCase
	.type	toLowerCase, @function
toLowerCase:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$64, -4(%rbp)
	jle	.L10
	cmpb	$90, -4(%rbp)
	jg	.L10
	movzbl	-4(%rbp), %eax
	addl	$32, %eax
	jmp	.L11
.L10:
	movzbl	-4(%rbp), %eax
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	toLowerCase, .-toLowerCase
	.section	.rodata
.LC0:
	.string	"abcdefghijklmnopqrstuvwxyz"
.LC1:
	.string	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
.LC2:
	.string	"Memory allocation failed."
	.text
	.globl	EncryptVigenere
	.type	EncryptVigenere, @function
EncryptVigenere:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -48(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -44(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	-48(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L13
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L14
.L13:
	movl	$0, -56(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L15
.L20:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -52(%rbp)
	jne	.L16
	movl	$0, -52(%rbp)
.L16:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	isLetterInString
	testl	%eax, %eax
	je	.L17
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -57(%rbp)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$97, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -32(%rbp)
	movl	-32(%rbp), %edx
	imull	$26, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -32(%rbp)
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	toLowerCase
	movsbl	%al, %eax
	subl	$97, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %edx
	imull	$26, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$26, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	leal	97(%rax), %ecx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L18
.L17:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	isLetterInString
	testl	%eax, %eax
	je	.L19
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -58(%rbp)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$65, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -40(%rbp)
	movl	-40(%rbp), %edx
	imull	$26, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -40(%rbp)
	movsbl	-58(%rbp), %eax
	movl	%eax, %edi
	call	toUpperCase
	movsbl	%al, %eax
	subl	$65, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -36(%rbp)
	movl	-36(%rbp), %edx
	imull	$26, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -36(%rbp)
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$26, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	leal	65(%rax), %ecx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L18
.L19:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
.L18:
	addl	$1, -56(%rbp)
	addl	$1, -52(%rbp)
.L15:
	movl	-48(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -56(%rbp)
	jl	.L20
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	EncryptVigenere, .-EncryptVigenere
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
