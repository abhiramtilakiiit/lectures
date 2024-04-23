.global operations

# M = rdi, N = rsi, S = rdx
operations:
    cmpq $1, %rdx
    je addition
    cmpq $2, %rdx
    je subtraction
    cmpq $3, %rdx
    je division
    cmpq $4, %rdx
    movq $1, %rax
    je exponential
    cmpq $5, %rdx
    je modulus
    movq $0, %rax
    ret

addition:
    addq %rdi, %rsi
    movq %rsi, %rax
    ret

subtraction:
    subq %rsi, %rdi
    movq %rdi, %rax
    ret

division:
    movq %rdi, %rax
    cqto
    idivq %rsi
    ret

exponential:
    cmpq $0, %rsi
    je end
    imulq %rdi, %rax
    decq %rsi
    jmp exponential

modulus:
    movq %rdi, %rax
    cqto
    idivq %rsi
    movq %rdx, %rax
    ret

end:
    ret
