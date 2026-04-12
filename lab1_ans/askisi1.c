#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "utils.h"

int main(void){
    pid_t p;
    p = fork();
    check(p,"Error at fork!\n");
    if(p==0){
        pid_t pid = getpid();
        pid_t ppid = getppid();
        char msg[] = "Hello World! I am the child with pid: %d , while my parent has pid: %d \n";
        char str[200];
        int n = snprintf(str,sizeof(str),msg,pid,ppid);
        if(n<0) _exit(1);
        ssize_t wcnt = writes(1,str,n);
        check(wcnt,"Error at stdout");
        _exit(0);
    }
    else{
       pid_t cpid = p;
       char msg[] = "I am the parent of a child which has pid: %d \n";
       char str[200];
       int n = snprintf(str,sizeof(str),msg,cpid);
       if(n<0) _exit(1);
       ssize_t wcnt = writes(1,str,n);
       check(wcnt,"Error at stdout");
       int status;
       pid_t w = wait(&status);
       check(w,"Error at waiting\n");
       if(WIFEXITED(status)){
           char mess[] = "child exited normally\n";
           int wr = writes(1,mess,strlen(mess));
           check(wr,"error at stdout\n");
       }
       else check(-1,"child did not exit normally\n");
    }
    return 0;
}
