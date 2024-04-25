.global leftright

# rdi - n, rsi - arr, rdx - ans
leftright:
	movq $0, %r8      # index in arr
	movq %rdi, %r15
	decq %r15         # n - 1 and right
	movq $0, %rax     # stores inisum
	jmp cal_inisum

cal_inisum:
	cmpq %r8, %rdi               # i < n
	movq %r15, %r13
	subq %r8, %r13               # get n - 1 - i
	je start_iter
	movq (%rsi, %r8, 8), %r10    # arr[i]
	movq $0, %rbx                # add this end
	cmpq $0, %r10
	cmoveq %r8, %rbx             # left facing
	cmpq $1, %r10
	cmoveq %r13, %rbx            # right facing
	addq %rbx, %rax
	incq %r8
	jmp cal_inisum

start_iter:
	movq %rax, (%rdx)            # push initial_sum
	movq $0, %r8                 # iterator
	movq $0, %r14                # left
	movq %rdi, %rbx              # n/2
	sarq %rbx
	jmp loop1

loop1:
	cmpq %r8, %rdi
	je end

loop2:
	cmpq %r14, %rbx
	je increment
	movq (%rsi, %r14, 8), %r10
	cmpq $0, %r10
	je flip_left
	movq (%rsi, %r15, 8), %r10
	cmpq $0, %r10
	je flip_right
	incq %r14
	decq %r15
	jmp loop2


flip_left:
	movq $1, (%rsi, %r14, 8)
	movq %r14, %rcx
	subq %r15, %rcx    # right - left
	addq %rcx, %rax    # add to sum
	jmp increment

flip_right:
	movq $0, (%rsi, %r15, 8)
	movq %r14, %rcx
	subq %r15, %rcx    # right - left
	addq %rcx, %rax    # add to sum
	jmp increment


increment:
	incq %r8
	movq %rax, (%rdx, %r8, 8)
	jmp loop1

end:
	ret
