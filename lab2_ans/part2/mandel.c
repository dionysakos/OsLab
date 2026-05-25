/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 * 
 * 
 * Sychronized and parallelized version of the original mandel.c program, using POSIX threads.
 * With SEMAPHORES & CONDITION VARIABLES
 * 
 * OS-LAB-2, ECE, NTUA
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
#include <pthread.h>
#include <signal.h>



#include "mandel-lib.h"
#include "utils.h"

#define MANDEL_MAX_ITERATION 100000

#define perror_pthread(ret, msg) \
	do { errno = ret; perror(msg); } while (0)

#if defined(SYNC_SEM) ^ defined(SYNC_CV) == 0
#error You must #define exactly one of SYNC_SEM or SYNC_CV.
#endif

#if defined(SYNC_SEM)
# define USE_SEM 1
#else
#define USE_SEM 0
#endif

int NTHREADS = 3; // we will get them from argv[1] this is default value

//synchronization variables

#if USE_SEM
#include <semaphore.h>
sem_t *local_lock;
#else
pthread_mutex_t global_lock;
pthread_cond_t *out;
int turn;
#endif



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

void* worker(void *arg){

	int i;
	thread_i *thr =arg;
	/*
	* A temporary array, used to hold color values for the line being drawn
	*/
	int color_val[x_chars];

	for(i=thr->thrid;i<y_chars;i+=thr->thrcnt){
		compute_mandel_line(i, color_val);
	#if USE_SEM
		sem_wait(&local_lock[thr->thrid]);
		output_mandel_line(1,color_val);
		sem_post(&local_lock[(thr->thrid+1)%thr->thrcnt]);
	#else
		pthread_mutex_lock(&global_lock); // try to acquire lock
		while(turn!=thr->thrid) pthread_cond_wait(&out[thr->thrid],&global_lock); // wait until its my turn, signal and continue model,  we need to check the condition in a loop
		output_mandel_line(1,color_val); //output the result after i was signaled
		turn = (turn+1)%thr->thrcnt; // update turn to the next thread
		pthread_cond_signal(&out[turn]); // signal the next thread that it can proceed
		pthread_mutex_unlock(&global_lock); 

	   /* 
	   	*
		*
	    * The model is signal and continue !!! 
		* This means that after signaling the next thread,
		* we have to release the lock immediately 
		* so the thread that is waiting can acquire it and proceed with 
		* outputting its line 
		*
		* 
		* Design choice:
		* We used an array of condition variables, 
		* one for each thread, to avoid the "thundering herd" problem, 
		* where all waiting threads are woken up (with pthread_cond_broadcast) 
		* and compete for the lock when a signal is sent.
		* By using a separate condition variable for each thread, 
		* we ensure that only the next thread in line is woken up 
		* and can proceed with outputting its line, 
		* while the others remain waiting until their turn comes.
		*
		*
		*/

	#endif
	}
	return NULL;
}

void sigint_handler(int signum){
	reset_xterm_color(1);
	_exit(1);
}

int main(int argc, char **argv)
{

	if(argc!=2)
		usage(argv[0]);
	
	struct sigaction sigint_sa;
	sigint_sa.sa_handler = sigint_handler;
	sigset_t mask;
	sigemptyset(&mask);
	sigint_sa.sa_mask = mask;
	sigint_sa.sa_flags = 0;
	check(sigaction(SIGINT, &sigint_sa, NULL), "sigaction");
	
	
	
	if (safe_atoi(argv[1], &NTHREADS) < 0 || NTHREADS <= 0) {
		fprintf(stderr, "`%s' is not valid for `NTHREADS'\n", argv[1]);
		_exit(1);
	}

	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;
	
	int i, ret;

	#if USE_SEM
		local_lock = safe_malloc(NTHREADS*sizeof(*local_lock));
		for(i=0;i<NTHREADS;++i){
			int init = (i==0)?1:0;
			check(sem_init(&local_lock[i],0,init),"sem_init");
		}	
	#else
		pthread_mutex_init(&global_lock,NULL);
		out = safe_malloc(NTHREADS*sizeof(*out));
		for(int i=0;i<NTHREADS;++i){
			ret = pthread_cond_init(&out[i],NULL);
			if(ret){
				perror_pthread(ret,"pthread_cond_init");
				_exit(1);
			}
		}
		turn = 0;

	#endif
 
	thread_i *workers;
	

	workers = safe_malloc(NTHREADS*sizeof(*workers));
	for(i=0;i<NTHREADS;++i){
		workers[i].thrid = i;
		workers[i].thrcnt = NTHREADS;

		// spawn worker thread

		ret = pthread_create(&workers[i].tid,NULL,worker,&workers[i]);

		if(ret){
			perror_pthread(ret,"pthread_create");
			_exit(1);	
		}
	}
	// wait for worker threads to finish

	for(i=0;i<NTHREADS;++i){
		ret = pthread_join(workers[i].tid,NULL);
		if(ret){
			perror_pthread(ret,"pthread_join");
			_exit(1);	
		}
	}
	reset_xterm_color(1); // reset xterm color before exiting

	#if USE_SEM
		for(i=0;i<NTHREADS;++i){
			check(sem_destroy(&local_lock[i]),"sem_destroy");
		}
		free(local_lock);
	#else
		for(i=0;i<NTHREADS;++i){
			ret = pthread_cond_destroy(&out[i]);
			if(ret){
				perror_pthread(ret,"pthread_cond_destroy");
				_exit(1);
			}
		}
		pthread_mutex_destroy(&global_lock);
		free(out);  
	#endif

	free(workers);

	return 0;
}
