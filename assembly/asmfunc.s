; assembler function

global EncryptVigenere

EncryptVigenere:
        mov eax, 98
        mov ebx, edi; first param
        mov ecx, esi; second param
        mov eax, ebx
        ret 

