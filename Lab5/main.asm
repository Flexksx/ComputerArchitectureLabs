	.section	.rodata
	.align 8
.LC0:
	.string	"0. Generate 10 random numbers between 1 and 55"
.LC1:
	.string	"1. Add two numbers"
.LC2:
	.string	"2. Subtract two numbers"
.LC3:
	.string	"3. Square root of a number"
.LC4:
	.string	"4. Generate random number"
	.align 8
.LC5:
	.string	"5. Convert from base 10 to base 16"
	.align 8
.LC6:
	.string	"6. Converting a string to uppercase"
.LC7:
	.string	"7. Find character in a string"
.LC8:
	.string	"8. Concatenate two strings"
.LC9:
	.string	"9. Compare two strings"
.LC10:
	.string	"q. Exit the program"
	.text
	.globl	help
	.type	help, @function
help:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	help, .-help
	.section	.rodata
.LC11:
	.string	"%d "
	.text
	.globl	generate_rand
	.type	generate_rand, @function
generate_rand:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$-1840700269, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %edx
	imull	$56, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L4
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	generate_rand, .-generate_rand
	.section	.rodata
.LC12:
	.string	"Enter the first number: "
.LC13:
	.string	"%d"
.LC14:
	.string	"Enter the second number: "
.LC15:
	.string	"Sum: %d\n"
	.text
	.globl	add_two_numbers
	.type	add_two_numbers, @function
add_two_numbers:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	add_two_numbers, .-add_two_numbers
	.section	.rodata
.LC16:
	.string	"Difference: %d\n"
	.text
	.globl	sub_two_numbers
	.type	sub_two_numbers, @function
sub_two_numbers:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	sub_two_numbers, .-sub_two_numbers
	.section	.rodata
.LC17:
	.string	"Enter a number: "
.LC22:
	.string	"Square root: %f\n"
	.text
	.globl	sqrt_of_number
	.type	sqrt_of_number, @function
