/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 * 
 * Dionysis Katsetis < el23005
 * Stefanos Kargas   < el23059
 * 
 * Sychronized and parallelized version of the original mandel.c program, using Shared Memory IPC between processes.
 * 
 * OS-LAB-3, ECE, NTUA
 * 
 *  Athens, 2026
 *  
 */
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/wait.h>
#include "mandel-lib.h"
#include <ctype.h>


#define MANDEL_MAX_ITERATION 100000
#define die(msg) \
	do { perror(msg); exit(1); } while (0)
#if defined(SYNC_SEM) ^ defined(SYNC_NO_SEM) == 0
#error You must #define exactly one of SYNC_SEM or SYNC_NO_SEM.
#endif
#if defined(SYNC_SEM)
# define USE_SEM 1
#include <semaphore.h>
sem_t *sems;
#else
int *shared_buffer;
#define USE_SEM 0
#endif
int NPROCS = 3; // we will get them from argv[1] this is default value
/*
 * Output at the terminal is is x_chars wide by y_chars long
*/
int y_chars = 50;
int x_chars = 90;
/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin)
*/
double xmin = -1.8, xmax = 1.0;
double ymin = -1.0, ymax = 1.0;
	
/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;
/*
 * This function computes a line of output
 * as an array of x_char color values.
 */
void compute_mandel_line(int line, int color_val[])
{
	/*
	 * x and y traverse the complex plane.
	 */
	double x, y;
	int n;
	int val;
	/* Find out the y value corresponding to this line */
	y = ymax - ystep * line;
	/* and iterate for all points on this line */
	for (x = xmin, n = 0; n < x_chars; x+= xstep, n++) {
		/* Compute the point's color value */
		val = mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
		if (val > 255)
			val = 255;
		/* And store it in the color_val[] array */
		val = xterm_color(val);
		color_val[n] = val;
	}
}
/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
	int i;
	
	char point ='@';
	char newline='\n';
	for (i = 0; i < x_chars; i++) {
		/* Set the current color, then output the point */
		set_xterm_color(fd, color_val[i]);
		if (write(fd, &point, 1) != 1) {
			perror("compute_and_output_mandel_line: write point");
			exit(1);
		}
	}
	/* Now that the line is done, output a newline character */
	if (write(fd, &newline, 1) != 1) {
		perror("compute_and_output_mandel_line: write newline");
		exit(1);
	}
}
void child(void *arg){
	int i = (int)(long)arg; // Process logical ID 
	for (int line = i; line < y_chars; line += NPROCS) {
		#if USE_SEM
			int color_val[x_chars];
			compute_mandel_line(line, color_val);
			sem_wait(&sems[i]);                  
			output_mandel_line(1, color_val);    
			sem_post(&sems[(i + 1) % NPROCS]);  
		#else
			compute_mandel_line(line, &shared_buffer[line * x_chars]);
		#endif					
			}
}
void parent(){
	for (int i = 0; i < NPROCS; i++) {
        if (wait(NULL) < 0) die("wait");
    }
    #if !USE_SEM
    	for (int line = 0; line < y_chars; line++) {
        output_mandel_line(1, &shared_buffer[line * x_chars]);
    	}
	#endif
}
void sigint_handler(int signum){
	reset_xterm_color(1);
	_exit(1);
}
void *create_shared_memory_area(unsigned int numbytes)
{
	int pages;
	void *addr;
	if (numbytes == 0) {
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}
	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;
	/* Create a shared, anonymous mapping for this number of pages */
	/*
     * CREATION OF A ANONYMOUS MAPPING:
     */
	addr = mmap(NULL,pages*sysconf(_SC_PAGE_SIZE),PROT_READ|PROT_WRITE,MAP_SHARED|MAP_ANONYMOUS,-1,0);
    if(addr == MAP_FAILED) die("mmap share");    
	return addr;
}
void destroy_shared_memory_area(void *addr, unsigned int numbytes) {
	int pages;
	if (numbytes == 0) {
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}
    
    if (addr == NULL) die("called for null ptr");   
	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;
	if (munmap(addr, pages * sysconf(_SC_PAGE_SIZE)) == -1) {
		perror("destroy_shared_memory_area: munmap failed");
		exit(1);
	}
}
int main(int argc, char **argv)
{
	if (argc != 2 ) { fprintf(stderr, "Usage: %s <num_processes>\n", argv[0]); exit(1); }	
	for (int i = 0; argv[1][i] != '\0'; i++) {
        if (!isdigit(argv[1][i])) {
            fprintf(stderr, "Error: '%s' is not a valid positive integer.\n", argv[1]);
            exit(1);
        }
    }
	struct sigaction sigint_sa;
	sigint_sa.sa_handler = sigint_handler;
	sigset_t mask;
	sigemptyset(&mask);
	sigint_sa.sa_mask = mask;
	sigint_sa.sa_flags = 0;
	int s = sigaction(SIGINT, &sigint_sa, NULL);
	if (s == -1)  die("sigaction");
	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;
	
	NPROCS = atoi(argv[1]);
	if(NPROCS <= 0) {fprintf(stderr, "invalid number of processes\n"); exit(1);}
	#if USE_SEM
		sems = (sem_t *)create_shared_memory_area(NPROCS * sizeof(sem_t));
		if (sem_init(&sems[0], 1, 1) < 0) die("sem_init");
		for (int i = 1; i < NPROCS; ++i) {
		if (sem_init(&sems[i], 1, 0) < 0) die("sem_init");
	}
	#else
	shared_buffer = (int *)create_shared_memory_area(y_chars * x_chars * sizeof(int));
	#endif
	for (int i = 0; i < NPROCS; i++) {
		pid_t pid = fork();
		if (pid < 0) die("fork");
		else if (pid == 0) {
			child((void *)(long)i);
			exit(0);
		}
	}
	parent();
	#if USE_SEM
	for (int i = 0; i < NPROCS; i++) {
		sem_destroy(&sems[i]);
	}
	destroy_shared_memory_area(sems, NPROCS * sizeof(sem_t));	
	#else
		destroy_shared_memory_area(shared_buffer, y_chars * x_chars * sizeof(int));
	#endif
	reset_xterm_color(1); 
	return 0;
}