# CSO endsem prep

## Syllabus

1. Slides

1. Book

- A Tour of Computer Systems
- Program Structure and Execution (except FP)
- Machine Level Representation of program (until array allocation)
- Processor Architecture
- The Memory Hierarchy
- Virtual Memory (until linux case study)

---

## The Memory Hierarchy

Until now we aassumed that the CPU can access memory in constant time because
the memory is a linear array of bytes. Memory is divided into a hierarchy based
on different capacities, costs and access times.

- CPU registers hold the most frequently used data.
- Cache memory nearby the CPU act as staging area for data stored in the
  relatively slow main memory.
- The main memory stages data stored on large slow disks or tapes
- Which inturn act as staging areas for code to be stored on other machines
  connected by network.

The sizes of data are different, but it is made such that the cost of that
particular level is the same (storage cost x size).

Well written programs access, the memory nearby more often.
Speed and Storage decreases by 10 fold on each level. This is called **Locality**

### Locality

Is of two types:

- Temporal Locality: If a memory location is referenced once, it is likely to be
  referenced again in the near future.
- Spatial Locality: If a memory location is referenced once, nearby memory
  locations are likely to be referenced too.

Locality is exploited in most hardware and software that is seen around you. CPU
has hierarchial memory, but even Operating Systems store a cache of the most
commonly used items in the address space. Even web-browsers use cookies and
cache and same with mobile apps. Even things like web servers and Databases use
this.

#### Locality of References to Program Data

Single variables have no spatial locality. Vectors do have good spatial locality
but poor temporal locality because they are accessed only once mostly.

Stride-k reference pattern: Accessing every $k^{th}$ element of a contiguous
vector. Stride-1 is referencing every single element (sequential reference
pattern).

Stride-1 is said to have good spatial locality because we are not jumping high
memories at once (because memory is stored in row major in reality). Column
major referencing is Stride-n and is slow.

### Memory Hierarchy

In CPU:

- L0: CPU registers
- L1: SRAM (L1 cache)
- L2: SRAM (L2 cache)
- L3: SRAM (L3 cache)
- L4: DRAM (main memory)
- L5: Local secondary storage
- L6: Remote secondary storage

#### Caching in memory hierarchy

It acts as staging area for a larger, slower devices.
At each level in the pyramid, the k serves as cache for k+1.

At every level K, the most staged "blocks" from K+1 are stored, but the size of
the block may vary depending on the size of k. In CPU, L0 and L1 have word sized
blocks. While L1 to L2 have 10 bytes, L4 to L5 have hundreds and thousands etc.

#### Cache Hit

If we are looking for a data object d from k+1 or bottom, we first look for that
data-object in k, if it is found it is called a cache hit. We will study how
looking at k will not have much loss even it missed but hit will give us a very
high advantage.

#### Cache Miss

If we are looking for a data object in k, and we don't find it, then we pass the
finding to the next level k+1, and then use a "cache replacement policy" to
replace/evict an existing block (victim block). Now the data object is present
in k and can be returned to the caller.

#### Types of Cache misses

- Compulsary Misses: If the cache never existed, it is called cold cache and
  misses called, cold misses.

There is always a placement policy, kinda like a hash function of a hashmap,
which helps us find the cache faster, and know where to start looking for.

- Conflict Misses: Let's say you want to cache a new object, but the address
  pointed by the placement policy is already occupied. But repeated accessing of
  two blocks with the same policy, can cause huge delays and multiple conflicts.

Working set is the set of blocks that are being iterated in the current code,
Eg: all elements of a vector in a for loop.

- Capacity Misses: If the working set exceeds the size of cache, it can cause
  problems and its called a capactiy miss, in one iteration, the cache goes
  through a full replacement many times.

#### Cache Management

The logic that manages the cache can be hardware and software implemented, but
it is called cache management.

The CPU registers are handled by the compiler. The L1,L2,L3 cache are totally
handled by the CPU. The DRAM uses virtual memory which is handled by OS and
translated by address translating hardware. AFS and NFS clients installed in
machines handle the caching for the L5 and L6 ones.

### Cache Memories

There used to be no cache in CPUs earlier. But advancement in technology of CPUs
was faster than memory, thus new SRAMs were added to CPUs itself.

#### Generic Cache memory organization

There different sets in memory, each set has different lines (constant) and each
line has B number of blocks. There is a tag bit to ensure it matches. The tag
bits are stored both in the address and in the line structure in the memory

