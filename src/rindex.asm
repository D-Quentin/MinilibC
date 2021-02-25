BITS 64
global rindex
section .text

rindex:
    xor rcx, rcx
    xor rax, rax
    xor r9b, r9b
    jmp my_loop

my_loop:
    mov r8b, byte [rdi + rcx]
    cmp r8b, sil
    je save_pos
continue:
    inc rcx
    cmp r8b, byte 0
    je check_return
    jmp my_loop

save_pos:
    mov rax, rcx
    mov r9b, byte 1
    jmp continue

check_return:
    cmp r9b, byte 0
    je return_null
    add rdi, rax
    mov rax, rdi
    jmp return

return_null:
    mov rax, 0
    jmp return

return:
    ret