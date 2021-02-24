BITS 64
global memcpy
section .text

memcpy:
    mov rax, rdi ; passe parm 1 à rax
    xor rcx, rcx

my_loop: ; boucle qui incrémente rax
    cmp rcx, rdx
    je return
    mov r8b, byte [rsi]
    mov byte [rax], r8b
    inc rsi
    inc rax
    inc rcx
    jmp my_loop

return: ; return dans rax
    mov rax, rdi
    ret