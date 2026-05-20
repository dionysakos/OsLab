# OS Lab 3: Virtual Memory and Inter-Process Communication (IPC)

This part of OSLAB repository contains the implementation for the 3rd Operating Systems Laboratory, focusing on virtual memory management, process synchronization, and inter-process communication using shared memory and POSIX semaphores.

---

## Part 1: Virtual Memory Inspection
Explores the virtual memory layout of a process using the Linux `/proc/[pid]/maps` interface and physical address translation.
* **Memory Allocation:** Investigates memory mechanisms via `mmap()` (anonymous, file-backed, private, and shared mappings).
* **Copy-on-Write (CoW):** Demonstrates the CoW mechanism during `fork()` and tracks physical memory frame allocation upon page modification.
* **Access Control:** Utilizes `mprotect()` to alter memory access permissions dynamically and verifies changes across parent and child address spaces.

## Part 2: Mandelbrot Set Parallelization
Parallelizes a Mandelbrot set generator using multiple processes instead of threads. Compiled via conditional macros (`-DSYNC_SEM`, `-DSYNC_NO_SEM`).
* **`mandel_sem`**: Synchronizes I/O directly to the terminal using an array of POSIX semaphores allocated in a shared memory region.
* **`mandel_nosem`**: Eliminates I/O blocking by utilizing a 1D shared memory array mapped as a 2D buffer for concurrent computation (Fork-Join model). The parent process acts as a barrier and handles I/O sequentially upon completion.

## Part 3: Concurrent File Processing (`pfork`)
Upgrades the Lab 1 IPC architecture. Multiple child processes search for a specific character in a file by dividing the workload into byte chunks.
* **Shared Memory IPC:** Replaces anonymous pipes with an `mmap()` shared struct containing a global counter and a POSIX `sem_t` mutex.
* **Mutual Exclusion:** Utilizes the semaphore to prevent race conditions during the global counter update, minimizing kernel overhead by updating per-chunk rather than per-byte.
* **Asynchronous Monitoring:** Utilizes signal handling (`SIGINT`, `SIGCHLD`) with `sigsuspend()` to safely read and print the running total from shared memory upon receiving a termination signal from the user.

---

## Compilation
A unified `Makefile` is not provided. Run the command `make` to compile all executables in each part{1,2,3} directory producing (`mmap`,`mandel_sem`, `mandel_no-sem`, `pfork`).

## Execution & Usage:

Part 2 (Mandelbrot):

`./mandel_sem <num_processes>`
`./mandel_nosem <num_processes>`

Part 3 (Pfork):

`./pfork <input_file> <output_file> <target_character>`

## Cleanup

To remove all compiled object files and executables:

`make clean`





