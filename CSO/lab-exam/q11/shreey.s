.global func
.global sum

func: # %rdi stores array[0] and %rsi stores size and %rdx stores result[0]
     movq $1, %rcx
     pushq %rsi
     sarq $1, %rsi
     movq %rsi, %r10   #half
     popq %rsi
.L0:
    cmpq %rsi, %rcx
    jle .L1
    ret
.L1:
    movq $0, %r9
    movq $1, %r8
.L2:
    cmpq %r10, %r9
    jl .L3
    pushq %rsi
    call sum
    popq %rsi
    movq %rax, -8(%rdx,%rcx,8)
    addq $1, %rcx
    jmp .L0
.L3:
    cmpq $1 , %r8
    jne .L5
    cmpq $0 , (%rdi,%r9,8)
    jne .L4
    movq $1, (%rdi,%r9,8)
    subq $1, %r8
.L4:
    cmpq $1, %r8
    jne .L5
    pushq %rsi
    subq $1, %rsi
    subq %r9, %rsi
    movq %rsi,%r11
    popq %rsi
    cmpq $1 , (%rdi, %r11,8)
    jne .L6
    movq $0, (%rdi,%r11,8)
    subq $1, %r8
    jmp .L6
.L5:
    movq %r10,%r9
    jmp .L2
.L6:
    addq $1, %r9
    jmp .L2



sum: # %rdi stores array[0] and %rsi stores size
    pushq %r12
    pushq %r13
    movq $0, %r12
    movq $0, %r13
.K0:
    cmpq %rsi, %r13
    jl .K1
    movq %r12, %rax
    popq %r13
    popq %r12
    ret
.K1:
    cmpq $0,(%rdi,%r13,8)
    jne .K2
    addq %r13,%r12
    jmp .K3
.K2:
    pushq %rsi
    subq $1, %rsi
    subq %r13, %rsi
    addq %rsi, %r12
    popq %rsi
.K3:
    addq $1, %r13
    jmp .K0


    