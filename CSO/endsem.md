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
was faster than memory, thus 

### Writing Cache-Friendly Code
