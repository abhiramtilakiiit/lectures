.global oddsort

# rdi - n, rsi - arr
oddsort:
    movq $0, %r8
    movq $0, %r15     # has odd
    movq $0, %r14     # has even
    movq $1, %rdx     # store 1
    jmp check

check:
    cmpq %r8, %rdi
    je end_check
    movq (%rsi, %r8, 8), %r9
    andq $1, %r9
    cmpq $0, %r9     # even?
    cmoveq %rdx, %r14
    cmpq $1, %r9     # odd?
    cmoveq %rdx, %r15
    incq %r8
    jmp check

end_check:
    cmpq $0, %r14
    je end
    cmpq $0, %r15
    je end
    movq %rdi, %r10    # store end
    jmp loop1

loop1:
    cmpq $0, %r10
    je end
    movq $0, %r8
    movq $-1, %rax
    salq $63, %rax
    jmp loop2

loop2:
    cmpq %r8, %r10
    je end_loop
    movq (%rsi, %r8, 8), %r11
    cmpq %r11, %rax
    cmovlq %r11, %rax
    cmovlq %r8, %r9
    incq %r8
    jmp loop2

end_loop:
    decq %r10
    movq (%rsi, %r9, 8), %rbx
    movq (%rsi, %r10, 8), %rcx
    movq %rcx, (%rsi, %r9, 8)
    movq %rbx, (%rsi, %r10, 8)
    jmp loop1

end:
    ret
