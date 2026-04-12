#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "utils.h"
#define buff_size 1024

int main(int argc, char* argv[]){
    pid_t p;
    if(argc!=4 || strlen(argv[3])!=1){
        check(-1,"Error, invalid input!\n");     
    }
    int cnt = 0;
    int fdo = open(argv[1],O_RDONLY);
    check(fdo,"Error: Cannot open input file\n");  
    int fdw = open(argv[2],O_TRUNC|O_WRONLY|O_CREAT,S_IRUSR|S_IWUSR);
    check(fdw,"Error at opening output file\n");
    p = fork();
    check(p,"Error at fork\n");
    if(p==0){
        close(fdw);
        char target = argv[3][0];
        ssize_t rcnt;
        char buff[buff_size];
        while((rcnt=read(fdo,buff,buff_size))>0){
           for(size_t i=0;i<rcnt;++i){
               if(buff[i]==target) cnt++;
           }
       }
       close(fdo);
       _exit(cnt);
    }
    else{
       int status;
       pid_t w = wait(&status);
       check(w,"Error at waiting\n");
       if(WIFEXITED(status)) cnt = WEXITSTATUS(status);
       else{ check(-1,"Child not terminated normally\n");}
       char pr[10];
       int n = snprintf(pr,sizeof(pr),"%d \n",cnt);
       int wc = writes(fdw,pr,n);
       check(wc,"Error at writing in output.txt");
       close(fdo);
       close(fdw);
    }
    return 0;
}
