.global krishnamurthy

# rdi - n
krishnamurthy:
    movq %rdi, %rax
    movq $0, %rbx
    movq $10, %r10
    jmp get_digit

get_digit:
    cmpq $0, %rax
    je compare
    cqto
    idivq %r10
    movq $1, %r8
    movq $1, %rcx      # rcx - product
    jmp find_factorial

find_factorial:
    cmpq %r8, %rdx
    jl end_factorial
    imulq %r8, %rcx
    incq %r8
    jmp find_factorial

end_factorial:
    addq %rcx, %rbx
    jmp get_digit

compare:
    cmpq %rbx, %rdi
    je good
    jmp bad

good:
    movq $1, %rax
    ret

bad:
    movq $0, %rax
    ret
