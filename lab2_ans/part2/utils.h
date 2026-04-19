#pragma once
#include <stdlib.h>  
#include <pthread.h> 

void check(int res,const char* msg);

int safe_atoi(char *s, int *val);

void *safe_malloc(size_t size);

typedef struct  {
    pthread_t tid; /* POSIX thread id, as returned by the library */
    int thrid; /* Application-defined thread id */
    int thrcnt;
} thread_i;

void usage(char *argv0);