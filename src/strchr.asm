BITS 64
global strchr
section .text

strchr:
    xor rcx, rcx
    jmp my_loop

my_loop:
    mov r8b, byte [rdi + rcx]
    cmp r8b, sil
    je char_found
    inc rcx
    cmp r8b, byte 0
    je return_null
    jmp my_loop

char_found:
    add rdi, rcx
    mov rax, rdi
    jmp return

return_null:
    mov rax, 0
    jmp return

return:
    ret