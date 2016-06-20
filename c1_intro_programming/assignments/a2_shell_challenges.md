# Shell Challenges

There are a number of commands that will prove very useful in your day-to-day
operations within the Linux environment. Familiarize yourself with these
commands by performing several exercises.

## Setup

All of the commands necessary for this section should already be installed when
your operating system is finished with its setup process.

## Assignment

Perform the following actions:


### 0: Read the Manual

Most commands come packaged with documentation that is accessible via the `man`
command. `man` expects as its first argument the name of the program you want
more information about. It can even be used to teach you about `man` itself:

    man man

**Use `man` to learn about all subsequent commands in this assignment.**

### 1: Print Working Directory

It's common for your command prompt to include the name of the directory you're
currently located in, but sometimes this is insufficient. Use `pwd` to print the
absolute path of your working directory.

    pwd

**Use `pwd` to determine the working directory immediately after you login to
your system.**

### 2: Listing Directory Contents

The `ls` command lists the contents of the directory specified as an argument.
If no directory is specified the working directory's contents are listed.

    ls

**Use `ls` to list the contents of your working directory, and then the contents
of several subdirectories.**

### 3: Change Directory

You can change the current working directory with the `cd` command.

    cd Desktop

**Use the `cd` command to move into several directories and use `ls` without
arguments to check the contents.**

### 4: Make a New Directory

You can use the `mkdir` command to create a new directory.

    mkdir src

**Use `mkdir` to create a directory where you will place all of your coding
projects. If you don't have an opinion on what to call it just use 'src'.**

