.global gcd

# %rdi - m, %rsi - n
gcd:
    cmpq %rdi, %rsi
    cmovlq %rdi, %r9
    cmovlq %rsi, %r8
    cmovgeq %rdi, %r8
    cmovgeq %rsi, %r9
    jmp euclid

euclid:
    movq %r9, %rax
    cqto
    idivq %r8
    cmpq $0, %rdx
    je end
    movq %r8, %rdi
    movq %r9, %rsi
    subq %r8, %rsi
    jmp gcd


end:
    movq %r8, %rax
    ret
