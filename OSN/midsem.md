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

- **FCFS (First come first serve)** - The turnaround will be slow if there are
  processes with smaller exec time come later.
- **SJF (Shortest job first)** - Still preserves fcfs, may help but still need some
  way to interrupt the currently running process.
- **STCF (shortest time to complete first)** - Preemptive SJF (don't trust process
  and interrupt). Sees at any given point who completes first and pick them.
  
All above have bad response times

- **Round robin** - Try to break process into smaller ones and give each 1 second of
  time (for eg). This reduces the response time but not turnaround. Also has
huge cost of context switching.

### Incorporating I/O

When process is interactive, it itself gives up CPU and goes to a blocked state.
But when the process is not interactive, it keep consuming time and round robin treatment
is better. We will have to use STCF method to break the longer task to happen whenever shorter ones are blocked. Each burst of round robin can be treated as a seperate job and take up jobs. The blocked ones will have infinite end time.

But we don't know the actual completion time of each job. We need a way for the scheduler to learn by observing everytime.

### Multi-Level Feedback Queues

Basic idea is that, there are n different queues with different priorities. The queues with higher priorities will get executed first. And scheduler rearranges process across queues based on their behaviour.

Rules:

- Priority(A) > Priority(B) then A runs.
- Priority(B) > Priority(A) then A and B run on round robin.
- If job uses up the alloted time slice, reduce the priority.
- If a job gives up CPU then don't reduce priority (can be gamed)
- After a while boost the priority of all CPUs, back to top (Prevents starvation of lower processes by interactive processes, also accounts for programs which change the phase into
 a more interactive one or other way around).

#### Tuning MLFQ

There are different parameters in an MLFQ,

- n - Number of queues
- $t_{n}$ -  time slice of each queue
- S - Time interval between priority boost.

A typical solaris MLFQ has 60 queues, time slice ranging from 20ms to
100ms. And S of about 1 second.

## Networking

### Network components

- Host - Any device that can send or receive traffic. Like smartwatch, computer, laptop, phone. Host can be either server or client.
- IP Address: Any host needs an address to send data to.
- Repeater - Is used for regeneration of signals and long distance communication.

### Types of repeaters

- Hubs: Multi-port repeaters, they just take input from a port and just blasts it to
all the devices and doesn't channel each device like a switch does
- Bridge: It is a switch but only connects two ports. They can differentiate the two ports.
- Switches: These devices facilitate communication within a network. They can assign different ports to different devices and have multiple ports.
- Routers: This is the actual device that facilitates communication with different networks. They also provide tools like security, filtering and traffic control and port forwarding. They maintain a routing table and have IP address of every network attached to it.

### OSI

It is an educational standard that is used to explain different layers of networking.

1. Physical: Something physical that transports 1,0 bits. Could be wires (ethernet) or Wifi
2. Data Link: Hop to Hop: Establishes reliable link between two nodes. Uses MAC Addressing 
scheme, eg: Wifi card or Network Card.
3. Network: End to End: Manages end-to-end routing through different routes in a large 
network. Uses IP addressing model. Eg: Routers and L3 Switches
4. Transport: Service to Service: Ensures data is transferred to that particular process.
 Uses ports for addressing. 0 - 65535 etc, 1024 - 49151 (registered ports).
5. Session: manages connection between different devices.
6. Presentation: handles encryption and compression, ensures that data format is understandable.
7. Application: Provides network service to application processes, web browsers, email
clients and other protocols like https, smtp.

The L5, L6, L7 are grouped together as Application to Application (L7).

In real life, a more simple 4 layer networking is usually observed.

1. Application Layer: Protocols used are HTTP, SMTP, RTP, DNS
2. Transport Layer: Protocols used are TCP, UDP
3. Internet Layer: Protocols used are IP, ICMP
4. Network/Link Layer: Protocols used are DSL (Telephone), Ethernet, 802.11, SONET

### Socket API

There needs to be some way OS supports networking. In UNIX it is through the Socket API.
The network service API. There are reliable streams and unreliable datagrams. This API allows, applications to attach to different ports.

Different system calls which are a part of SOCKET API:

- socket() - creates a new socket with either TCP or UDP and returns fd.
- bind() - associates the socket with a specific IP and port.
- listen() - in server, used to listen to incoming connections from clients.
- accept() - Waits for the client to connect and returns new fd on both sides.
- connect() - client uses to connect to server
- send()/receive() - use the new fd to transfer data
- close() - terminate the connection.

To uniquely identify the ports, the tuple: (IP address, protocol, port) is used. IP address is a device specific thing, protocol is socket specific, and port is what you bind.

