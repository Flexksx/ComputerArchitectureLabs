section .data
    numbers resd 10          ; Reserve space for 10 numbers
    count dd 0               ; Counter for the number of unique numbers
    message db 'Random numbers are:', 0xA  ; Message to print
    msgLen equ $ - message   ; Length of the message

section .text
global _start

_start:
    ; Print initial message
    mov eax, 4              ; syscall number (sys_write)
    mov ebx, 1              ; file descriptor (stdout)
    mov ecx, message        ; message to write
    mov edx, msgLen         ; message length
    int 0x80                ; call kernel

    ; Initialize random seed
    rdtsc                   ; Read time-stamp counter into edx:eax
    mov esi, eax            ; Move lower 32 bits of counter into esi for seed

generate_random:
    ; Check if we have 10 unique numbers
    mov eax, [count]
    cmp eax, 10
    je print_numbers

    ; Generate a random number from 1 to 55
    mov eax, esi            ; Move seed into eax
    mul eax                 ; Multiply eax by itself
    mov eax, edx            ; Move high 32 bits of result into eax
    and eax, 54             ; Reduce to range 0-54
    inc eax                 ; Change range to 1-55

    ; Check for uniqueness
    mov ecx, [count]
    mov ebx, 0
check_unique:
    cmp ebx, ecx
    jge store_number
    mov edx, [numbers + ebx * 4]
    cmp edx, eax
    je generate_random
    inc ebx
    jmp check_unique

store_number:
    ; Store the number
    mov [numbers + ecx * 4], eax
    inc dword [count]
    mov esi, eax            ; Update seed
    jmp generate_random

print_numbers:
    mov ecx, [count]
    mov ebx, 0
print_loop:
    cmp ebx, ecx
    je exit
    ; Print each number
    mov eax, [numbers + ebx * 4]
    push eax
    push fmt
    call printf
    add esp, 8
    inc ebx
    jmp print_loop

exit:
    ; Exit the program
    mov eax, 1              ; syscall number (sys_exit)
    xor ebx, ebx            ; status 0
    int 0x80                ; call kernel

section .bss
    fmt resb 5