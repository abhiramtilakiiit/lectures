.global multiples

# rdi - N, rsi - arr
multiples:
    movq $0, %r9            # initiliaze index
    movq $3, %r13
    movq $5, %r14
    movq $15, %r15
    jmp loop

loop:
    cmpq %rdi, %r9
    je end
    movq %r9, %r8
    incq %r8                # get i + 1 (actual value at index)
    movq %r8, %r10          # save the value to be pushed
    jmp check_3

check_3:
    movq %r8, %rax
    cqto
    idivq %r13
    cmpq $0, %rdx
    je set_3
    jmp check_5

set_3:
    movq $-1, %r10
    jmp check_5

check_5:
    movq %r8, %rax
    cqto
    idivq %r14
    cmpq $0, %rdx
    je set_5
    jmp check_15

set_5:
    movq $-2, %r10
    jmp check_15

check_15:
    movq %r8, %rax
    cqto
    idivq %r15
    cmpq $0, %rdx
    je set_15
    jmp next_iteration

set_15:
    movq $-3, %r10
    jmp next_iteration

next_iteration:
    movq %r10, (%rsi,%r9,8)
    incq %r9
    jmp loop

end:
    ret
