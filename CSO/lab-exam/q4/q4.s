.global palindrome

# rdi - N
palindrome:
    movq $10, %r10        # store 10
    movq %rsp, %r15
    movq $0, %r8        # index
    movq %rdi, %rax
    jmp cal_length

cal_length:
    cqto
    idivq %r10
    cmpq $0, %rax       # if quotient is 0
    je finalize_length
    incq %r8
    jmp cal_length

finalize_length:
    incq %r8
    movq %r8, %r13      # store the length
    cmpq $0, %r13
    je good
    cmpq $1, %r13
    je good
    movq %r8, %r11      # store the length again
    andq $1, %r13
    cmovzq %r13, %r12     # store if length is odd
    jmp lol
    movq $0, %r8
    salq %r13           # get middle index
    movq %rdi, %rax     # restore back number
    jmp loop

lol:
    movq %r12, %rax
    ret

loop:
    cmpq %r8, %r13      # keep pushing values until half
    je end_loop
    cqto
    idivq %r10
    pushq %rdx          # push the remainder
    incq %r8
    jmp loop

end_loop:
    cmpq $1, %r12
    je pop_extra
    jmp popper

pop_extra:
    incq %r8
    jmp popper

popper:
    cmpq %r8, %r11
    je good
    popq %r12
    cqto
    idivq %r10
    cmpq %rdx,%r12      # push the remainder
    jne bad
    incq %r8
    jmp loop

good:
    movq $1, %rax
    ret

bad:
    movq $0, %rax
    movq %r15, %rsp
    ret
