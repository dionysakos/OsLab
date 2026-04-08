#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define NUM_BROKERS 4
#define TRANSACTIONS_PER_BROKER 1000000

int total_vol = 0;

pthread_mutex_t mutex;
// Otherwise, the mutex can be initialized with PTHREAD_MUTEX_INITIALIZER

void* broker_thread(void* arg){
    for(int i=0;i<TRANSACTIONS_PER_BROKER;++i){
        pthread_mutex_lock(&mutex);
        total_vol++;
        pthread_mutex_unlock(&mutex);
    }
    pthread_exit(NULL);
}

int main(){
    pthread_mutex_init(&mutex,NULL); // Initialize the mutex
    pthread_t br[NUM_BROKERS];
    for(int i=0;i<NUM_BROKERS;++i){
        pthread_create(&br[i],NULL,broker_thread,NULL);
    }
    for(int i=0;i<NUM_BROKERS;++i){
        pthread_join(br[i],NULL);
    }
    printf("Total Volume is %d (Expected: %d)\n", total_vol, NUM_BROKERS * TRANSACTIONS_PER_BROKER);
    pthread_mutex_destroy(&mutex); // Clean up the mutex
    return 0;
}
