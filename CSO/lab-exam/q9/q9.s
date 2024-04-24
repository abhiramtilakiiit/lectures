.global first

# rdi - n, rsi - arr
first:
    movq %rdi, %r10

loop1:
    cmpq $0, %r10
    je end_sort
    movq $0, %r8
    movq $-1, %rax
    salq $63, %rax   # set max
    jmp loop2

loop2:
    cmpq %r8, %r10
    je update_next
    movq (%rsi, %r8, 8), %rbx
    cmpq %rbx, %rax
    cmovlq %rbx, %rax
    cmovlq %r8, %r9
    incq %r8
    jmp loop2

update_next:
    decq %r10
    movq (%rsi, %r10, 8), %rbx
    movq (%rsi, %r9, 8), %rcx
    movq %rcx, (%rsi, %r10, 8)
    movq %rbx, (%rsi, %r9, 8)
    jmp loop1

end_sort:
    movq $0, %r8
    movq $1, %r9
    jmp skip_neg

skip_neg:
    cmpq %r8, %rdi
    je end_bad
    movq (%rsi, %r8, 8), %r10
    cmpq $0, %r10
    jle increment_negetive

count:
    cmpq %r8, %rdi
    movq (%rsi, %r8, 8), %r10
    cmpq %r9, %r10
    jne end_good
    incq %r9
    incq %r8
    jmp count

increment_negetive:
    incq %r8
    jmp skip_neg

end_bad:
    incq %r9

end_good:
    movq %r9, %rax
    ret
