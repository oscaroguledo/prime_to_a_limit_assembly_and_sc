isLetterInString:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     eax, esi
        mov     BYTE PTR [rbp-12], al
        jmp     .L2
.L5:
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        cmp     BYTE PTR [rbp-12], al
        jne     .L3
        mov     eax, 1
        jmp     .L4
.L3:
        add     QWORD PTR [rbp-8], 1
.L2:
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L5
        mov     eax, 0
.L4:
        pop     rbp
        ret
toUpperCase:
        push    rbp
        mov     rbp, rsp
        mov     eax, edi
        mov     BYTE PTR [rbp-4], al
        cmp     BYTE PTR [rbp-4], 96
        jle     .L7
        cmp     BYTE PTR [rbp-4], 122
        jg      .L7
        movzx   eax, BYTE PTR [rbp-4]
        sub     eax, 32
        jmp     .L8
.L7:
        movzx   eax, BYTE PTR [rbp-4]
.L8:
        pop     rbp
        ret
toLowerCase:
        push    rbp
        mov     rbp, rsp
        mov     eax, edi
        mov     BYTE PTR [rbp-4], al
        cmp     BYTE PTR [rbp-4], 64
        jle     .L10
        cmp     BYTE PTR [rbp-4], 90
        jg      .L10
        movzx   eax, BYTE PTR [rbp-4]
        add     eax, 32
        jmp     .L11
.L10:
        movzx   eax, BYTE PTR [rbp-4]
.L11:
        pop     rbp
        ret
.LC0:
        .string "abcdefghijklmnopqrstuvwxyz"
.LC1:
        .string "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
.LC2:
        .string "Memory allocation failed."


EncryptVigenere:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-12], eax
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-16], eax
        mov     QWORD PTR [rbp-24], OFFSET FLAT:.LC0
        mov     QWORD PTR [rbp-32], OFFSET FLAT:.LC1
        mov     eax, DWORD PTR [rbp-12]
        add     eax, 1
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L13
        mov     edi, OFFSET FLAT:.LC2
        call    puts
        mov     eax, 0
        jmp     .L14
.L13:
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        jmp     .L15
.L20:
        mov     eax, DWORD PTR [rbp-16]
        sub     eax, 1
        cmp     DWORD PTR [rbp-8], eax
        jne     .L16
        mov     DWORD PTR [rbp-8], 0
.L16:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, edx
        mov     rdi, rax
        call    isLetterInString
        test    eax, eax
        je      .L17
        mov     eax, DWORD PTR [rbp-8]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-80]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-53], al
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        sub     eax, 97
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     DWORD PTR [rbp-60], edx
        mov     edx, DWORD PTR [rbp-60]
        imul    edx, edx, 26
        sub     eax, edx
        mov     DWORD PTR [rbp-60], eax
        movsx   eax, BYTE PTR [rbp-53]
        mov     edi, eax
        call    toLowerCase
        movsx   eax, al
        sub     eax, 97
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     DWORD PTR [rbp-64], edx
        mov     edx, DWORD PTR [rbp-64]
        imul    edx, edx, 26
        sub     eax, edx
        mov     DWORD PTR [rbp-64], eax
        mov     edx, DWORD PTR [rbp-60]
        mov     eax, DWORD PTR [rbp-64]
        add     eax, edx
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 26
        sub     eax, ecx
        mov     edx, eax
        mov     eax, edx
        lea     ecx, [rax+97]
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, ecx
        mov     BYTE PTR [rax], dl
        jmp     .L18
.L17:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, edx
        mov     rdi, rax
        call    isLetterInString
        test    eax, eax
        je      .L19
        mov     eax, DWORD PTR [rbp-8]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-80]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-41], al
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        sub     eax, 65
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     DWORD PTR [rbp-48], edx
        mov     edx, DWORD PTR [rbp-48]
        imul    edx, edx, 26
        sub     eax, edx
        mov     DWORD PTR [rbp-48], eax
        movsx   eax, BYTE PTR [rbp-41]
        mov     edi, eax
        call    toUpperCase
        movsx   eax, al
        sub     eax, 65
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     DWORD PTR [rbp-52], edx
        mov     edx, DWORD PTR [rbp-52]
        imul    edx, edx, 26
        sub     eax, edx
        mov     DWORD PTR [rbp-52], eax
        mov     edx, DWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rbp-52]
        add     eax, edx
        movsx   rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 26
        sub     eax, ecx
        mov     edx, eax
        mov     eax, edx
        lea     ecx, [rax+65]
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, ecx
        mov     BYTE PTR [rax], dl
        jmp     .L18
.L19:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-4]
        movsx   rcx, edx
        mov     rdx, QWORD PTR [rbp-40]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
.L18:
        add     DWORD PTR [rbp-4], 1
        add     DWORD PTR [rbp-8], 1
.L15:
        mov     eax, DWORD PTR [rbp-12]
        sub     eax, 1
        cmp     DWORD PTR [rbp-4], eax
        jl      .L20
        mov     eax, DWORD PTR [rbp-12]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-40]
.L14:
        leave
        ret
