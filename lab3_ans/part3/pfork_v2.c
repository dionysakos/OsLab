/*
* Τhis is an upgrade of pfork.c implemented in LAB 1 - Part 3
* We use IPC with shared memory mechanism 
* We achive sunchronization with semaphores over the shared region of data 
*
* Stefanos Kargas 
* Dionysis Katsetis 
*
* OS-LAB-3
* 
*
*Athens, 2026
*
*/



#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <signal.h> 
#include <semaphore.h>
#include <sys/mman.h>


#include "utils.h"


#define buff_size 1024
#define P 4

struct child_info{
    int id;
    int target;
    off_t start;
    off_t end;
    char *filename;
};

typedef struct {
    sem_t mutex;
    int total_count;
} shared_data_t;

shared_data_t *shared;

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


void child(struct child_info *child_task){

    int fdr = open(child_task->filename,O_RDONLY);
    check(fdr,"Error at opening the input file\n");
    check(lseek(fdr,child_task->start,SEEK_SET),"Error at lseek\n");
    signal(SIGINT,SIG_IGN); // child has to ignore the SIGINT signal
    
    int cnt;
    ssize_t rcnt;
    char buff[buff_size];
    off_t current = child_task->start;

    while(current<child_task->end){

        ssize_t bytes_left = buff_size;

        if(bytes_left+current>child_task->end) bytes_left = child_task->end-current;
        rcnt = read(fdr,buff,bytes_left);
        if(rcnt==0) break;

        check(rcnt,"Error at reading from input file\n");

        cnt=0;

        for(ssize_t i=0;i<rcnt;++i){
            if(child_task->target==buff[i]) cnt++;
        }

        sem_wait(&shared->mutex);
        shared->total_count += cnt;
        sem_post(&shared->mutex);

        current += rcnt;
        sleep(child_task->id*2+3);

        }

    check(close(fdr),"Error at closing the input file\n");
    _exit(0);
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

    shared = mmap(NULL, sizeof(shared_data_t), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    if (shared == MAP_FAILED) check(-1,"Error at mmap for shared data\n");
    shared->total_count = 0;
    check(sem_init(&shared->mutex,1,1),"sem_init\n");

    for(int j=0;j<P;++j){

        active_children++;
        pid_t p = fork();
        check(p,"Error at fork()\n");
        if(p==0){
            struct child_info child_task;
            child_task.id = j;
            child_task.target = target;
            child_task.start = j*chunk;
            child_task.filename = argv[1];
            if(j==P-1){
            child_task.end = size_r;
        }
        else child_task.end = child_task.start+chunk;
        child(&child_task);
    }
}

    // Parent process

    sigset_t mask,oldmask;
    sigemptyset(&mask);
    sigaddset(&mask,SIGINT);
    sigaddset(&mask,SIGCHLD);
    sigprocmask(SIG_BLOCK,&mask,&oldmask);

    
    while(active_children > 0){
        if(sigint_flag == -1 && active_children > 0){

            sem_wait(&shared->mutex);
            int current_total = shared->total_count;
            sem_post(&shared->mutex);

            char msg[150];
            int n = snprintf(msg, sizeof(msg), "Children active: %d. Target '%c' found %d times so far.\n", active_children, target, current_total);
            writes(1, msg, n);
            
            sigint_flag = 0;
        }
        sigsuspend(&oldmask);
    }

    sigprocmask(SIG_SETMASK,&oldmask,NULL);

    for(int i=0; i<P; ++i){
        if(child_exit_code[i] != 0){
            check(-1,"Error, one child returned abnormally\n");
        }
    }

    char pr[30];
    int len = snprintf(pr,sizeof(pr),"The result is : %d \n",shared->total_count);
    check(writes(fdw,pr,len),"Error at writing in output file\n");
    check(close(fdw),"Error by closing fdw by the parent\n");

    sem_destroy(&shared->mutex);
    check(munmap(shared, sizeof(shared_data_t)),"munmap\n");

     return 0;
    }   

