.global rearrange

# rdi - N, rsi - arr
rearrange:
    movq $0, %r8     # index
    movq $0, %r10    # store number of zeros
    movq $0, %r11    # store number of ones
    jmp loop

loop:
    cmpq %r8, %rdi
    je end_loop
    movq (%rsi, %r8, 8), %r12
    cmpq $0, %r12
    je incr_zero
    cmpq $1, %r12
    je incr_ones
    ret

incr_zero:
    incq %r10
    incq %r8
    jmp loop

incr_ones:
    incq %r11
    incq %r8
    jmp loop

end_loop:
    movq $0, %r8    # print zeros at start
    jmp print_zeros

print_zeros:
    cmpq %r8, %r10
    je print_ones
    movq $0, (%rsi, %r8, 8)
    incq %r8
    jmp print_zeros

print_ones:
    cmpq %r8, %rdi
    je end
    movq $1, (%rsi, %r8, 8)
    incq %r8
    jmp print_ones

end:
    ret
