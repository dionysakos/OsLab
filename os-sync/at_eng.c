#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdatomic.h> 


#define NUM_BROKERS 4
#define TRANSACTIONS_PER_BROKER 1000000

atomic_int total_vol = 0;


void* broker_thread(void* arg){
    for(int i=0;i<TRANSACTIONS_PER_BROKER;++i){
        atomic_fetch_add(&total_vol, 1);
    }
    pthread_exit(NULL);
}

int main(){
    pthread_t br[NUM_BROKERS];
    for(int i=0;i<NUM_BROKERS;++i){
        pthread_create(&br[i],NULL,broker_thread,NULL);
    }
    for(int i=0;i<NUM_BROKERS;++i){
        pthread_join(br[i],NULL);
    }
    printf("Total Volume is %d (Expected: %d)\n", total_vol, NUM_BROKERS * TRANSACTIONS_PER_BROKER);
    return 0;
}
