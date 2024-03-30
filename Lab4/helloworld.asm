section .data          ; Data section
    hello db 'Hello, World!', 10  ; Define a string variable 'hello' with the message
    hello_len equ $ - hello       ; Calculate the length of the string

section .text          ; Code section
    global _start       ; Entry point for the program

_start:                ; Start of the code
    ; Write the message to stdout
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, hello      ; Address of the message
    mov edx, hello_len  ; Length of the message
    int 0x80            ; Call kernel

    ; Exit the program
    mov eax, 1          ; System call number for sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call kernel