sqrt_of_number:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC18(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	.LC19(%rip), %xmm0
	movss	%xmm0, -16(%rbp)
.L13:
	movl	-24(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	divss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	addss	-20(%rbp), %xmm1
	movss	.LC20(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm0
	subss	-20(%rbp), %xmm0
	movss	.LC21(%rip), %xmm1
	andps	%xmm0, %xmm1
	movss	-16(%rbp), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L15
	movss	-12(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	jmp	.L13
.L15:
	nop
	pxor	%xmm2, %xmm2
	cvtss2sd	-20(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sqrt_of_number, .-sqrt_of_number
	.section	.rodata
.LC23:
	.string	"Enter a number in base 10: "
.LC24:
	.string	"Hexadecimal: 0"
.LC25:
	.string	"Hexadecimal: "
	.text
	.globl	decimal_to_hexadecimal
	.type	decimal_to_hexadecimal, @function
decimal_to_hexadecimal:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-76(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-76(%rbp), %eax
	testl	%eax, %eax
	jne	.L17
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L16
.L17:
	movabsq	$3978425819141910832, %rax
	movabsq	$5063528411713059128, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L19
.L20:
	movl	-76(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%eax, %edx
	andl	$15, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	movzbl	-64(%rbp,%rax), %edx
	movl	-72(%rbp), %eax
	cltq
	movb	%dl, -48(%rbp,%rax)
	movl	-76(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	movl	%eax, -76(%rbp)
	addl	$1, -72(%rbp)
.L19:
	movl	-76(%rbp), %eax
	testl	%eax, %eax
	jg	.L20
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-72(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.L21
.L22:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	subl	$1, -68(%rbp)
.L21:
	cmpl	$0, -68(%rbp)
	jns	.L22
	movl	$10, %edi
	call	putchar@PLT
.L16:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	decimal_to_hexadecimal, .-decimal_to_hexadecimal
	.section	.rodata
.LC26:
	.string	"Enter a string: "
.LC27:
	.string	"%s"
.LC28:
	.string	"Uppercase: %s\n"
	.text
	.globl	convert_to_uppercase
	.type	convert_to_uppercase, @function
convert_to_uppercase:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -68(%rbp)
	jmp	.L25
.L27:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	cmpb	$96, %al
	jle	.L26
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	cmpb	$122, %al
	jg	.L26
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	subl	$32, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	cltq
	movb	%dl, -64(%rbp,%rax)
.L26:
	addl	$1, -68(%rbp)
.L25:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L27
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	convert_to_uppercase, .-convert_to_uppercase
	.section	.rodata
.LC29:
	.string	"Enter a character to find: "
.LC30:
	.string	" %c"
.LC31:
	.string	"Character found at index %d\n"
.LC32:
	.string	"Character not found"
	.text
	.globl	find_character_in_string
	.type	find_character_in_string, @function
find_character_in_string:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-69(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -68(%rbp)
	jmp	.L30
.L33:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %edx
	movzbl	-69(%rbp), %eax
	cmpb	%al, %dl
	jne	.L31
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L29
.L31:
	addl	$1, -68(%rbp)
.L30:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L33
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L29:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	find_character_in_string, .-find_character_in_string
	.section	.rodata
.LC33:
	.string	"Enter the first string: "
.LC34:
	.string	"Enter the second string: "
.LC35:
	.string	"Concatenated string: %s\n"
	.text
	.globl	concatenate_strings
	.type	concatenate_strings, @function
concatenate_strings:
.LFB14:section .rodata
    LC12 db "Enter the first number: ", 0
    LC13 db "%d", 0
    LC15 db "Sum: %d\n", 0

section .text
global add_two_numbers
add_two_numbers:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rax, [fs:40]
    mov [rbp-8], rax
    xor eax, eax
    mov rdi, LC12
    xor eax, eax
    call printf
    lea rax, [rbp-16]
    mov rsi, rax
    mov rdi, LC13
    xor eax, eax
    call __isoc99_scanf
    ; Continue for the rest of the function...

	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-240(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-176(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	concatenate_strings, .-concatenate_strings
	.section	.rodata
.LC36:
	.string	"%s > %s"
.LC37:
	.string	"%s < %s"
.LC38:
	.string	"Strings are equal"
	.text
	.globl	compare_strings
	.type	compare_strings, @function
compare_strings:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-64(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	movl	%eax, -132(%rbp)
	cmpl	$0, -132(%rbp)
	jle	.L38
	leaq	-64(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L42
.L38:
	cmpl	$0, -132(%rbp)
	jns	.L40
	leaq	-64(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L42
.L40:
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L42:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	compare_strings, .-compare_strings
	.section	.rodata
.LC39:
	.string	"\nSelect command: "
.LC40:
	.string	"Exiting the program."
	.text
	.globl	main
	.type	main, @function
main:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	help
.L59:
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-9(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$65, %eax
	ja	.L62
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L46(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L46(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L46:
	.long	.L56-.L46
	.long	.L55-.L46
	.long	.L54-.L46
	.long	.L53-.L46
	.long	.L52-.L46
	.long	.L51-.L46
	.long	.L50-.L46
	.long	.L49-.L46
	.long	.L48-.L46
	.long	.L47-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L62-.L46
	.long	.L45-.L46
	.text
.L56:
	movl	$10, %edi
	call	generate_rand
	movl	$0, %eax
	call	help
	jmp	.L57
.L55:
	movl	$0, %eax
	call	add_two_numbers
	movl	$0, %eax
	call	help
	jmp	.L57
.L54:
	movl	$0, %eax
	call	sub_two_numbers
	movl	$0, %eax
	call	help
	jmp	.L57
.L53:
	movl	$0, %eax
	call	sqrt_of_number
	movl	$0, %eax
	call	help
	jmp	.L57
.L52:
	movl	$1, %edi
	call	generate_rand
	movl	$0, %eax
	call	help
	jmp	.L57
.L51:
	movl	$1, %edi
	movl	$0, %eax
	call	decimal_to_hexadecimal
	movl	$0, %eax
	call	help
	jmp	.L57
.L50:
	movl	$0, %eax
	call	convert_to_uppercase
	movl	$0, %eax
	call	help
	jmp	.L57
.L49:
	movl	$0, %eax
	call	find_character_in_string
	movl	$0, %eax
	call	help
	jmp	.L57
.L48:
	movl	$0, %eax
	call	concatenate_strings
	movl	$0, %eax
	call	help
	jmp	.L57
.L47:
	movl	$0, %eax
	call	compare_strings
	movl	$0, %eax
	call	help
	jmp	.L57
.L45:
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L60
	jmp	.L61
.L62:
	nop
.L57:
	jmp	.L59
.L61:
	call	__stack_chk_fail@PLT
.L60:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC18:
	.long	0
	.long	1073741824
	.align 4
.LC19:
	.long	925353388
	.align 4
.LC20:
	.long	1056964608
	.align 16
.LC21:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (GNU) 14.1.1 20240507"
	.section	.note.GNU-stack,"",@progbits
