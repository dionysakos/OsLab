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
#include <sys/wait.h>

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

static void wait_for_advance(const char *phase_name) {
	printf("STATUS=%s\n", phase_name);
	printf("[VA inspect] RUN cat /proc/%d/maps or\n", getpid());
	printf("[PA inspect] RUN python3 ./pagemap_inspect.py %d <VA address>\n", getpid());
	printf("ACTION=inspect [VA or PA] now and then continue with: kill -USR1 %ld\n", (long)getpid());
	fflush(stdout);
	advance_flag = 0;
	while (!advance_flag && !stop_flag) pause();
}
int main() {
	page_size = sysconf(_SC_PAGESIZE);
	if (page_size <= 0) die("sysconf(_SC_PAGESIZE)");

	char *private_map = mmap(NULL, page_size, PROT_READ | PROT_WRITE, 
			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	strcpy(private_map, "I am the parent's private mapping");

	char *shared_map = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	strcpy(shared_map, "I'm the parents shared mapping");

	printf("[PARENT] PID %d\n", getpid());
	printf("[PARENT] Initial Private: %s (@ %p)\n", private_map, (void*)private_map);
	printf("[PARENT] Initial Shared:  %s (@ %p)\n\n", shared_map, (void*)shared_map);

	struct sigaction sa;
	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = on_signal;
	sigaction(SIGINT, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);
	sigaction(SIGUSR1, &sa, NULL);

	wait_for_advance("[PARENT] Before FORK. Inspect PARENT PA/VA now.");
	pid_t pid = fork();
	if (pid < 0) {
		perror("fork");
		return 1;
	}

	if (pid == 0){
		printf("[CHILD]  PID %d\n", getpid());
		printf("[CHILD]  Inherited Private: %s (@ %p)\n", private_map, (void*)private_map);
		printf("[CHILD]  Inherited Shared:  %s (@ %p)\n", shared_map, (void*)shared_map);
		printf("\n[CHILD]  Updating mappings now...\n");
		strcpy(private_map, "I am the child's private mapping");
		strcpy(shared_map, "I'm the child's shared mapping");
		printf("[CHILD]  Updated Private:   %s (@ %p)\n", private_map, (void*)private_map);
		printf("[CHILD]  Updated Shared:    %s (@ %p)\n", shared_map, (void*)shared_map);
		wait_for_advance("Child updated. Inspect CHILD PA/VA now.");
		printf("[CHILD]  Exiting...\n\n");
		exit(0);
	} else {
		// parent
		wait(NULL);
		printf("[PARENT] Final Private: %s (@ %p)\n", private_map, (void*)private_map);
		printf("[PARENT] Final Shared:  %s (@ %p)\n", shared_map, (void*)shared_map);
		wait_for_advance("Child exited. Inspect PARENT physical addresses now.");
		exit(0);
	}	

}
