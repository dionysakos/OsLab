#include <pthread.h>
#include <stdio.h>

#define NUM_BROKERS 4
#define TRANSACTIONS_PER_BROKER 1000000

int total_vol = 0;

void* broker_thread(void *arg) {
    for (int i = 0; i < TRANSACTIONS_PER_BROKER; ++i) {
        total_vol++;
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t brokers[NUM_BROKERS];
    for (int i = 0; i < NUM_BROKERS; i++) {
        if (pthread_create(&brokers[i], NULL, broker_thread, NULL) != 0) {
            perror("Failed to create thread");
            return 1;
        }
    }
    for (int i = 0; i < NUM_BROKERS; i++) {
        if (pthread_join(brokers[i], NULL) != 0) {
            perror("Failed to join thread");
            return 2;
        }
    }

    printf("Total Volume is %d (Expected: %d)\n", total_vol, NUM_BROKERS * TRANSACTIONS_PER_BROKER);
    return 0;
}