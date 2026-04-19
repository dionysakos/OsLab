#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "utils.h"

int main(void){
    pid_t p;
    int x = 100;
    p = fork();
    check(p,"Error at fork\n");
    if(p==0){
        x+=50;
        char msg[] = "Hello World! I am the child  and the variable x is: %d\n";
        char str[200];
        int n =snprintf(str,sizeof(str),msg,x);
        if(n<0) _exit(1);
        ssize_t wcnt = writes(1,str,n);
        check(wcnt,"Error at stdout\n");
        _exit(0);
    }
    else{
        x+=20;
       char msg[] = "I am the parent and the variable x is: %d \n";
       char str[200];
       int n = snprintf(str,sizeof(str),msg,x);
       if(n<0) _exit(1);
       ssize_t wcnt = writes(1,str,n);
       check(wcnt,"Error at stdout\n");
       int status;
       pid_t  w = wait(&status);
       check(w,"Error at waiting\n");
       if(WIFEXITED(status)){
          char msg[] = "Child returned normally\n";
          int wr = writes(1,msg,strlen(msg));
          check(wr,"Error at writing\n");
       }
       else check(-1,"child exited not normally\n");
    }
    return 0;
}
