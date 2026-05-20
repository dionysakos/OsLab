#
# Makefile for part 2 - mandel.c
# 

CC = gcc

CFLAGS = -Wall -O2 -pthread
LIBS = 

all: mandel-sem mandel-no-sem

mandel-sem: mandel-lib.o mandel-sem.o
	$(CC) $(CFLAGS) -o mandel-sem mandel-lib.o mandel-sem.o $(LIBS)

mandel-no-sem: mandel-lib.o mandel-no-sem.o 
	$(CC) $(CFLAGS) -o mandel-no-sem mandel-lib.o mandel-no-sem.o $(LIBS)


mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c  

mandel-sem.o: mandel.c  
	$(CC) $(CFLAGS) -DSYNC_SEM -c -o mandel-sem.o mandel.c 

mandel-no-sem.o: mandel.c
	$(CC) $(CFLAGS) -DSYNC_NO_SEM -c -o mandel-no-sem.o mandel.c 

clean:
	rm -f *.s *.o  mandel-sem mandel-no-sem 

	