BITS 64
global strcspn
section .text

strcspn:
    xor rcx, rcx
    xor rax, rax
    jmp my_loop

my_loop:
    mov r8b, byte [rdi + rcx]
    cmp r8b, byte 0
    je return_null
    jmp char_cmp

reset_val:
    xor rax, rax
    inc rcx
    jmp my_loop

char_cmp:
    mov r9b, byte [rsi + rax]
    cmp r9b, byte 0
    je reset_val
    cmp r8b, r9b
    je char_found
    inc rax
    jmp char_cmp

char_found:
    add rdi, rcx
    mov rax, rcx
    jmp return

return_null:
    mov rax, rcx
    jmp return

return:
    ret