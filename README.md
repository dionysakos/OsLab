# Operating Systems Lab Projects - ECE, NTUA (2026)

## Overview
This repository contains implementations for the core laboratory units of the "Operating Systems" course at ECE, NTUA. The projects cover process management, Inter-Process Communication (IPC), multithreaded programming, and synchronization mechanisms within a Unix environment.


## LAB 1: Distributed Counting System (Process-Based)
This unit focuses on building a multi-process system to perform parallel text processing with a high degree of reliability.

### Architecture:
* **Frontend:** The user interface utilizing `poll()` for non-blocking I/O.
* **Dispatcher:** The central coordinator that partitions data into chunks and manages worker lifecycles.
* **Workers:** Child processes (`fork`) that execute the character counting logic.


### Technical Features:
* **IPC:** Communication is handled via anonymous Pipes.
* **Fault Tolerance:** The system is resilient to worker failures. If a worker is terminated (`SIGKILL`), the Dispatcher detects the exit via `SIGCHLD`, retrieves the incomplete task from the `current_task` table, and reassigns it to a new worker.
* **Signals:** Robust management of `SIGCHLD` for process monitoring, `SIGINT` for graceful shutdowns & `SIGTERM` for the smooth termination of the app.


## LAB 2: Synchronization & Parallelism (Thread-Based)
This unit marks the transition from heavy processes to lightweight threads (**pthreads**) and shared memory.

### A. simplesync 
A study of thread contention over a shared variable.
* **Problem:** Simultaneous modifications leading to "Lost Updates."
* **Solution 1 (Mutexes):** Software-level mutual exclusion using `pthread_mutex`.
* **Solution 2 (Atomic Ops):** Hardware-level synchronization using GCC atomic built-ins for lock-free performance.

### B. mandel 
Parallel computation of the Mandelbrot Set requiring strict sequential output.
* **Problem:** Multiple threads calculate image lines in parallel, but terminal output must remain ordered (Line 0, then Line 1, etc.).
* **Semaphores:** Implemented a "token-passing" logic using an array of semaphores.
* **Condition Variables:** Utilized an array of Condition Variables to signal specific threads, effectively avoiding the **Thundering Herd** problem.

##  Robust I/O & Error Handling
Common utility functions (found in `utils.{c,h}`) used across all exercises to ensure system stability:

* **`writes` / `reads`:** Wrapper functions (write**safe** & read**safe** )that handle `EINTR` (signal interruptions) and **Partial Reads/Writes** in pipes.
> For LAB 1, across with other useful, safe and checking functions.

* **`perror_pthread`:** A macro designed to map pthread return codes to `errno` so that standard error reporting can be used.
> For LAB 2, across with other useful, safe and checking functions.

## LAB 3: Virtual Memory & Inter-Process Communication (IPC)
This lab explores the Linux virtual memory system and implements advanced IPC mechanisms using shared memory and POSIX semaphores.

* Virtual Memory Inspection: Analyzing process memory maps (/proc/[pid]/maps), understanding mmap() allocations (private, shared, anonymous, and file-backed), and observing low-level OS/hardware mechanisms like Demand Paging and Copy-on-Write (CoW) during fork().
  
* Parallel Mandelbrot: Parallelizing the Mandelbrot set generation using processes instead of threads. It implements two distinct synchronization architectures:
  
> *  With Semaphores (mandel_sem): Synchronizes direct terminal I/O using an array of POSIX semaphores placed in a shared memory region.

> *  Without Semaphores (mandel_nosem): Achieves lock-free parallel computation by mapping a 1D shared memory array into a 2D buffer (Spatial Isolation), utilizing the parent process purely as a synchronization barrier (Fork-Join model) before sequential I/O.

* Concurrent File Processing (pfork): Upgrading the Lab 1 IPC architecture. Multiple child processes scan a file in chunks and update a global counter in shared memory. It protects the critical section with a shared POSIX mutex (sem_t) and handles signals (SIGINT, sigsuspend) for safe, asynchronous status reporting by the parent process.