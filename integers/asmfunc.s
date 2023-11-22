global getarray

getarray:
    xor rdx, rdx        ; Clear RDX (set it to zero) before performing division
    mov rcx, rsi        ; Move starting range value to RCX

getarray_loop:
    cmp rcx, rdi        ; Compare current value in RCX with the ending range
    jg is_invalid       ; If current value > ending range, return 0
    
    mov rax, rcx        ; Copy current value in RCX to RAX for manipulation
    cmp rax, rdi        ; Check if the counter in RCX stored in RAX <= the ending range
    jle is_prime        ; Continue if the current value is within the range
    call is_invalid     ; Return 0 if the current value > ending range

is_prime:
    cmp rax, 3           ; Compare the value in RAX with 3
    jle is_valid       ; If RAX <= 3, it's a valid number

    ; Check if the number is a multiple of 2
    mov r8, 2
    div r8              ; Divide the content of RAX by 2
    cmp rdx, 0          ; Compare the remainder (in RDX) after division by 2 with 0
    je is_invalid       ; Return 0 if it's a multiple of 2

    ; Check if the number is a multiple of 3
    mov rax, rcx        ; Restore RAX to the current value in RCX 
    xor rdx, rdx        ; Clear RDX before division
    mov r8, 3
    div r8              ; Divide the content of RAX by 3
    cmp rdx, 0          ; Compare the remainder (in RDX) after division by 3 with 0
    je is_invalid       ; Return 0 if it's a multiple of 3

    ; Check other potential divisors
    mov rax, rcx        ; Restore RAX to the current value in RCX 
    xor rdx, rdx        ; Clear RDX before division
    mov r9, 5           ; Set R9 as prime_loop counter
    call prime_loop

prime_loop:
    mov rax, r9
    imul rax, r9        ; Square the value in R9
    cmp rax, rcx        ; Compare squared value with the current value in RCX
    jg is_valid         ; If squared value > current value, it's a valid prime number

    mov rax, rcx        ; Restore RAX to the current value in RCX
    div r9              ; Divide the content of RAX by R9
    cmp rdx, 0          ; Compare the remainder (in RDX) after division by R9 with 0
    je is_invalid       ; Return 0 if it's a multiple of R9

    mov rax, rcx        ; Restore RAX to the current value in RCX
    xor rdx, rdx        ; Clear RDX before division
    add r9, 2           ; Increment R9 by 2
    div r9
    cmp rdx, 0
    je is_invalid       ; Return 0 if it's a multiple of R9

    sub r9, 2
    add r9, 6
    jmp prime_loop

is_invalid:
    mov rax, 0          ; Return 0 (invalid)
    ret

is_valid:
    mov rax, rcx        ; Return the current value in RCX (valid prime number)
    ret
