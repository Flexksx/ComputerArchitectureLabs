section .rodata
    prompt db "Enter number: ", 0
    num_format db "%d", 10, 0
    out_format db "Result: %d", 10, 0
    input_format db "%d", 0
    errmsg db "Invalid input", 10, 0

section .bss
    number resb 4

section .text
global _start

_start:
    ; Display prompt
    mov rax, 1              ; syscall: sys_write
    mov rdi, 1              ; fd: stdout
    mov rsi, prompt         ; buffer: address of prompt
    mov rdx, 13             ; count: length of prompt
    syscall

    ; Read integer input
    mov rax, 0              ; syscall: sys_read
    mov rdi, 0              ; fd: stdin
    mov rsi, number         ; buffer: address to store number
    mov rdx, 4              ; count: size of buffer (4 bytes)
    syscall

    ; Display output (simulating a simple echo for demo)
    mov rax, 1              ; syscall: sys_write
    mov rdi, 1              ; fd: stdout
    mov rsi, number         ; buffer: address of number
    mov rdx, 4              ; count: length of number
    syscall

    ; Exit the program
    mov rax, 60             ; syscall: sys_exit
    xor rdi, rdi            ; status: 0
    syscall

section .rodata
    LC0 db "0. Generate 10 random numbers between 1 and 55", 0
    LC1 db "1. Add two numbers", 0
    LC2 db "2. Subtract two numbers", 0
    LC3 db "3. Square root of a number", 0
    LC4 db "4. Generate random number", 0
    LC5 db "5. Convert from base 10 to base 16", 0
    LC6 db "6. Converting a string to uppercase", 0
    LC7 db "7. Find character in a string", 0
    LC8 db "8. Concatenate two strings", 0
    LC9 db "9. Compare two strings", 0
    LC10 db "q. Exit the program", 0
    LC11 db "%d ", 0
    LC12 db "Enter the first number: ", 0
    LC13 db "%d", 0
    LC14 db "Enter the second number: ", 0
    LC15 db "Sum: %d\n", 0
    LC16 db "Difference: %d\n", 0
    LC17 db "Enter a number: ", 0
    LC22 db "Square root: %f\n", 0

section .text
global help
help:
    push rbp
    mov rbp, rsp
    ; Display all help strings
    mov rdi, LC0
    call puts
    mov rdi, LC1
    call puts
    mov rdi, LC2
    call puts
    mov rdi, LC3
    call puts
    mov rdi, LC4
    call puts
    mov rdi, LC5
    call puts
    mov rdi, LC6
    call puts
    mov rdi, LC7
    call puts
    mov rdi, LC8
    call puts
    mov rdi, LC9
    call puts
    mov rdi, LC10
    call puts
    pop rbp
    ret

global generate_rand
generate_rand:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov edi, 0
    call time
    mov edi, eax
    call srand
    xor edi, edi
.L3:
    call rand
    lea rdi, [LC11]
    mov esi, eax
    call printf
    inc edi
    cmp edi, 10
    jl .L3
    call putchar
    leave
    ret

global add_two_numbers
add_two_numbers:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rdi, LC12
    call printf
    lea rsi, [rbp-16]
    mov rdi, LC13
    call scanf
    mov rdi, LC14
    call printf
    lea rsi, [rbp-12]
    mov rdi, LC13
    call scanf
    mov edx, [rbp-16]
    mov eax, [rbp-12]
    add eax, edx
    mov esi, eax
    mov rdi, LC15
    call printf
    leave
    ret

global sub_two_numbers
sub_two_numbers:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rdi, LC12
    call printf
    lea rsi, [rbp-16]
    mov rdi, LC13
    call scanf
    mov rdi, LC14
    call printf
    lea rsi, [rbp-12]
    mov rdi, LC13
    call scanf
    mov eax, [rbp-16]
    mov edx, [rbp-12]
    sub eax, edx
    mov esi, eax
    mov rdi, LC16
    call printf
    leave
    ret

