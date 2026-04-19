#include "utils.h"
#include <stdio.h>   
#include <unistd.h> 
#include <pthread.h>
#include <stdlib.h>



void check(int res, const char* msg){
    if(res==-1){
        perror(msg);
        _exit(0);
    }
}


int safe_atoi(char *s, int *val)
{
	long l;
	char *endp;

	l = strtol(s, &endp, 10);
	if (s != endp && *endp == '\0') { // check if at least one digit was read and if the whole string converted to a number 
		*val = l;
		return 0;
	} else
		return -1;
}

void *safe_malloc(size_t size)
{
	void *p;

	if ((p = malloc(size)) == NULL) {
		fprintf(stderr, "Out of memory, failed to allocate %zd bytes\n",
			size);
		exit(1);
	}

	return p;
}

void usage(char *argv0)
{
	fprintf(stderr, "Usage: %s thread_count \n\n"
		"Exactly 1 argument required:\n"
		"    thread_count: The number of threads to create.\n",
		argv0);
	_exit(1);
}