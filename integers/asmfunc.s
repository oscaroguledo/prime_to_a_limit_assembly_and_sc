global getarray

getarray:
    xor rdx, rdx  ; Clear RDX (set it to zero) before performing division
    mov rcx, rsi
    mov r8,2
getarray_loop:
    cmp rcx, rdi
    jle continue_get_array_loop; if the counter reaches the number end the function

    inc rcx
    jmp getarray_loop

continue_get_array_loop:
    mov rax, rcx ; let rax = rcx

    cmp rax, rdi ; if the counter in rcx stored in rax <= the number--->> continue
    jle continue

    mov rax, 0  ;else let rax be 0 then return rax
    ret

continue:
    cmp rax, 3          ; Compare the value in RAX with 3
    jle less_than_3     ; Jump to less_than_3 if RAX is less than or equal to 3


    idiv rax, 2   ; Divide the content of RAX by 2
    cmp rdx, 0          ; Compare the remainder (in RDX) after division by 2 with 0
    jne not_mul_of_two  ; Jump to not_mul_of_two if the remainder is not equal to 0


less_than_3:
    ret

not_mul_of_two:
    mov rax, rcx
    ret




