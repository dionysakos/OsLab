#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <poll.h>
#include <signal.h>
#include "utils.h"
#include "disp_types.h"

#define MAX_WORKERS 64
#define CHUNK 1024

Worker workers[MAX_WORKERS];
int worker_busy[MAX_WORKERS];
Task current_task[MAX_WORKERS];

Task failed_tasks[MAX_WORKERS];
int failed_count = 0;

JobInfo job;
off_t current = 0;
int active_workers=0;
int total_found = 0;
off_t total_processed=0;

volatile sig_atomic_t info_req = 0;

volatile sig_atomic_t terminate_dispatcher = 0;

void sigterm_handler(int signum) {
    terminate_dispatcher = 1;
}

void sigusr1_handler(int signum){
    info_req=1;
}

volatile sig_atomic_t child_died = 0;

void sigchld_handler(int signum){
    child_died = 1;
}

void spawn(int index){
    int dtow[2],wtod[2];
    check(pipe(dtow),"Error at pipe dtow\n");
    check(pipe(wtod),"Error at pipe wtod\n");

    pid_t pid = fork();
    check(pid, "Worker fork error\n");

    if(pid==0){
        check(close(dtow[1]),"Error at closing dtow[1]\n");
        check(close(wtod[0]),"Error at closing wtod[0]\n");
        char in_fd[10],out_fd[10];
        snprintf(in_fd,10,"%d",dtow[0]);
        snprintf(out_fd,10,"%d",wtod[1]);
        char target_s[2] = {job.target,'\0'};
        char *params[] = {"./worker",job.filename,target_s,in_fd,out_fd,NULL};
        char *env[]  = {NULL};
        execve("./worker",params,env);
        check(-1, "Error at execve\n");
    }
    check(close(dtow[0]),"Error at closing dtow[1]\n");
    check(close(wtod[1]),"Error at closing dtow[1]\n");
    workers[index].pid = pid;
    workers[index].fd_send = dtow[1];
    workers[index].fd_receive = wtod[0];
    workers[index].is_active = 1;
    worker_busy[index]=0;
    active_workers++;
}

