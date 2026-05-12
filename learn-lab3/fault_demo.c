#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

static long page_size;

static volatile sig_atomic_t advance_flag = 0;
static volatile sig_atomic_t stop_flag = 0;

static void on_signal(int signo) {
	if (signo == SIGUSR1) {
		advance_flag = 1;
	} else if (signo == SIGINT || signo == SIGTERM) {
		stop_flag = 1;
		advance_flag = 1;
	}
}

static void die(const char *msg) {
	perror(msg);
	exit(EXIT_FAILURE);
}

static void usage(const char *prog) {
	fprintf(stderr,
			"Usage:\n"
			"  %s anon <MiB>\n"
			"  %s brk <bytes> \n",
			prog, prog);
	exit(EXIT_FAILURE);
}

static void wait_for_advance(const char *phase_name) {
	printf("STATUS=%s\n", phase_name);
	printf("[VA inspect] RUN cat /proc/%d/maps or\n", getpid());
	printf("[PA inspect] RUN python3 ./pagemap_inspect.py %d <VA address>\n", getpid());
	printf("ACTION=inspect [VA or PA] now and then continue with: kill -USR1 %ld\n", (long)getpid());
	fflush(stdout);
	advance_flag = 0;
	while (!advance_flag && !stop_flag) pause();
}

static void print_rusage_delta(const struct rusage *before, const struct rusage *after) {
	printf("Minor faults delta : %ld\n", after->ru_minflt - before->ru_minflt);
	printf("Major faults delta : %ld\n", after->ru_majflt - before->ru_majflt);
	printf("Max RSS delta (KiB): %ld\n", after->ru_maxrss - before->ru_maxrss);
}

static void touch_each_page(char *buf, size_t len, int write_mode, volatile uint64_t *sink) {
	for (size_t off = 0; off < len; off += (size_t)page_size) {
		if (write_mode) {
			buf[off] = (char)(off / page_size);
		}
		*sink += (unsigned char)buf[off];
	}
}

