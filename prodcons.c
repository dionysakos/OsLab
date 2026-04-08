#include <pthread.h>
#include <stdio.h>
#include  "utils.h"
#include <semaphore.h>
#include <fcntl.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>

#define N 10
sem_t *empty, *full, *mutex;
int buffer[N];
int in=0,out=0;

void* prod(void *arg){
    int put=1;
    while(put%20!=0){
        usleep(100000);
        check(sem_wait(empty),"error at sem_wait for empty");
        check(sem_wait(mutex),"error at sem_wait for mutex");
        buffer[in] = rand()%100;
        put = buffer[in];
        printf("put %d\n",put);
        in = (in+1)%N;
        check(sem_post(mutex),"error at sem_post for mutex");
        check(sem_post(full),"error at sem_post for full");
    }
    pthread_exit(NULL);
}

void *cons(void *arg){
    int *item = (int *)malloc(sizeof(int));
    *item=1;
    while(*item%20!=0){
        usleep(200000);
        check(sem_wait(full),"error");
        check(sem_wait(mutex),"error");
        *item = buffer[out];
        printf("got %d\n", *item);
        out = (out+1)%N;
        check(sem_post(mutex),"error");
        check(sem_post(empty),"error");
    }
    pthread_exit(item);
}


int main(){
    srand(time(NULL));
    sem_unlink("/empty"); 
    sem_unlink("/full"); 
    sem_unlink("/mutex");
    void *it;
    empty = sem_open("/empty",O_CREAT,0666,N);
    full = sem_open("/full",O_CREAT,0666,0);
    mutex = sem_open("/mutex",O_CREAT,0666,1);
    pthread_t th[2];
    pthread_create(&th[0],NULL,prod,NULL);
    pthread_create(&th[1],NULL,cons,NULL);
    pthread_join(th[0],NULL);
    pthread_join(th[1],&it);
    printf("item = %d\n",*(int*)it);
    free(it);
    sem_close(empty);
    sem_close(full);
    sem_close(mutex);
    sem_unlink("/empty");
    sem_unlink("/full");
    sem_unlink("/mutex");
    return 0;
}
