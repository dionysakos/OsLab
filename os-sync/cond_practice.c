#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define N 10

pthread_mutex_t mutex;
pthread_cond_t aeb;
int a,b;

void* thread_q(void *arg){
    pthread_mutex_lock(&mutex);
    while(a!=b) pthread_cond_wait(&aeb,&mutex);
    printf("I am Q thread and a==b==%d\n",a);
    pthread_mutex_unlock(&mutex);
    pthread_exit(NULL);
}

void* thread_p(void *arg){
    for(int i=0;i<N;i++){
        pthread_mutex_lock(&mutex);
        a++;
        printf("a==%d\n",a);
        pthread_cond_signal(&aeb); //if a!=b signal has no effect 
        if(a==b){
        printf("I just signaled successfully the thread Q\n");
        printf("The modeling is signal and continue so i can do whatever i want after signaling the thread Q\n");
        printf("I will sleep for 1 second\n");
        sleep(1);
        printf("I just woke up and i will unlock the mutex now. I got bored\n");
        usleep(100000);
        }
        pthread_mutex_unlock(&mutex);
    }
    pthread_exit(NULL);
}


int main(){
    pthread_t P,Q;
    a = 0;
    b = N;
    pthread_mutex_init(&mutex,NULL);
    pthread_cond_init(&aeb,NULL);
    pthread_create(&P,NULL,thread_p,NULL);
    pthread_create(&Q,NULL,thread_q,NULL);
    pthread_join(P,NULL);
    pthread_join(Q,NULL);
    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&aeb);
    return 0;
}
