#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include "utils.h"
#define buff_size 1024

int main(int argc, char *argv[]){
    if(argc!=4 || strlen(argv[3]) != 1){
        check(-1,"Invalid input! The prototype must be:  ./charcnt <input> <output> <char>\n");
    }
    int cnt = 0;
    int fdr = open(argv[1],O_RDONLY);
    check(fdr,"Error: Cannot open input file\n");      
    int fdw = open(argv[2],O_TRUNC|O_WRONLY|O_CREAT,S_IRUSR|S_IWUSR);
    check(fdw,"Error: Cannot open output file\n");
    char target = argv[3][0];
    char buff[buff_size];
    ssize_t rcnt;
    while((rcnt=read(fdr,buff,buff_size))>0){
        for(size_t i=0;i<rcnt;++i){
            if(buff[i]==target) cnt++;
    }
    }
    check(rcnt,"Cannot read from input file\n");
    close(fdr);
    char str[20];
    int n = snprintf(str,sizeof(str),"%d\n",cnt); // up to sizeof(str) snprintf writes to str
    ssize_t wcnt = writes(fdw,str,n);
    check(wcnt,"Error: Cannot write in output file\n");
    close(fdw);
    return 0;
}
