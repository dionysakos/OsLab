#include "utils.h"
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

ssize_t writes(int fd,const void* msg,size_t len){
    ssize_t wcnt;
    size_t idx = 0;
    const char* ptr = (const char*)msg;
    do{
        wcnt = write(fd,ptr+idx,len-idx);
        if(wcnt<0){
           if (errno == EINTR) continue;
           return -1;
        }
        idx+=wcnt;
    } while(idx<len);
    return len;
}
void check(ssize_t ret, const char* emsg){
    if(ret<0){
        size_t len = strlen(emsg);
        writes(2,emsg,len); // after that exit follows so we dont have to check if this fails
        _exit(1);
    }
}

ssize_t reads(int fd, void* buf, size_t len){
    ssize_t rcnt;
    size_t idx = 0;
    char* ptr = (char*)buf;
    do {
        rcnt = read(fd, ptr + idx, len - idx);
        if (rcnt == 0) return idx;
        if (rcnt < 0){
           if (errno == EINTR) continue;
           return -1;
        }  
        idx += rcnt;
    } while (idx < len);
    return len;
}

void sys_print(const char* msg){
   check(writes(1,msg,strlen(msg)),"Error at stdout\n");
}   
 
