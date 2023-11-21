
global EncryptVigenere

EncryptVigenere:
    ; Parameters:
    ; rdi = plaintext pointer
    ; rsi = key pointer
    ; rdx = plaintext length

    xor rcx, rcx     ; plaintext index
    xor rbx, rbx     ; key index

    mov rax, 98
    ret