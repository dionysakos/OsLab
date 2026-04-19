#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>
#include <termios.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <poll.h>
#include "utils.h"

int main(int argc, char** argv) {
    if (argc != 4) check(-1, "Usage error\n");

    int ftod[2], dtof[2]; 
    check(pipe(ftod), "Error pipe ftod\n");
    check(pipe(dtof), "Error pipe dtof\n");

    pid_t d_pid = fork();
    check(d_pid, "Error fork\n");

    if (d_pid == 0) {
        check(close(ftod[1]), "Error close ftod[1]\n");
        check(close(dtof[0]), "Error close dtof[0]\n");

        char in_fd[10], out_fd[10];
        snprintf(in_fd, 10, "%d", ftod[0]);
        snprintf(out_fd, 10, "%d", dtof[1]);

        char *params[] = {"./dispatcher", argv[1], argv[2], argv[3], in_fd, out_fd, NULL};
        char *env[] = {NULL};
        execve("./dispatcher", params, env);
        check(-1, "Execve error\n");
    }

    check(close(ftod[0]), "Error close ftod[0]\n");
    check(close(dtof[1]), "Error close dtof[1]\n");

    char input, out_b[64], in_b[64];
    int p, f, w;

    sys_print("Command Menu: [+] add, [-] remove, [i] info, [q] quit\n> ");

    struct pollfd fds[2];
    fds[0].fd = 0; 
    fds[0].events = POLLIN;
    fds[1].fd = dtof[0];   
    fds[1].events = POLLIN;

    while (1) {
        int answer = poll(fds, 2, -1);
        if (answer < 0) continue;

        if (fds[0].revents & (POLLIN | POLLHUP | POLLERR)) {
            ssize_t rr = read(0, &input, 1);
            if (rr <= 0) break;
            
            check(tcflush(0, TCIFLUSH), "Error flushing stdin\n");
            
            if (input == '\n') {
                sys_print("> ");
                continue;
            }

            if (input == '+' || input == '-') {
                memset(out_b, ' ', 64); 
                out_b[0] = input;
                check(writes(ftod[1], out_b, 64), "Error writing to dispatcher\n");
                sys_print("> ");
            }
            else if (input == 'i') {
                if (kill(d_pid, SIGUSR1) < 0) break;
            }
            else if (input == 'q') {
                break;
            }
            else {
                sys_print("> ");
            }
        }

        if (fds[1].revents & (POLLIN | POLLHUP | POLLERR)) {
            ssize_t r = reads(dtof[0], in_b, 64);
            
            if (r > 0) {
                sscanf(in_b, "%3d%10d%2d", &p, &f, &w);
                char prnt[128];
                if(p<100){
                int n = snprintf(prnt, sizeof(prnt), "[STATUS] Progress: %d%% | Found: %d | Workers: %d\n> ", p, f, w);
                check(writes(1, prnt, n), "Error at stdout\n");
                }
                if (p >= 100) {
                    char prnt[128];
                    sys_print("[DONE] Search finished successfully 100%!\n");
                    int n = snprintf(prnt, sizeof(prnt), "[STATUS] Found: %d \n> ", f);
                    check(writes(1, prnt, n), "Error at stdout\n");
                    break;
            }
            }
            else {
                sys_print("[INFO] Dispatcher closed\n");
                break;
            }
        }
    }

    kill(d_pid, SIGTERM); 
    waitpid(d_pid, NULL, 0); 
    sys_print("Bye\n");
    return 0;
}


