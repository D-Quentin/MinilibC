BITS 64
global memmove
section .text

memmove:
    xor rcx, rcx
    jmp copy

copy:
    cmp rcx, rdx
    je reset_rcx
    mov r8b, byte [rsi + rcx]
    mov byte [rax + rcx], r8b
    inc rcx
    jmp copy

reset_rcx:
    xor rcx, rcx
    jmp paste

paste:
    cmp rcx, rdx
    je return
    mov r8b, byte [rax + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp paste

return:
    mov rax, rdi
    ret