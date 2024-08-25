# OSN

## Process Virtualization

Every process needs to think it has its own CPU.

### What does OS need to make such virtualization

- Low-Level mechanism of Context-Switching (CPU hardware supported) -
  Performance overhead
- Some algorithm that can intelligently decide. (CPU Scheduler) - Control
  overhead

#### What consituites a process?

- PID (Unique ID)
- Memory Image: Code and data (static), Stack and Heap (dynamic)
- CPU Context Registers: Instruction pointer, Current Operands, Stack Pointer
- File Descriptors

#### Creation of Process by OS

1. Load process into memory: Lazy load process from disk to address space of
   program.
2. Allocate runtime stack: Used for local variables and parameters and return
   values of functions.
3. Allocate program heap: Used for dynamically allocated data.
4. Basic File Setup: stdin, stdout, stderr
5. Initialize CPU registers: point program counter to start of the program.
6. Start the program.

#### States of a Process

- Ready - Waiting for scheduler to pick up and run
- Running - Can either initiate I/O or deschedule running process
- Blocked - (I/O is happening)

#### How OS stores metadata of a process

It uses a process list. This process list is a list of structs of processes.

A struct of process (Process control Block) should contain atleast:
- Process Id
- State of the process
- Address Space of the process

### Basic features to control process that OS provides

- Create a process
- Destroy a process
- Suspend
- View Status
- Wait 

#### Posix API

All software use api to communicate with each other, so does OS. The user
programs use Posix API (a set of standard system calls) to communicate with the
OS and kernel space. Most of these system calls are abstracted out by
programming languages and other tools.

##### Fork

- New copy of the parent process image is created. We get to choose what to do
  with the new fork.
- The new process is added to process list by parent and also executed. 
- For now the same memory is modified both by parent and child.

##### Wait

- The wait call is used to wait for the child process to end executition
- The wait call collects the child process after it exits and free's its process
  block. This prevents creation of zombie process
- If parent dies then child is called orphan which init process takes control
  of.
- If child dies without wait() call, then the process ID is not freed and this
  state is called zombie.
- Wait is also used to monitor the exit status of the exited child process.

###### Exec 

- The exec call is used to pass the control of a process to some other program.
- Some variants of exec can load command line programs with arguments and all.
- It is useful because child can run a different program than the parent.

### Mechanism of Process virtualization

#### LDE Protocol (Limited Direct Execution)

Let the program run in the CPU but limit what it can do. Then offer priviliged
operations through well defined channels.

- This method uses system calls, which only kernel mode can execute. 
- The kernel doesn't trust the user to directly specify the address of the
  function to jump to. Instead it contains its own kernel stack that it only
initiates (during the start of the process), and uses to jump. It also uses a
table called Interrupt Descriptor table that maps system calls to addresses.

##### Trap instruction 

- Trap instruction: OS uses this to switch from user mode to kernel mode. Normal
  routine is interrupted before this is executed.

- During trap instruction the following protocol is followed:
  - CPU is elevated to higher level
  - Switch to kernel stack
  - Store old context; the PC and other registers in kernel stack.
  - Lookup the IDT to handle the trap, and jump to trap handler
  - Once in kernel these priviliged instructions can be performed.
  - Execute return to trap instruction
  - Returns the program to user mode

##### LDE Protocol

The following is the procedure for LDE.

- OS (boot): Initialize the IDT. 
- Hardware: Remember the addresses for the table entries (syscall handlers).
- OS (run):
  - Create a process list entry
  - Allocate memory for the program
  - Move the program from disk to memory
  - Setup the user stack with args
  - Fill kernel stack with default Reg/PC
- Hardware: Restore the regs from the kernel stack to user stack, move to user
  mode and jump to main.
- Program: Execute main. Encounter syscall(). **Trap into OS**
- Hardware: Save the user regs into kernel stack. Move to kernel mode, jump to
  trap handler.
- OS (run): Handle trap, Execute corresponding systemcall. **Return trap to user**
- Hardware: Restore regs from kernel stack, move to user mode, jump to PC after
  syscall instruction.
- User: Execute the rest of the main(). Now invoke exit() call with trap
- OS: Clear the allocated memory of the process and remove from proclist.

#### Multitasking or Context switching

- Cooperative approach - process themselves give a yield(), to give up control to other process.
- Non-Cooperative approach - OS will handle the control and flow of multitasking
  and take control once in a while. To take control a timer interrupt is used.

The second one is better because we don't trust the user programs, if they stop
or fail, we may have to reboot.
OS gets to choose whether current process is running or anotehr process runs

##### LDE Protocol with Timer Interrupts

Below is the mechanism for LDE protocol with timer interrupts:

- OS (boot) - Initialize the IDT or trap table
- Hardware - Remember the addresses for each syscall, even timer handler
- OS (boot) - Setup interrupt handler
- Hardware - Run the interrupt handler every x seconds
- Program - Run the process A
- Hardware - x seconds passed, timer interrupt occurs, user regs saved to kernel
  stack. move to kernel mode and goto timer handler.
- OS (run) - Handle the trap, call switch routine, save the regs(a) to
  proc-struct(A). Restore the regs(B) from proc-struct B, switch to k-stack (B),
execute return-to-trap for B.
- Hardware - Restore the kstack(B) into regs(B), and switch to user mode and to
  to next instruction pointed by PC.
- Program - Run the process B

and so on...

This interrupt happens as a locking mechanism, so no other interrupt handling is
taking place while current interrupt is raised.



## Scheduling

We need to have a concept of workload to decide which one to pick at any given
point. We also need a good metric to measure performance and ones for
responsive time (how long are you making me wait before i first start).

$$ T_{turnaround} = T_{completion} - T_{approach} $$
$$ T_{execution} = T_{firstrun} - T_{arrival} $$

Lets go over some bad policies:
- FCFS (First come first serve) - The turnaround will be slow if there are
  processes with smaller exec time come later.
- SJF (Shortest job first) - Still preserves fcfs, may help but still need some
  way to interrupt the currently running process.
- STCF (shortest time to complete first) - Preemptive SJF (don't trust process
  and interrupt). Sees at any given point who completes first and pick them.
  
All above have bad response times

- Round robin - Try to break process into smaller ones and give each 1 second of
  time (for eg). This reduces the response time but not turnaround. Also has
huge cost of context switching.