A given address is m bits split into t, s, b bits. The information needed to
uniquely identify the memory include Capacity = S x E x B. The complete set of
information is in (S,E,B,m), (m is required to get t-bits)

t is tag bit and s,b combined are called index bits.

A particular line is validly set already, only when valid bit is true. (valid
bit is only there in the line structure)

#### Direct Mapped caches

Here E=1. When replacing, if valid bits of all lines in a given set is set to 1,
then they are occupied and one of the lines are to be evicted, when E=1, there
is only one such. (no recently used and shit)

SET is the remainder hash-function based division seen earlier, and each set
contains lines, and each line contains a block. Sometimes the number of blocks
exceeds the number of sets, or same hashfunction, thus two different blocks have
the same set.

Thus tag bit is used to identify the block now.

One example of failiure is when: we are taking dot product and we multiply two
contiguous arrays, x[] and y[] simultaneously. Whenever we access y, we are
overwriting the x[] we just read. This is called Thrashing.

#### Set associative cache

Called E-way set associative cache. The value of E should be between B and S.

Every set in associative memory are their own memories which implements cache
replacement policy. (LRU, LFU, random)

#### Fully associative cache

There no sets, only lines. There is a big tag bit, and the b-bits, no s-bits.
They are useful for smaller caches like TLB.

#### Issues with writes

On write-hit:

- Write-through: When we update some register's contents in k-level go to k+1 and
  write there too. Which causes very slow writes.

- Write-back: When we update some register's contents, we don't update
  lower-levels until the current one is evicted.a (its because we know it will
  never be accessed)

On write-miss:

Write-through are no-write-allocate bypasses the cache and writes cache to the
loewr level.

Write-back is Write-allocate where every miss result will load the corresponding
block from the lower level and updates the cache block (doesn't change the lower
one)

#### Anatomy of a real cache Hierarchy

Modern processors include seperate i-cache and d-caches, instead of
unified-cache. This is because

- I-cache is read-only so its read-only optimized
- Different block sizes, associativities and capacities.
- Data access doesn't create conflict with instruction access.

In i7, each core has seperate L1 i-cache, L1 d-cache and L2 unified cache. All
cores share the L3 unified cache.

### Performance Impact of cache Parameters

- Hit rate - cache hits / no. of references
- Miss rate - 1 - hit rate
- Hit time - time required to perform all read on a hit (set selection, line
  identification, word selection)
- Miss penalty - additional time caused because of a miss compared to hit.

1. cache size $\prop$ Hit rate, 1/Hit time
1. block sizes $\prop$ spatial locality, 1/temporal locality, transport accross
   levels, hit rate, 1/hit time
1. E $\prop$ 1/thrashing, tag-bits, LRU state bits, hit time, miss time. Lower
   levels tend to have higher E value (16 in L3,8 in L1 and L2)

Write through maybe useful at the top but usually write-back is preferred.

### Writing Cache-Friendly Code

- Make common case go fast - in the inner-most loop try to refer to similar
  variables frequently
- Minimize the number of cache misses in the inner loop: use spacial locality

## Virtual Memory

What we care about is its ability to use main-memory as a cache for disk.
It works very silently behind the scenes without any intervention from
application programmer.

- Virtual memory is central - it is used in all levels of software.
- Virtual memory is powerful - it enables the memory to be linked with other
  processes, the hard-disk and file system etc.

### Physical and Virtual Addressing

Every byte in main memory has an address called physical address, old computers
and microcontrollers use this.

For virtual addressing there is a translator (MMU) in CPU which uses a lookup
table in the main-memory to translate virtual to physical address.

### Address Space

It is an ordered set of non negetive integers. It is usually referred to using
its logarithm base 2. n-bit address space means something around $2^n$
addresses.

They are like keys of hashmap and different from the word sized bytes.

### VM as a tool for caching

VM systems partition data into different blocks called virtual pages, which is
p-bytes in size. There is also physical memory which is partitioned into blocks
called physical pages (page frames).

virtual pages are of three paritions:

- Unallocated: unallocated blocks do not have any data associated with them
- Cached: allocated pages are cached in physical memory
- Uncached: allocated pages are not cached in physical memory

#### DRAM cache organization

Misses in DRAM cache are way expensive than that of SRAM because disks are
100,000 times slower than DRAM.

DRAM caches are fully associative, and the blocks (virtual pages) are very large
4KB to 2MB.

