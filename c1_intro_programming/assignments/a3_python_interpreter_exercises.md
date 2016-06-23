# Python Interpreter Exercises

Python is a high-level, dynamic, interpreted programming language, as wikipedia
says. It is a sophisticated tool for directing computer hardware to perform some
action that we want, with enough conceptual abstraction so that mere mortals can
understand understand the instructions.

Installing Python puts an program on your machine that is able to read text
structured in the python syntax. If you invoke `python` from the command line
without arguments it will parse one line at a time and execute it, or it can
execute all the commands in a file known as a module.

## Setup

Install the python version 3.4 interpreter, and the bpython wrapper system.

    sudo apt-get install python3.4
    sudo apt-get install bpython

## Assignment

Run bpython and experiment with these assignments. You can save your command
history for submission through the interface.

### Create a workspace

Within the bpython interpreter use the `os` module for (3) taskss:

1. Get your current working directory with `os.getcwd`.
2. If you are not already in your home directory, us `os.chdir` to update your
currentworking directory to that location.
3. Create a directory to create a directory called `python-exercises` and change
directories into it with another `os` invocation.

### Read and Write

Open a file and write some string to it. Close the interpreter and examine the
file with vim. Reopen `bpython` and return to your exercise folder if necessary.
Read the file contents into a variable the print that variable.

### 
