BITS 64
global memcpy
section .text

memcpy:
    xor rcx, rcx

my_loop:
    cmp rcx, rdx
    je return
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp my_loop

return:
    mov rax, rdi
    ret