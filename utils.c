#include "utils.h"
#include <stdio.h>   
#include <unistd.h> 

void check(int res, const char* msg){
    if(res==-1){
        perror(msg);
        _exit(0);
    }
}