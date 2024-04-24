.global func
.global sum

func: # %rdi stores array[0] , %rsi stores size and %rdx stores res[0]
     pushq %rsi
     sarq $1 , %rsi
     movq %rsi, %r10
     popq %rsi
     movq $1, %rcx
.L0:
    cmpq %rsi, %rcx
    jle .L1
    ret
.L1:
    movq $1, %r8
    movq $0, %r9
.L2:
    cmpq %r10, %r9
    jl .L3
    call sum
    pushq %rcx
    subq $1, %rcx
    movq %rax, (%rdx,%rcx,8)
    popq %rcx
    addq $1, %rcx
    jmp .L0

.L3:
    cmpq $0, %r8
    jle .L4
    cmpq $0, (%rdi,%r9,8)
    jne .L5
    movq $1, (%rdi,%r9,8)
    subq $1, %r8
.L5:
    cmpq $0, %r8
    jle .L4
    pushq %rsi
    subq $1, %rsi
    movq %rsi, %r11
    subq %r9, %r11
    popq %rsi
    cmpq $1, (%rdi,%r11,8)
    jne .L6
    movq $0, (%rdi,%r11,8)
    subq $1, %r8
.L6:
    cmpq $0, %r8
    jle .L4
    addq $1, %r9
    jmp .L2

.L4:
    movq %r10, %r9
    jmp .L2

sum:
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15
    movq $0, %r12
    movq $0, %r13
.K0:
    cmpq %rsi, %r12
    jl .K1
    movq %r13, %rax
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    ret
.K1:
    cmpq $0, (%rdi,%r12,8)
    jne .K2
    addq %r12,%r13
    jmp .K3
.K2:
    pushq %rsi
    subq $1 , %rsi
    subq %r12, %rsi
    addq %rsi, %r13
    popq %rsi
.K3:
    addq $1, %r12
    jmp .K0

