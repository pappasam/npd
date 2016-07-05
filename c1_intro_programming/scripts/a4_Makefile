CC = gcc
CFLAGS = -Wall -Wextra -Wno-unused-parameter -ansi -pedantic

# Linking: takes bundles of machine code and molds it into one executable
hello: hello.o
	$(CC) $(CFLAGS) hello.o -o hello

# Assemble: convert assembly to machine code
hello.o: hello.s
	$(CC) $(CFLAGS) -c hello.s

# Compile: turn the C code into assembly
hello.s: hello.i
	$(CC) $(CFLAGS) -S hello.i

# Preprocess: replace directives with the referenced code
hello.i: hello.c
	$(CC) $(CFLAGS) -E hello.c > hello.i

clean:
	rm hello.i hello.s hello.o hello
