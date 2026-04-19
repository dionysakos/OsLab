#ifndef UTILS_H
#define UTILS_H
#include <sys/types.h>

void check(ssize_t ret, const char *emsg);
void sys_print(const char *msg);
ssize_t writes(int fd,const void* msg, size_t len);
ssize_t reads(int fd, void* buff,size_t len);
#endif
