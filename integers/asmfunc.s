section .data
    primes: times 10 db 0   ; Array to store prime factors (assuming a maximum of 10 factors)

global get_array

get_array:
    mov rdi, 10        ; Number for which prime factors are to be found
    mov rbx, 2         ; Start checking factors from 2

    xor rcx, rcx       ; Counter for the prime factors array
    mov rsi, primes    ; Address of the primes array

find_factors:
    cmp rdi, 1         ; Check if number becomes 1 (no more factors)
    je end_loop

    mov rax, rdi       ; Copy the number to rax
    xor rdx, rdx       ; Clear rdx
    div rbx            ; Divide rax by rbx

    cmp rdx, 0         ; Check if remainder is 0
    jne not_factor

    ; Found a prime factor, store it in the array
    mov [rsi + rcx], bl  ; Store the factor in the array
    inc rcx             ; Increment the array index

    mov rdi, rax        ; Update the number with the quotient
    jmp find_factors    ; Continue finding factors

not_factor:
    inc rbx             ; Check the next number as a factor
    jmp find_factors    ; Continue the loop

end_loop:
    ; Code to do something with the prime factors array
    ; At this point, the prime factors of 10 are stored in the 'primes' array
