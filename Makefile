CC = gcc
CFLAGS = -Wall -Wextra -std=c11

TARGETS = process_creation stop_resume_demo output_program simple_program

all: $(TARGETS)

process_creation: process_creation.c
	$(CC) $(CFLAGS) process_creation.c -o process_creation

stop_resume_demo: stop_resume_demo.c
	$(CC) $(CFLAGS) stop_resume_demo.c -o stop_resume_demo

output_program: file1.c file2.c
	$(CC) $(CFLAGS) file1.c file2.c -o output_program

simple_program: simple_program.c
	$(CC) $(CFLAGS) simple_program.c -o simple_program

clean:
	rm -f $(TARGETS)
