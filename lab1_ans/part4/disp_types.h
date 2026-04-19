#ifndef DISP_TYPES_H
#define DISP_TYPES_H

#include <sys/types.h>

#define MSG_SIZE 64

typedef struct{
    pid_t pid;
    int fd_send; // send Task to Worker
    int fd_receive; //  receive results from Worker
    off_t start;
    off_t chunk;
    int is_active;
    int found_sofar;
} Worker;

typedef struct{
    char filename[256];
    char target;
    off_t size;
} JobInfo;

typedef struct {
    off_t start;
    size_t size;
    int quit;
} Task;

#endif
