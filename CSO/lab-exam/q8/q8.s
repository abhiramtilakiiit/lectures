.global wave

# rdi - n, rsi - arr
wave:
    movq %rdi, %r15
    decq %r15
    movq $0, %r8
    jmp set_max

set_max:
    movq $-1, %rax
    salq $62, %rax
    jmp find_max

find_max:
    cmpq %r8, %rdi
    je decrement
    movq (%rsi, %r8, 8), %rbx
    cmpq %rbx, %rax
    cmovlq %rbx, %rax
    cmovlq %r8, %r9
    incq %r8
    jmp find_max

decrement:
    decq %rdi
    movq (%rsi,%r9,8), %rbx
    movq (%rsi, %rdi, 8), %rcx
    movq %rbx, (%rsi, %rdi, 8)
    movq %rcx, (%rsi,%r9,8)
    cmpq $0, %rdi
    movq $0, %r8
    je replace_two
    jmp set_max

replace_two:
    cmpq %r8, %r15
    jle end
    movq (%rsi,%r8,8), %rbx
    movq 8(%rsi,%r8,8), %rcx
    movq %rbx, 8(%rsi,%r8,8)
    movq %rcx, (%rsi,%r8,8)
    incq %r8
    incq %r8
    jmp replace_two

end:
    ret
