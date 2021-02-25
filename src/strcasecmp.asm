BITS 64
global strcasecmp
section .text

strcasecmp:
    xor rcx, rcx
    jmp my_loop

my_loop:
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    inc rcx
    jmp check_caps_r8_1

check_caps_r8_1:
    cmp r8b, byte 64
    jg check_caps_r8_2
    jmp check_caps_r9_1

check_caps_r8_2:
    cmp r8b, byte 91
    jl lower_caps_r8
    jmp check_caps_r9_1

lower_caps_r8:
    add r8b, 32
    jmp check_caps_r9_1

check_caps_r9_1:
    cmp r9b, byte 64
    jg check_caps_r9_2
    jmp string_equal

check_caps_r9_2:
    cmp r9b, byte 91
    jl lower_caps_r9
    jmp string_equal

lower_caps_r9:
    add r9b, 32
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

return:
    ret