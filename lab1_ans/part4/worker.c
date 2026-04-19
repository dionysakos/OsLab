#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include "utils.h"
#include "disp_types.h"
#include <signal.h>

#define BUFF_SIZE 1024

int main(int argc, char *argv[]) {
    if (argc < 5) check(-1,"Error at arguments for worker\n");

    int in_fd = atoi(argv[3]), out_fd = atoi(argv[4]);
    char target = argv[2][0];
    int f_fd = open(argv[1], O_RDONLY); //we open the file in each worker like meros3
    check(f_fd, "Worker file open error\n");

    Task t;
    char buf[BUFF_SIZE];
   //  Worker only take orders from Dispatcher
    signal(SIGINT,SIG_IGN);
    signal(SIGQUIT,SIG_IGN);
    signal(SIGTSTP,SIG_IGN);


    while(1) {
        // Wait for a Task t  from the Dispatcher
        ssize_t r = reads(in_fd, &t, sizeof(Task));
        if(r==0 || t.quit) break;
        check(r,"Error at reading from Dispatcher to worker pipe\n"); 

        check(lseek(f_fd, t.start, SEEK_SET), "Worker lseek error\n");
        
        int cnt = 0;
        size_t bytes_left = t.size;
        while(bytes_left > 0) {
            ssize_t rcnt = read(f_fd, buf, (bytes_left > BUFF_SIZE) ? BUFF_SIZE : bytes_left);
            check(rcnt,"Error at reading from file\n");
            if(rcnt == 0) break;
            for(int i=0; i<rcnt; ++i) {
                if(buf[i] == target) cnt++;
            }
            bytes_left -= rcnt;
            usleep(610000);
        }
        
        // Report result back to Dispatcher
        check(writes(out_fd, &cnt, sizeof(int)), "Worker write result error\n");
    }
    
    close(f_fd);
    return 0;
}