int main(int argc, char **argv){
    if(argc<6) check(-1,"Usage: ./dispatcher <file> <char> <init_w> <in_fd> <out_fd>\n");

    strncpy(job.filename,argv[1],255);
    job.target = argv[2][0];

    int init_workers = atoi(argv[3]);
    int in_fd = atoi(argv[4]);
    int out_fd = atoi(argv[5]);

    struct stat buff;
    check(stat(job.filename,&buff),"Error at stat\n");
    job.size = buff.st_size;
    
    struct sigaction sigusr1_sa;
    sigset_t sigusr1_mask;
    sigusr1_sa.sa_handler = sigusr1_handler;
    sigemptyset(&sigusr1_mask);
    sigusr1_sa.sa_mask = sigusr1_mask;
    sigusr1_sa.sa_flags =  SA_RESTART;
    check(sigaction(SIGUSR1,&sigusr1_sa,NULL),"Error at sigaction for SIGUSR1\n");

    struct sigaction sigchld_sa;
    sigset_t sigchld_mask;
    sigemptyset(&sigchld_mask);
    sigchld_sa.sa_handler = sigchld_handler;
    sigchld_sa.sa_mask = sigchld_mask;
    sigchld_sa.sa_flags = SA_RESTART| SA_NOCLDSTOP;
    check(sigaction(SIGCHLD,&sigchld_sa,NULL),"Error at sigaction for SIGCHLD\n");

    struct sigaction sigterm_sa;
    sigset_t sigterm_mask;
    sigemptyset(&sigterm_mask);
    sigterm_sa.sa_handler = sigterm_handler;
    sigterm_sa.sa_mask = sigterm_mask;
    sigterm_sa.sa_flags = 0;    
    check(sigaction(SIGTERM, &sigterm_sa, NULL), "Error at sigaction for SIGTERM\n");

    for(int i=0;i<MAX_WORKERS;++i) workers[i].is_active = 0; 
    for(int i=0;i<init_workers;++i) spawn(i);

    struct pollfd fds[1+MAX_WORKERS];   
    while(1){
        if (active_workers == 0 || terminate_dispatcher == 1) break;

        for(int i=0;i<MAX_WORKERS;++i){
            if(workers[i].is_active && !worker_busy[i]){
                Task t;
                if (failed_count > 0) {
                    failed_count--;
                    t = failed_tasks[failed_count];
                } 
                else if (current < job.size) {
                    t.start = current;
                    t.size = CHUNK;
                    t.quit = 0;
                    if(current+CHUNK > job.size) t.size = job.size - current;
                    current += t.size;
                } 
                else {
                    continue;
                }

                check(writes(workers[i].fd_send,&t,sizeof(Task)),"Error at sending Task to a worker\n");
                current_task[i]=t;
                worker_busy[i] = 1;
            }
        }

        if(info_req==1){
            char resp[MSG_SIZE];
            int progress = (job.size>0)? (int)((total_processed*100)/job.size) : 0;
            int n = snprintf(resp, sizeof(resp), "%03d%010d%02d", progress, total_found, active_workers);
            check(n, "Error at snprintf\n");
            check(writes(out_fd,resp,MSG_SIZE),"Error at writing to out_fd = dtof[1]\n");
            info_req = 0;
        }

        if(child_died==1){
            int status;
            pid_t p;
            while((p=waitpid(-1,&status,WNOHANG))>0){
                for(int i=0;i<MAX_WORKERS;++i){
                    if(workers[i].is_active && workers[i].pid == p){
                       check(close(workers[i].fd_send),"Error at closing send pipe with child\n");
                       check(close(workers[i].fd_receive),"Error at closing receive pipe with child\n");
                       if(worker_busy[i]){
                           failed_tasks[failed_count++] = current_task[i];
                       }
                           workers[i].is_active = 0;
                           active_workers--;
                           spawn(i);
                           break;
                    }
                }
            }
            child_died = 0;
        }
        
        fds[0].fd = in_fd;
        fds[0].events = POLLIN;

        int nfds = 1;

        int poll_to_workers[MAX_WORKERS+1];

        for(int i=0;i<MAX_WORKERS;++i){
            if(workers[i].is_active == 1){
                fds[nfds].fd = workers[i].fd_receive;
                fds[nfds].events = POLLIN;
                poll_to_workers[nfds] = i;
                nfds++;
            }
        }

        int poll_res = poll(fds,nfds,-1);
        if(poll_res<0) continue;

        if(fds[0].revents & POLLIN){
            char cmd_buf[MSG_SIZE];
            ssize_t rrcnt = reads(in_fd,cmd_buf,MSG_SIZE);
            check(rrcnt,"Error reading drom ftod[0]\n");
            if(rrcnt>0){
                char cmd = cmd_buf[0];

                if(cmd=='+' && active_workers<MAX_WORKERS){
                    for(int i=0;i<MAX_WORKERS;++i){
                        if(!workers[i].is_active){
                            spawn(i);break;
                        }
                    }
                }
                else if(cmd=='-' && active_workers>0){
                    for(int i = MAX_WORKERS-1;i>=0;--i){
                        if(workers[i].is_active){
                            Task q = {0,0,1};
                            check(writes(workers[i].fd_send,&q,sizeof(Task)),"Error at sending quit task");

                            if(worker_busy[i]){
                                failed_tasks[failed_count++] = current_task[i];
                            }
                            workers[i].is_active = 0;
                            active_workers--;
                            break;
                        }
                    }
                }
            }
       }
        
        for(int j=1;j<nfds;++j){
            if(fds[j].revents & POLLIN){
                int worker_i = poll_to_workers[j];
                int cnt_res;
                ssize_t r_cnt = reads(workers[worker_i].fd_receive,&cnt_res,sizeof(int));
                check(r_cnt,"Error at reading results from worker\n");
                if(r_cnt>0){
                    total_found += cnt_res;
                    total_processed += current_task[worker_i].size;
                    worker_busy[worker_i] = 0;
                }
            }
        }
        
        if (job.size > 0 && total_processed >= job.size) {
            char resp[MSG_SIZE];
            int n = snprintf(resp, sizeof(resp), "%03d%010d%02d", 100, total_found, active_workers);
            check(n, "Error snprintf\n");
            check(writes(out_fd, resp, MSG_SIZE), "Error writing to out_fd\n");
            break;
        }
    }

    for (int i = 0; i < MAX_WORKERS; ++i) {
        if (workers[i].is_active) {
            Task q = {0, 0, 1};
            writes(workers[i].fd_send, &q, sizeof(Task));
            close(workers[i].fd_send);
            close(workers[i].fd_receive);
        }
    }

    return 0;
}


