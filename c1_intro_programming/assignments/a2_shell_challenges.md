# Shell Challenges

There are a number of commands that will prove very useful in your day-to-day
operations within the Linux environment. Familiarize yourself with these
commands by performing several exercises.

## Setup

All of the commands necessary for this section should already be installed when
your operating system is finished with its setup process. 

Windows instructions are [here][install-windows].


## Exercise

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

### 5: Print File Contents

The `cat` command prints its arguments to the standard output, or STDOUT:

    cat ~/.bashrc

It derives its name from 'concatenate' since it will sequentially print multiple
arguments to the same output. ** Use output redirection to combine 2 files into
1.**

## Assignment

### Download

Use wget to download several files. You can use a browser in a graphical environment
(and really, also a shell environment), to find the URL of a particular resource
that you would like to download. Download at least the following (3) things:

1. A background image for your desktop, or a text containing a quotation that
you can set as a bash login greeting.
2. The non-file URL of a website page. Open the resulting source file with vim
and see what your browser receives and parses into the webpage.
3. A configuration file for Vim. If you have no preference, use the following
suggested minimal python focused vimrc:

    https://github.com/pappasam/npd/tree/C1/c1_intro_programming


If you looking at a file on the Github web view you can get a download URL by
going to a github page displaying a vimrc file and using the context menu to
'Copy link address' over the 'Raw' link.

### Searching

Use grep to search a text file for some substring. This is often extremely
useful when you guess that some string must exist in the codebase, but you don't
know where. Searching for the class on a navbar element might lead you to where
relevant styling resides.

    grep pageContainer

### Output Redirection

[install-windows][http://www.everydaylinuxuser.com/2014/05/how-to-install-linux-mint-as-virtual.html]