#### Page tables

A page table has page table entries (PTE), which has PTE at an offset in the
page table.

In our page table, each entry has a valid bit and the corresponding n-bit
address field. If valid bit is set then address indicates the physical address
from where the page table maps. If not set, then it is uncached and address
points to start in DISK. If address is also null then it is not allocated

Since DRAM is fully associative there is no hash-function that this physical
address should only map to certain pages. It can be anything.

Virtual memory is not real memory, it just redirects to physical memory that
actually stores real data.

#### Page faults

DRAM cache miss is called page fault. Page fault exception (when something is
not DRAM cached) triggers the pagefault exception handler in kernel.

This does the Cache miss thing and also brings the page table entry to the PP
from disk and removes the victim VP.

To make it sure, THE PAGE TABLE IS PRESENT IN MAIN MEMORY, THE VIRTUAL MEMORY IS
IN THE DISK ACTUALLY. (PTE is some page table in memory, VP is some location in
disk that may or may not be cached)

the act of transferring data blocks is called swapping, swapped in and swapped
out, like paged in and paged out.

### Locality in VM

Every process has its own virtual memory, which is allocated continuously, thus
the locality is very high because no process uses the whole memory but just a
part of it.

### Address Translation

Symbols:

- N: number of addresses in virtual page
- M: number of addresses in physical page
- P: page size (bytes)
- VPO: Virtual Page offset (bytes)
- VPN: Virutal Page number
- TLBI: TLB Index
- TLBT: TLB tag
- PPO: Physical page offset
- PPN: Physical page Number
- CO: Byte offset within cache block
- CI: Cache index
- CT: Cache tag

MAP: VAS -> PAS

VPO is same as PPO because difference is same.
PTBR, points to the page table.

A virtual address have n-bits, virtual page number(n-p), and virtual page offset(p).

Once you have the VPN, you use it to get the PTE, this PTE contains the PPN, and
PPN + VPO/PPO (same) = Physical address

#### Page hit

When there is a page hit the following things happen:

1. The processor generates a Virtual address and sends it to MMU.
1. MMU splits the Virtual address and obtains the PTE address, which it requests
   from the main-memory (main memory has the PT)
1. The main memory returns the PTE (PPN).
1. The MMU adds this to the VPO and constructure the physical address and sends
   it to main-memory
1. It main-memory reads this and returns to the processor.

Page fault is handled by both hardware and Operating system.

1. Step 1 to 3 is same because we haven't read the PT yet.
1. The valid bit is 0 thus it transfers the control to CPU which executes the
   page-fault handler.
1. The fault handler pages in the new page and updates the PTE.
1. The fault handler returns to the original process, restarting it.

#### speeding up TLB

We can use L1 instead of Main memory for storing the Page table (the page table
itself is cached). But we don't want to f with the L1 in the CPU, so there is a
special cache (software) called TLB (Translational Lookaside buffer) to cache
the table itself.

It is very small. TLB has high associativity. the TLB index and offset are
obtained from VPN itself. For some reason, TLB index has T bits.

---

## Slides

### Compilation sequence

Steps during compilation:

- hello.c (preprocessing: takes include file contents and puts it here)
- hello.i (compiling: generate files in same assembly language which is common)
- hello.s (assmebling: converts .s to machine language binary instructions into
  relocatable object with .o)
- hello.o (linking: dynamically links all the .o files dynamically)
- hello

### Threads

- A process can consists of multiple execution units called threads.
- Can allow concurry in processes, easier to share data and more efficient than
  multiple processes

### Concurrency

- It is a concept of a system with multiple simulatenous activitiess
- Parallelism refers to use of concurrency to make system run faster.
  Eg: Multithreading, Multiprocessing.

### Abstraction

- Programming languages provide different levels of abstraction and support.
- The ISA (Instruction Set Architecture) of CPU gives us a good level of
  abstraction over machine code and we assume that only one instruction per
  second is executed.
- In OS files are abstraction to input and output devices
- Virtual Machines are abstractions over an entire computer.

## Bits and shit

### Represent 1.2 in binary

1.2 = 1 + 0.2 => 1
0.2 x 2 = 0.4 => 0
0.4 x 2 = 0.8 => 0
0.8 x 2 = 1.6 => 1
0.6 x 2 = 1.2 => 1
...
0.2
1.001100110011...

### Boolean algebra

Right shift:

