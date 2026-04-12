#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <signal.h> 
#include "utils.h"
#define buff_size 1024
#define P 4

volatile sig_atomic_t  active_children=0;
volatile sig_atomic_t sigint_flag = 0;
volatile sig_atomic_t exited_child=0;

void sigint_handler(int signal_num){
    sigint_flag = -1;
}

volatile  sig_atomic_t  child_exit_code[P];

void sigchld_handler(int signal_num){
   int status;
   while(waitpid(-1,&status,WNOHANG)>0){
       if(exited_child<P) {
           if(WIFEXITED(status)){
           child_exit_code[exited_child] = WEXITSTATUS(status);
           }
           else child_exit_code[exited_child] = -1;
           exited_child++;
       }
      active_children--; 
   }
}
int main(int argc,char* argv[]){
    if(argc!=4 || strlen(argv[3])!=1) check(-1,"Invalid input\n");
    char target = argv[3][0];

    //-------Handling the sigint-------//
    struct sigaction sa_sigint;
    sigset_t sigint_mask;
    sa_sigint.sa_handler = sigint_handler;
    sigemptyset(&sigint_mask);
    sa_sigint.sa_mask = sigint_mask; // OS adds automatically the signal we want to handle for blocking in our mymask
    sa_sigint.sa_flags = SA_RESTART; // We dont want other possible syscalls running to be blocked while handler is running
    int tell_os_sigint = sigaction(SIGINT,&sa_sigint,NULL);
    check(tell_os_sigint,"Error at sigaction for sigint\n");
    //------------------------------------//
    
    //-----------Handling sigchld----------//
    struct sigaction sa_sigchld;
    sigset_t sigchld_mask;
    sa_sigchld.sa_handler = sigchld_handler;
    sigemptyset(&sigchld_mask);
    sa_sigchld.sa_mask = sigchld_mask;
    sa_sigchld.sa_flags = SA_RESTART;
    int tell_os_sigchld = sigaction(SIGCHLD,&sa_sigchld,NULL);
    check(tell_os_sigchld,"Error at sigaction for sigchld\n");
    //-----------------------------------------------------//

    struct stat stat_buff;
    check(stat(argv[1],&stat_buff),"Error at stat or the input file just does not exist in this directory \n");
    off_t size_r = stat_buff.st_size;
    off_t chunk  = size_r/P;
    //--------------------------------------//

    int fdw = open(argv[2],O_CREAT|O_WRONLY|O_TRUNC,S_IRUSR|S_IWUSR);
    check(fdw,"Error at opening/creating output.txt\n");

    int fd[2];
    check(pipe(fd),"Error at pipe()\n");
    
    for(int j=0;j<P;++j){
        active_children++;
        pid_t p = fork();
        check(p,"Error at fork()\n");
        if(p==0){
            int fdr = open(argv[1],O_RDONLY);
            check(fdr,"Error at opening the input file\n");
            off_t start = j*chunk;
            off_t end;
            if(j==P-1){
                end = size_r;
            }
            else end = start+chunk;
            check(lseek(fdr,start,SEEK_SET),"Error at lseek\n");
            signal(SIGINT,SIG_IGN); // child has to ignore the SIGINT signal
            check(close(fd[0]),"Error at closing fd[0] by a child\n");
            check(close(fdw),"Error at closing fdw by a child\n");
            ssize_t rcnt;
            int cnt=0;
            char buff[buff_size];
            off_t current = start;
            while(current<end){
                ssize_t bytes_left = buff_size;
                if(bytes_left+current>end) bytes_left = end-current;
                rcnt = read(fdr,buff,bytes_left);
                if(rcnt==0) break;
                check(rcnt,"Error at reading from input file\n");
                for(ssize_t i=0;i<rcnt;++i){
                    if(target==buff[i]) cnt++;
                }
                current += rcnt;
                sleep(j*2+3);
            }
        check(writes(fd[1],&cnt,sizeof(int)),"Error at writing in fd[1]\n");
        check(close(fd[1]),"Error at closing fd[1] by a child\n");
        check(close(fdr),"Error at closing fdr by a child\n");
        _exit(0);
    }
    }
    check(close(fd[1]),"Error at closing fd[1] by the parent\n");

    sigset_t mask,oldmask;
    sigemptyset(&mask);
    sigaddset(&mask,SIGINT);
    sigaddset(&mask,SIGCHLD);
    sigprocmask(SIG_BLOCK,&mask,&oldmask);

    
    
    while(active_children > 0){
        if(sigint_flag == -1 && active_children > 0){
            char msg[100];
            int n = snprintf(msg, sizeof(msg), "There are %d children looking in the file.\n", active_children);
            writes(1, msg, n);
            sigint_flag = 0;
        }
        sigsuspend(&oldmask);
    }

    sigprocmask(SIG_SETMASK,&oldmask,NULL);

    int total = 0;
    for(int i=0;i<P;++i){
        int partial;
        if(child_exit_code[i]==0){
        check(reads(fd[0],&partial,sizeof(int)),"Error at reading from pipe\n");
        total+=partial;
        }
        else{check(-1,"Error, one children returned abnormally\n");}
    }
    check(close(fd[0]),"Error at closing fd[0] by the parent\n");

    char pr[30];
    int len = snprintf(pr,sizeof(pr),"The result is : %d \n",total);
    check(writes(fdw,pr,len),"Error at writing in output file\n");
    check(close(fdw),"Error by closing fdw by the parent\n");
    return 0;
    }

