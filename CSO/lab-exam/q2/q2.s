.global check_odd

# rdi - N
check_odd:
    movq $2, %r8
    movq $0, %r9
    movq %rdi ,%rax
    jmp loop

loop:
    cmpq $0, %rax
    je end
    cqto
    idivq %r8
    xorq %rdx, %r9
    jmp loop

end:
    movq %r9, %rax
    ret
