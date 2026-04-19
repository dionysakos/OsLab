#
# Makefile for part 2 - mandel.c
# 

CC = gcc

CFLAGS = -Wall -O2 -pthread
LIBS = 

all: mandel-sem mandel-cv

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
	rm -f *.s *.o  mandel-sem mandel-cv 