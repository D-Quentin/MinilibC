BITS 64
global strchr
section .text

setrcx:
    xor rcx, rcx ; set rcx à 0
    jmp return

strchr:
    mov rcx, rdi ; passe parm 1 à rcx
    mov rbx, rsi ; passe parm 2 à rbx

; Check si string vide
    cmp [rcx], byte 0 
    jz setrcx

my_loop: ; boucle qui incrémente rcx
    cmp [rcx], bl
    je return
    inc rcx
    cmp [rcx], byte 0
    jnz my_loop

    xor rcx, rcx

return: ; return dans rax
    mov rax, rcx
    ret