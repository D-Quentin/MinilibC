BITS 64
global strlen
section .text

setrcx:
    xor rcx, rcx ; set rcx à 0
    jmp return

strlen:
    lea rcx, [rdi] ; passe parm 1 à rcx

; Check si string vide
    cmp [rcx], byte 0 
    jz setrcx

my_loop: ; boucle qui incrémente rcx
    inc rcx
    cmp [rcx], byte 0
    jnz my_loop

    sub rcx, rdi

return: ; return dans rax
    mov rax, rcx
    ret



; param 1 to rax
; mov rbp,rsi ; param 2 to rbp
; mov rbx,rdx ; param 3 to rbx