#
# Makefile
# 

CC = gcc

# CAUTION: Always use '-pthread' when compiling POSIX threads-based
# applications, instead of linking with "-lpthread" directly.
CFLAGS = -Wall -O2 -pthread
LIBS = 

all: pthread-test simplesync-mutex simplesync-atomic mandel-sem mandel-cv

## Pthread test
pthread-test: pthread-test.o
	$(CC) $(CFLAGS) -o pthread-test pthread-test.o $(LIBS)

pthread-test.o: pthread-test.c
	$(CC) $(CFLAGS) -c -o pthread-test.o pthread-test.c

## Simple sync (two versions)
simplesync-mutex: simplesync-mutex.o
	$(CC) $(CFLAGS) -o simplesync-mutex simplesync-mutex.o $(LIBS)

simplesync-atomic: simplesync-atomic.o
	$(CC) $(CFLAGS) -o simplesync-atomic simplesync-atomic.o $(LIBS)

simplesync-mutex.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_MUTEX -c -o simplesync-mutex.o simplesync.c

simplesync-atomic.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_ATOMIC -c -o simplesync-atomic.o simplesync.c


## Mandel sync (two versions)
mandel-sem: mandel-lib.o mandel-sem.o utils.o
	$(CC) $(CFLAGS) -o mandel-sem mandel-lib.o mandel-sem.o utils.o $(LIBS)

mandel-cv: mandel-lib.o mandel-cv.o utils.o
	$(CC) $(CFLAGS) -o mandel-cv mandel-lib.o mandel-cv.o utils.o $(LIBS)


mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c  

mandel-sem.o: mandel.c utils.h 
	$(CC) $(CFLAGS) -DSYNC_SEM -c -o mandel-sem.o mandel.c 

mandel-cv.o: mandel.c utils.h
	$(CC) $(CFLAGS) -DSYNC_CV -c -o mandel-cv.o mandel.c 


utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c utils.c -o utils.o 

clean:
	rm -f *.s *.o pthread-test simplesync-atomic simplesync-mutex mandel-sem mandel-cv 