global sqrt_of_number
sqrt_of_number:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov rdi, LC17
    call printf
    lea rsi, [rbp-24]
    mov rdi, LC13
    call scanf
    mov eax, [rbp-24]
    cvtsi2sd xmm0, eax
    sqrtsd xmm0, xmm0
    movsd xmm1, xmm0
    mov rdi, LC22
    mov rsi, xmm1
    call printf
    leave
    ret


section .rodata
    LC23 db "Enter a number in base 10: ", 0
    LC24 db "Hexadecimal: 0", 0
    LC25 db "Hexadecimal: ", 0
    LC26 db "Enter a string: ", 0
    LC27 db "%s", 0
    LC28 db "Uppercase: %s", 0
    LC29 db "Enter a character to find: ", 0
    LC30 db " %c", 0
    LC31 db "Character found at index %d", 0
    LC32 db "Character not found", 0
    LC33 db "Enter the first string: ", 0
    LC34 db "Enter the second string: ", 0
    LC35 db "Concatenated string: %s", 0

section .text
    global decimal_to_hexadecimal
    extern printf, scanf, putchar, puts, __stack_chk_fail

decimal_to_hexadecimal:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    xor eax, eax
    lea rdi, [LC23]
    call printf
    lea rsi, [rbp - 76]
    lea rdi, [LC13]
    call scanf
    mov eax, dword [rbp - 76]
    test eax, eax
    jne .L17
    lea rdi, [LC24]
    call puts
    jmp .L16
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

.L17:
    mov rax, 3978425819141910832
    mov rdx, 5063528411713059128
    mov qword [rbp - 64], rax
    mov qword [rbp - 56], rdx
    mov dword [rbp - 72], 0
    jmp .L19
.L20:
    mov edx, dword [rbp - 76]
    mov eax, edx
    sar eax, 31
    shr eax, 28
    add edx, eax
    and edx, 15
    sub edx, eax
    mov eax, edx
    cltq
    movzx edx, byte [rbp - 64 + rax]
    mov eax, dword [rbp - 72]
    cltq
    mov byte [rbp - 48 + rax], dl
    mov eax, dword [rbp - 76]
    lea edx, [rax + 15]
    test eax, eax
    cmovs eax, edx
    sar eax, 4
    mov dword [rbp - 76], eax
    add dword [rbp - 72], 1
.L19:
    mov eax, dword [rbp - 76]
    test eax, eax
    jg .L20
    lea rdi, [LC25]
    call printf
    mov eax, dword [rbp - 72]
    sub eax, 1
    mov dword [rbp - 68], eax
    jmp .L21
.L22:
    mov eax, dword [rbp - 68]
    cltq
    movzx eax, byte [rbp - 48 + rax]
    movsx edi, al
    call putchar
    sub dword [rbp - 68], 1
.L21:
    cmp dword [rbp - 68], 0
    jns .L22
    mov edi, 10
    call putchar
.L16:
    mov rax, qword [rbp - 8]
    sub rax, qword [fs:40]
    je .L23
    call __stack_chk_fail
.L23:
    leave
    ret

convert_to_uppercase:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    xor eax, eax
    lea rdi, [LC26]
    call printf
    lea rsi, [rbp - 64]
    lea rdi, [LC27]
    call scanf
    mov dword [rbp - 68], 0
    jmp .L25
.L27:
    mov eax, dword [rbp - 68]
    cltq
    movzx eax, byte [rbp - 64 + rax]
    cmp al, 96
    jle .L26
    mov eax, dword [rbp - 68]
    cltq
    movzx eax, byte [rbp - 64 + rax]
    cmp al, 122
    jg .L26
    mov eax, dword [rbp - 68]
    cltq
    movzx eax, byte [rbp - 64 + rax]
    sub al, 32
    mov edx, eax
    mov eax, dword [rbp - 68]
    cltq
    mov byte [rbp - 64 + rax], dl
.L26:
    add dword [rbp - 68], 1
.L25:
    mov eax, dword [rbp - 68]
    test eax, eax
    jne .L27
    lea rdi, [LC28]
    mov rsi, qword [rbp - 64]
    call printf
    nop
    mov rax, qword [rbp - 8]
    sub rax, qword [fs:40]
    je .L28
    call __stack_chk_fail
.L28:
    leave
    ret