- Logical shift means put zeros at then end.
- Arthimetic means put 1's whereever required

Unsigned max are usually: 11111111 11111111 (FF FF)
but signed max are like: 01111111 11111111 (7F FF)
but signed min are like: 10000000 00000000

#### Two's complement

Conversion to and fro is easy, just invert all bits and add 1, you will get
negetive of a given number.

Mapping is easy until w-1 bits, wth bit onwards the 2's complement starts at
-2^{w-1} and start increasing to -1. There is always a 2^w difference between
two's complement and unsigned after the sign flip.

Usually signed values automatically cast to unsigned if there is a list.

#### Sign-extension

To sign-extend w-bit SIGNED integer, copy the MSB as many times.
When doing type-casting C automatically does sign-extension.

#### Sign-truncation

When doing truncation, we drop higher order bits without any logic but that's dangerous,
can cause data loss.

The way to truncate a signed bit is to do it indirectly. First go unsigned then
convert the result to signed.

#### Standard Unsigned/two's complement Addition

Discards the extra carry bit (w+1). Thus take (u + v) % 2^w

Subtract 2^w if positive overflow, add 2^w if negetive overflow.

#### Multiplication

Before anything, multiplication needs 2w bytes for an operand of w bytes.
This can be achieved by "arbitrary precision" module.

Multiplication by shifting works for both signed and unsigned
Power divide works only for unsigned.

16-bit: 8086,8088
32-bit: Celeron, Atom, Pentium
64-bit: Core 2 Duo, i3, i5, i7

AMD 32-bit - AMD386, AMD486, AMD586, Sempron
AMD 64-bit - Ryzen, Operaton, Athlon 64

---

## Machine Level representation of program

- PC: program counter
- Memory: Used to fetch data and instructions, using addresses. Contains stack
- Registers: Holds addresses or integer data of most used stuff.
- Condition Codes: Stores status/result of most recent arthimetic operation

### movq

- Immediate to Register
- Immediate to Memory
- Register to Register
- Register to Memory
- Memory to Register

There is no memory to memory transfer in one step.

### Memory addressing mode

movq D(Rb,Ri,S), Ra

This means transfer what is there in memory at $Rb + D + Ri\times S$ location.
D is a constant which can be 1,2,4,-8,8 etc. But Ri is a variable shift, which
is shifted by a particular factor S. Very common in array traversal.

### Extension while movement

b - 1 byte, w - 2 byte, l - 4 byte, q - 8 byte
(byte, word, double, quad)

- movzbq for example does zero extension from byte sized register to quad size
  register.
- movsbq for example does signed extension from byte sized register to quad size

quad - rax
double - eax
word - ax
byte - al (only one such register, depricated so just transeer as soon as you
get it)

### Operations

- They are divided into four types based on size of register

Load effective address, copies the effective address of the given memory to
the register. Leaq is useless without address mode. because it is same as movq
register to register where one of the registers contained pointer instead.

If the registers don't contain memory but contain values, then it behaves
normally ( but extra brackets )

C equivalent of leaq:

- leaq 8(rB) = rA is equal to a = &b[1]

Other operations which are trivial are:

- addq, subq, imulq, salq, sarq, shrq, orq, andq, xorq

Single argument opertions:

- incq, decq, notq, negq

Leaq can also be used to do things like $x + y, x + 2\times y$

- leaq (%rdi, %rsi, 2), %rax basically means z = x + 2y
- leaq (%rsi, %rsi, 2), %rax basically means z = 3x

### Stack

- call - push the address of the next instruction in stack and put PC to current
  instruction.
- ret - pop the stack and go to the instruction

Registers rsp, rbx, rbp, %r12, %r13, %r14, %r15 are callee saved (don't change over
function calls)

this is because the order of arguments to a function are:
%rdi, %rsi, %rdx, %rcx, %r8, %r9

and the return value is:
%rax ( caller saved too )

everything other than these are callee saved registers.

### Register saving conventions

The callee saved registers are not meant to change the values of callee saved
registers. If you have to change, then push the values to stack, change them
then pop back before returning.

For Caller saved registers, it is the responsibility of the caller to save the
registers. For Callee its reverse.

### Summary of recursion

Stack frames should have private storage but by the time you are done executing,
you should clear your stack up, except if you want the parent to see your
changes (caller saved).

### Condition flags

common sense.

Switch case has a jump table (array of all destinaitons)) usually when there are
4+ conditions.
