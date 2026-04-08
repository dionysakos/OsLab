#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

#define N 10

volatile int lock = 0;


void* safe_add(void* arg){
    int *cnt = (int*) arg;
    while(1){
        if(lock==0){ //optimistic check
            if(__sync_bool_compare_and_swap(&lock,0,1)) break;
        }
    }
    (*cnt)++; //critical section
    __sync_lock_release(&lock); 
    pthread_exit(NULL); //exit section
}

void* safe_sub(void* arg){
    int *cnt = (int* )arg;
    while(1){
        if(lock==0){ //optimistic check
            if(__sync_bool_compare_and_swap(&lock,0,1)) break;
        }
    } //entry section
    (*cnt)--; //critical section
    __sync_lock_release(&lock);
    pthread_exit(NULL); //exit section
}

int main(){
    int counter = 0;
    pthread_t workers[10];
    for(int i=0;i<N;++i){
        if(i%2==0) pthread_create(&workers[i],NULL,safe_add,(void*)&counter);
        else pthread_create(&workers[i],NULL,safe_sub,(void*)&counter);
    }
    for(int i=0;i<N;++i) pthread_join(workers[i],NULL);
    char msg[50];
    int n = sprintf(msg,"Final Counter Value: %d\n",counter);
    write(1,msg,n);
    return 0;
}

