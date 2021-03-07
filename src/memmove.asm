BITS 64
global memmove
section .text

memmove:
    xor rcx, rcx
    cmp rdi, 0
    je return
    cmp rsi, 0
    je return
    cmp rdx, 0
    je return
    jmp copy

copy:
    cmp rcx, rdx
    je reset_rcx
    movsx r8w, byte [rsi + rcx]
    push r8w
    inc rcx
    jmp copy

reset_rcx:
    xor rcx, rcx
    jmp paste

paste:
    cmp rcx, rdx
    je return_val
    pop r8w
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp paste

return_null:
    mov rax, 0
    jmp return

return_val:
    mov rax, rdi
    jmp return

return:
    ret