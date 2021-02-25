BITS 64
global strncmp
section .text

strncmp:
    xor rcx, rcx
    jmp my_loop

my_loop:
    cmp rcx, rdx
    je return0
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    inc rcx
    jmp string_equal

string_equal:
    cmp r8b, byte 0
    jne char_equal
    cmp r9b, byte 0
    jne char_equal
    mov rax, 0
    jmp return

char_equal:
    cmp r8b, r9b
    je my_loop
    jmp char_no_equal

char_no_equal:
    movsx r8, r8b
    movsx r9, r9b
    sub r8, r9
    mov rax, r8
    jmp return

return0:
    mov rax, 0
    jmp return

return:
    ret