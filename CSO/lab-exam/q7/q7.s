.global maxsum

# rdi -n , rsi - b, rdx - arr
maxsum:
    movq %rsi, %r9    # left
    movq %rdi, %r10   # right
    movq $0, %r8      # index
    movq $0, %rbx

find_inisum:
    cmpq %r8, %rdi    # i < n
    je end_ini
    cmpq %r8, %rsi    # i < b
    je end_ini
    movq (%rdx,%r8,8), %rcx
    addq %rcx, %rbx   # sum
    incq %r8
    jmp find_inisum

end_ini:
    movq $-1, %rax
    salq $63, %rax
    jmp loop

loop:
    cmpq $0, %r9
    jl end

check_validity:
    cmpq $0, %r9
    jl increment
    cmpq %rdi, %r9
    jge increment
    cmpq $0, %r10
    jl increment
    cmpq %rdi, %r10
    jge increment
    movq (%rdx, %r9, 8), %r13
    movq (%rdx, %r10, 8), %r14
    subq %r13, %rbx    # subtract arr[left]
    addq %r14, %rbx    # add arr[n-right]
    cmpq %rbx, %rax
    cmovlq %rbx, %rax

increment:
    decq %r9
    decq %r10
    jmp loop

end:
    ret
