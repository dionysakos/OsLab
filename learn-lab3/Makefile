CC ?= gcc
CFLAGS ?= -O2 -Wall -Wextra -std=c11

all: fault_demo fork_mmap

fault_demo: fault_demo.c
	$(CC) $(CFLAGS) -o $@ $<

pagemap_two_phase: fork_mmap.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f fault_demo fork_mmap
