#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "utils.h"

int main(int argc,char* argv[]){
    if(argc!=4 || strlen(argv[3])!= 1){
        check(-1,"invalid input\n");
    }
    pid_t p;
    p = fork();
    check(p,"error at fork\n");
    if(p==0){
        char *param[]={"a1.1-C",argv[1],argv[2],argv[3],NULL};
        char *env[] = {NULL};
        execve("../meros1/char-count-with_c_lib/a1.1-C",param,env);
        // if after that the next statements are  executed 
        // there is an error occured in execve!
        check(-1,"Error at execve\n");
    }
    else{
       int status;
       pid_t w = wait(&status);
       check(w,"error at waiting\n");
       if(WIFEXITED(status)){
           char msg[] = "Child returned normally\n";
           int wr =  writes(1,msg,strlen(msg));
           check(wr,"Error at stdout\n");
       }
       else check(-1,"child did not return normally\n");
    }
    return 0;
}


