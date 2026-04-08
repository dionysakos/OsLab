#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>

#define BUFF_SIZE 20

int buffer[BUFF_SIZE];
int in=0, out=0;
int item;

void *producer(void* arg){
    sem_t *args = (sem_t *)arg;
    sem_wait(&args[0]);
    sem_wait(&args[2]);
    //produce an item and put it in the buffer
    buffer[in] = 1;
    in = (in+1) % BUFF_SIZE;
    sem_post(&args[2]);
    sem_post(&args[1]);
    pthread_exit(NULL);
}

void *consumer(void* arg){
    sem_t *args = (sem_t *)arg;
    sem_wait(&args[1]);
    sem_wait(&args[2]);
    //consume an item from the buffer
    item = buffer[out];
    out = (out+1) % BUFF_SIZE;
    sem_post(&args[2]);
    sem_post(&args[0]);
    pthread_exit(NULL);
}

int main(){
    sem_t empty,full,mutex;
    sem_init(&empty,0,BUFF_SIZE);
    sem_init(&full,0,0);
    sem_init(&mutex,0,1);
    sem_t args[3] = {empty, full, mutex};
    pthread_t prod, cons;
    pthread_create(&prod, NULL, producer, (void *)args);
    pthread_create(&cons, NULL, consumer, (void *)args);
    pthread_join(prod, NULL);
    pthread_join(cons, NULL);
    printf("Consumed item: %d\n", item);
    sem_destroy(&empty);
    sem_destroy(&full);
    sem_destroy(&mutex);
    return 0;
}