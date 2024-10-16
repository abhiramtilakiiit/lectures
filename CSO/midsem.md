# CSO midsem prep

## Introduction

### Steps during compilation phase

Original format for a C-file is `hello.c` - Source Program.

- Preprocessing Phase (cpp) The file format is `hello.i` - Modified Source
  Program (expanded c file). Read the contents of `stdio.h` and insert into
  program text.

- Compilation Phase (ccl) The file format is `hello.s` - Assembly Program
  (assembly). Provides common output language to all high-level languages.

- Assembly Phase (as) The file format is `hello.o` - Relocatable object program
  (object file in binary) Translates the assembly files into machine language
  instructions packaged in Relocatable object.

- Linking Phase (ld) The file format is `hello` or `a.out` (by default) -
  Executable object program. This is also a binary file. Functions which are
  present or are called from other .c files (maybe from std library), are linked
  together.

### Hardware organization of System

- Buses: Collection of electric circuits, that carry fixed amount of bytes
  called words (4-8 bytes).

- I/O Devices: Used to connect to other replacable components like Controllers (
  take control sequences as input ) and Adapters ( translate language )

- Processor: At its core it is an engine that interprets instructions stored in
  main memory. It is word-sized register that contains an instruction set loaded
  from RAM.

  1. It executes whatever PC points.
  1. This simple instruction exectution model is called Instruction Set
     Architecture.
  1. Register file is a small storage device which consists of various word-size
     registers.
  1. ALU computes, new data and address (both) and returns them.

- RAM: Temporary Storage device that holds both a program and data it
  manipulates. Collection of dRAMS (Dynamic RAM) chips. Each dRAM chip is a
  linear array with its own unique address.

### Operations performed by CPU

- Load - Loads a word from main memory to register.
- Store - copies a word from register into a pointed main memory.
- Operate - Sends it to ALU, which takes two registers and overwrites one of it.
- Jump - Copy a word from instruction set to PC.

### Sequence of Hello World

- You use the keyboard (USB controller) to type the hello world, which is stored
  in memory until Enter is pressed
- Then the shell wraps the command and sends it to CPU which tells to search for
  executable `hello` in the hard disk. Then hard disk searches for what's there
  in the memory and eventually finds it.
- Then shell executes a sequence of instructions which copy the code and data of
  hello binary object file from disk to main memory.
- Now CPU starts executing the machine language instructions in the hello
  program stored in main memory.
- These instructions then lead to the string `hello world\n` being loaded to the
  register to the display device.

### Cache Memory

- It is located near to CPU thus faster communication.
- Application programmers can exploit cache memory to get fast performance.

## Operating systems

- A layer of interface between the application programs and the hardware. It is
  used for security and also ease of use.
- An OS uses files for everything, all I/O devices as abstraction, VRAM instead
  of RAM for abstraction. Also has a packaged process instead of processor which
  thinks its the only program in the system.
- Every application programs calls Kernel code called System Calls which perform
  `context switching`, handing over control to another process.

- Process are not real paralleism because there is no proper communication or
  transfer between each individual processes, use threads for concurrency.

### VRAM

- Each process is abstracted for security reasons with real memory, thus offered
  `virtual address space`, consists of several areas with specific purposes.

### Files

- Sequence of bytes. I/O is performed by reading or writing them.

### Amdahl's Law

If we speed up one part ($\alpha$) of the process by k, the total speed increase
is:

$$ T*{new} = (1-\alpha)\times T*{old} + \frac{\alpha}{k} \times T\_{old} $$

### Levels of Abstraction

Processor Hardware -> Instruction Set -> I/O devices -> OS -> Virtual Machines

## Bits and operations (already know most of them)

To convert integer part of decimal number into binary, we divide by 2 and note
the reminder (right to left) until the quotient is 0.

To convert the fractional part of decimal to binary, multiply each number by 2
and capture the decimal part, the integer part is the left most digit (after
decimal), and the fractional part is to be further multiplied by 2 until you get
zero.

Eg: $$ 0.8125 \times 2 = \boxed{1}.6250 $$ $$ 0.6250 \times 2 = \boxed{1}.250 $$
$$ 0.250 \times 2 = \boxed{0}.500 $$ $$ 0.500 \times 2 = \boxed{1} $$ $$ 0
\times 2 = \boxed{0} $$

Thus answer is 0.11010

## 2's complement notation

To convert from 2's negetive to postive or otherway, take a complement of the
number then add 1 to it.

- Upto $2^{w-1}$ both unsigned and signed are same, but after that find how much
  $Number - 2^{w-1}$, then negetive that

## Sign extension

- when doing 2's complement bitwise shift, left shift is the same but right
  shift involves, the sign bit being copied not 0's begin added.

## Multiplication

- when we multiply first convert the two operands to 2w bits by sign expansion
  then you can do whatever, multiply, then truncate.

---

## History

- All processor are backwards compatible to Intel 8086, introduced in 1978.
- x86 is CISC not RISC, 8086 is 16-bit extension to 8080. (8-bit registers)
- ARM - Advanced RISC Machines, used to power smartphones, macbooks
- x86 used to power consoles except Nintendo Switch.
- ARM is faster than x86 ( fastest supercomputer in 2020 ). But in the end
  of the day x86 is more useful in compute intensive, cloud computing.

Register sizes:

- 8086, 8088, 80186, 80286 are all 16-bit
- 80386 (i386), 80486 (i486) are all 32-bit
  Also pentium 1, pro, 2, 3, 4 (some), M, Core Xeon (old), ATOM (mobile),
  Celeron (old), AMDx86, AMD K5,K6, Athlon, Duron, Sempron
- Newer Prescott Pentium 4, Pentium D, Core 2, Core i3-9, Celeron, Pentium
  Dual Core, Newer Xeon. AMD Ryzen, Epyc, APU Athlon/Sempron, APU Ax

### Some good achievements

- 8086 is 1mb address space, first 16 bit
- i386 is 32-bit, can run unix.
- Pentium 4E, first 64 bit processor
- Core 2 first dual core (multicore)
- Core i7, 4 cores

### AMD

- Recruited top designers from failing companies.
- Built Opteron which is tough competitor to Pentium.
- Developed their own extension to x86-64.

Intel felt defeat to AMD

- They made IA64 in 2001, which everyone hated.
- (2003) AMD made x86-64 which defeated performance of intel
- (2004) Intel made EM64T (extended to 64-bit), which was x86-64 clone.

## Registers

- rax
- rbx
- rcx
- rdx
- rsi - source indicator
- rdi - dest indicator
- rsp - stack pointer
- rbp - base pointer
- r8
- r9
- r10
- r11
- r12
- r13
- r14
- r15

### Moving

Using movq command will move but to move immediately use $.
To move the value of one to other do %rax, (%rdx) to assign
the register value of rax. But copy trait implemented then ( use leaq )
just doing register to register movement will move all contents.

You cannot perform memory to memory transfer with a simple movq

### Displacement and scaling

d(rax, rbx, s), will do (d + rax + rbx * s), s is only 2,4,8

movq will only move quad, but if you want to do zero extensions.
You can do movzbw ( byto to word )
