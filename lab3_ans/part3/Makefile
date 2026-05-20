CC = gcc
CFLAGS = -Wall -Wextra -O2  -pthread

TARGETS =  pfork

pfork: pfork_v2.c utils.c
	$(CC) $(CFLAGS) -o pfork pfork_v2.c utils.c 

clean:
	rm -f $(TARGETS) *.o output.txt