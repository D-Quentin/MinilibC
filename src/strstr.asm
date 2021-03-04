BITS 64
global strstr
section .text

strstr:
    xor rcx, rcx
    xor rax, rax
    xor r10, r10
    cmp rdi, 0
    je return_null
    cmp rsi, 0
    je return_null
    jmp my_loop

my_loop:
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi]
    cmp r8b, byte 0
    je return_null
    cmp r8b, r9b
    je set_val
    inc rcx
    jmp my_loop

set_val:
    add rax, rcx
    jmp str_cmp

reset_val:
    xor rax, rax
    xor r10, r10
    inc rcx
    jmp my_loop

str_cmp:
    mov r8b, byte [rdi + rax]
    mov r9b, byte [rsi + r10]
    cmp r9b, byte 0
    je string_found
    cmp r8b, r9b
    jne reset_val
    inc rax
    inc r10
    jmp str_cmp

string_found:
    add rdi, rcx
    mov rax, rdi
    jmp return

return_null:
    mov rax, 0
    jmp return

return:
    ret