### Putting data together

The transport layer packages data into segments and adds L4 hearders.
The network layer then adds IP address to it and calls it Packet.
Then finally t he data link layer adds mac-address and calls it Frame.

Multiplexing involves handling data from different multiple sockets and adds a
tranport header. Demultiplexing involves using these hearders to get back data.

### Transport layer (TCP/UDP)

#### TCP

- TCP socket is identified by four tuple: Source IP, source port, Destination IP and Destination port.
- Receiver uses all 4 to segment appropriate socket
- Server may support many TCP sockets.
- Each socket has its own client

TCP has following features;

- Connection oriented: Connection is established then data is transmitted
- Reliability: Makes sure every packet reaches the destination.
- High overhead on error checking
- Flow control
- Error detection and correction
- Congestional Control
- HTTP(S), SMTP, FTP

#### UDP

- Uses only a two tuple: dest ip, and dest port
- Receiver uses port to redirect to same destination port.
- UDP segments with same destination port but different IP or source port.
(basically doesn't care where the data is coming from)

Features:

- Not connection oriented: There is no connection and uses timeouts instead.
- Unreliable
- Faster
- Has error checking but only disregards errorneous packets
- No congestional control
- Streaming, VoIP, DNS

### TCP Header

How to calculate RTT:

$$ EstimatedRTT = (1-\alpha)*(EstimatedRTT) + \alpha*SampleRTT$$
$$ DevRTT = (1-\beta)*(DevRTT) + \beta|SampleRTT - EstimatedRTT| $$
$$ Timeout Interval = EstimatedRTT + 4*DevRTT $$

This is how we change the RTT based on the previous responses. Here the Alpha
and beta values are fixed.

EstimatedRTT is the estimated weighted moving average. DevRTT is the Deviation
of the Estimation from sample observed. Finally the timeout interval is
an estimated but add a bit of deviation just to make sure.

Watch video bruv: <https://invidious.nerdvpn.de/watch?v=JFch3ctY6nE>

## Memory Virtualization

### Goals

- Transparency - create an illusion to the processes that there is infinite
  memory, and not to worry about what is happening behind the scenes
- Performance - Minimize the overhead in space and time for accessing memory.
- Protection - Protect the process from other process and the OS itself

They requirements can be simplified as:

- For efficiency we need to have hardware level support.
- OS can control by keeping track of which memory are freed and which are in use.
- Ensuring that on application has direct access to memory.
- Allow programs to flexibly use address space the way they like.

### Memory API

This API is very misused, thus we don't have access to the actual system calls.

- malloc() - Used to allocate memory in the heap
- free() - Used to free the allocated memory

These are C functions in the stdlib and under the hood they use brk() and sbrk().

### Common Errors when using in API

There are many common errors that you might come accross when using this API.

- Overflow - This is caused when we try to access or write to memory that is
  bigger than the allocated memory.
- Uninitialized Read - This is caused when we read the malloc memory without
  even initializing it with anything like 0 bits.
- Memory Leak - This is caused when we don't free the memory after we allocate
- Dangling Pointer or Use after Free - This is when we try to use the memory after
  is has been freed.
- Double Free - When we try to free something we already freed.
- Invalid free - when we try to free something we didn't malloc

#### The Base and Bounds Approach

We cannot do the virtualization at the physical level since the offset from
which the memory is allocated in the OS will be different and we need to
do some sort of translation from the physical memory to the virtual one.

One of the approaches is Base and Bounds approach:

- Have a pair of hardware registers called base register and the bounds register in
the MMU (memory management unit), every process has its own.
- The base register tells the offset from the physical memory the VA starts
- The bounds register just keeps a track of virtual or physical bounds of the
process memory and raises interrupt when more than that is accessed.

The hardware based VA to PA conversion is called Address Translation, and these
both registers can change anytime thus called Dynamic relocation.

There are a lot of problems with this approach main one being that, it can't
handle cases properly where process goes beyond memory without closing the program.
Also there is a lot of space wasted free between the stack and the heap.

#### Segmentation

We instead try to keep heap, stack and code different and have a table for it
instead which maps in such a way that first two bits code for whether it is
stack or heap or code, and the further bits represent the offset.

There are lot of problems still:

- Context Switch: Segment registers should be stored along with other registers
for context switching
- Each process has multiple segments and can lead to external segmentation: This
means there are free segments everywhere, but if some process asks for a large
memory again, it has to free the previous ones and allocate new memory.
- OS has to find free memory everytime.

To avoid external fragmentation, one good approach is to fix the smallest amount
which is called paging.
