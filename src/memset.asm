BITS 64
global memset
section .text

memset:
    mov rax, rdi ; passe parm 1 à rax
    xor rcx, rcx

my_loop: ; boucle qui incrémente rax
    cmp rcx, rdx
    je return
    mov byte [rax], sil
    inc rax
    inc rcx
    jmp my_loop

return: ; return dans rax
    mov rax, rdi
    ret