char* run_anon(size_t mib) {
	size_t len = mib * 1024UL * 1024UL;
	struct rusage before, after;
	volatile uint64_t sink = 0;

	char *buf = mmap(NULL, len, PROT_READ | PROT_WRITE,
			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (buf == MAP_FAILED) die("mmap anon");
	
	if (getrusage(RUSAGE_SELF, &before) != 0) die("getrusage before");
	touch_each_page(buf, len, 1, &sink);
	if (getrusage(RUSAGE_SELF, &after) != 0) die("getrusage after");

	printf("Mode              : anonymous first-touch\n");
	printf("Size              : %zu MiB\n", mib);
	print_rusage_delta(&before, &after);
	printf("Checksum sink     : %" PRIu64 "\n", sink);

	return buf;
	//munmap(buf, len);
}

static void fill_file(int fd, size_t len) {
	const size_t chunk_sz = 1024 * 1024;
	char *chunk = malloc(chunk_sz);
	if (!chunk) die("malloc chunk");
	memset(chunk, 0x5a, chunk_sz);

	size_t written = 0;
	while (written < len) {
		size_t this_write = chunk_sz;
		if (len - written < this_write) this_write = len - written;
		ssize_t rc = write(fd, chunk, this_write);
		if (rc < 0) die("write");
		written += (size_t)rc;
	}

	if (fsync(fd) != 0) die("fsync");
	free(chunk);
}

char* run_file(size_t mib, const char *path) {
	size_t len = mib * 1024UL * 1024UL;
	struct rusage before, after;
	volatile uint64_t sink = 0;

	int fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
	if (fd < 0) die("open");

	fill_file(fd, len);

	/* Ask kernel to discard file-backed cache for this file. Unprivileged, advisory only. */
	int adv = posix_fadvise(fd, 0, (off_t)len, POSIX_FADV_DONTNEED);
	if (adv != 0) {
		fprintf(stderr, "warning: posix_fadvise(DONTNEED) failed: %s\n", strerror(adv));
	}

	char *buf = mmap(NULL, len, PROT_READ, MAP_PRIVATE, fd, 0);
	if (buf == MAP_FAILED) die("mmap file");

	if (getrusage(RUSAGE_SELF, &before) != 0) die("getrusage before");
	touch_each_page(buf, len, 0, &sink);
	if (getrusage(RUSAGE_SELF, &after) != 0) die("getrusage after");

	printf("Mode              : file-backed mmap read\n");
	printf("Size              : %zu MiB\n", mib);
	printf("Path              : %s\n", path);
	print_rusage_delta(&before, &after);
	printf("Checksum sink     : %" PRIu64 "\n", sink);
	printf("Note              : major faults are likely only if the file pages were really evicted and storage I/O was needed.\n");
	return buf;
	//munmap(buf, len);
	close(fd);
}

void* run_brk(size_t size) {
	printf("\n--- Calling sbrk(%zu bytes) ---\n", size);

	void *allocated_addr = sbrk(size);

	if (allocated_addr == (void *)-1) {
		fprintf(stderr, "sbrk failed: %s\n", strerror(errno));
		return NULL;
	}

	char *ptr = (char *)allocated_addr;
	*ptr = 0; 

	return allocated_addr;
}

int main(int argc, char **argv) {
	page_size = sysconf(_SC_PAGESIZE);
	if (page_size <= 0) die("sysconf(_SC_PAGESIZE)");

	if (argc < 3) usage(argv[0]);

	char *end = NULL;
	errno = 0;
	unsigned long mib = strtoul(argv[2], &end, 10);
	if (errno != 0 || !end || *end != '\0' || mib == 0) usage(argv[0]);

	pid_t my_pid = getpid();
	printf("[PROCESS INFO] PID: %d\n", my_pid);

	struct sigaction sa;
	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = on_signal;
	sigaction(SIGINT, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);
	sigaction(SIGUSR1, &sa, NULL);

	void *initial_break = sbrk(0);
	printf("Initial program break: %p\n", initial_break);    

	wait_for_advance("ready to change virtual memory");

	if (strcmp(argv[1], "anon") == 0) {
		char *start_va = NULL;
		printf("[BEFORE MMAP] mmap start address = %p\n", (void*)start_va);
		start_va = run_anon((size_t)mib);
		printf("[AFTER MMAP] mmap start address = %p\n", (void*)start_va);

		void *current_break = sbrk(0);
		printf("New program break:     %p\n", current_break);
		printf("Memory allocated:      %ld bytes\n", 
				(intptr_t)current_break - (intptr_t)initial_break);

		wait_for_advance("ready to release (MADV_DONTNEED) 1st page of mmaped anon memory");
		madvise(start_va, 4096, MADV_DONTNEED); 
		printf("\nProcess entering infinite sleep (pause).\nInspect VA or PA again and then kill process to exit...\n");
		pause();

		return 0;
	}

	if (strcmp(argv[1], "brk") == 0) {
		void *new_mem = run_brk(mib);

		if (new_mem != NULL) {
			void *current_break = sbrk(0);
			printf("[BRK ADDR] Returned address: %p\n", new_mem);
			printf("New program break:     %p\n", current_break);

			intptr_t diff = (intptr_t)current_break - (intptr_t)initial_break;
			printf("Program break diff:    %ld bytes\n", diff);
		}

		printf("\nProcess entering infinite sleep (pause).\nRUN cat /proc/%d/maps\n", getpid());
		pause();
		return 0;
	}

	if (strcmp(argv[1], "file") == 0) {
		if (argc != 4) usage(argv[0]);
		char *start_va = NULL;
		printf("[BEFORE MMAP] mmap start address = %p\n", (void*)start_va);
		start_va = run_file((size_t)mib, argv[3]);
		printf("[AFTER MMAP] mmap start address = %p\n", (void*)start_va);
		printf("\nProcess entering infinite sleep (pause).\nRUN cat /proc/%d/maps\n", getpid());
		pause();
		size_t len = mib * 1024UL * 1024UL;
		munmap(start_va, len);
		return 0;
	}

	usage(argv[0]);
	return 1;
}

