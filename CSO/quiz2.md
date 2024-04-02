# Notes for quiz2

## Y86-64 Processor State

- Y86 is made by this textbook, won't see anywhere else. Easier than x86
- Speed is 1 hz, ( 1 instruction per clock cycle )
- Each instruction is broken into 5 steps, each of which is handled by a
  seperate stage of the hardware ( pipelined processor )
- Thus at each clock cycle the processor can handle these 5 steps from
  different instructions ( 5 instructions in total ).
- This can lead to `Hazard` conditions where the current instruction depends
  on the instruction that is still in the pipeline.

### Y86-64 ISA

- Program visible state is state of registers that are visible to the
  "programmer", that codes in assembly. There are 15 of them + status +
  condition codes + PC.
- There are 3 single-bit condition codes called, ZF, SF, OF (not CF)
- There is the status code which just indicates whether program is working.
  It shows some (exceptions) if things are not working as they should.

- Set of instructions:

  - The movq syntax is - rrmovq (included in unconditional cmovq), rmmovq, mrmovq, irmovq where
    r = register, m = memory, i = immediate.
  - There the memory address mode has displacement (only memory), but not scaling.
  - Unlike x86 there is no "i to m".
  - There are operations, OPq - addq, subq, andq, xorq.
  - There are jump instructions as, jXX - jmp, jle, jl, je, jne, jge, jg
  - There are 6 conditional move instructions cmovXX, cmovle, cmovl, cmove,
    cmovne, cmovge and cmovg. All these are rrmovq types

- the first byte is for instruction, second by is for registers (optional), the rest 8
  bytes are for values and displacements (word length).

### Instruction encoding

The first byte is used for identifying the instruction type and is divided into two parts ( 2
hexa decimal digits ).

The first one is the higher order, code-part and second is lower-order function
part. Function part is used for codes which have furhter division of
instructions like (OPq, cmovq, jmpq)

- Register file (small RAM in cpu) contains the program registers, 0xF is used
  for register when no register should be accessed ( call, jmp, ret ).

- in x86 there are less bytes since they use PC-relative addressing, but we use
  absolute so we require 8 bytes for that.

- For the 8 byte thing we use little-endian notation where the values are
  reversed.

- This form of encoding assures that each of the instructions are unique and
  there is no ambiguity.

### Y86-64 Exceptions

The program visible state has status code, which can be:

- 1 (AOK) - Normal Operation
- 2 (HLT) - halt (halt instruction does this)
- 3 (ADR) - Invalid address (triggered when beyond maximum limit addresses are
  accessed)
- 4 (INS) - Invalid instruction enountered (the instruction code doesn't exist)

Usually when these exceptions are encountered, the program stops executing, but
you can configure it to have an exception handler.

### Example Y86 program

We don't have addq for i to r, thus put i on r using movq, then use it.
Don't have compq, or testq, thus using andq or xorq, set the condition flags
manully. But subq sets conditional flags automatically, if the first operand is
smaller than the second.

## Sequence

Practice tables

### SEQ Hardware

Learn the diagram
