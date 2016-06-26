
# Complete Vimtutor and Basic Shell Commands

While `vim` is a powerful tool that enables highly efficient editing, it has
a bit of a learning curve. To facilitate the process of familiarization a
program called `vimtutor` is usually included along with the vim executable.

## Setup

If the `vim` program is not already accessible from the command line, install it
with the following command:

    sudo apt-get install vim

Vimtutor should also be accessible at this point, if you attempt to start it and
see an error instead then try googling the text of the error and seeing if anybody
online has encountered the same issue. If you can't find instructions to fix the
issue seek assistance from the instructor

The rest of the commands should be available by default except for git, which
you can install similarly to vim with apt-get:

    sudo apt-get install git

## Submission

You will not need to submit evidence of having completed vimtutor, though the
rest of the submissions will probably be quite time consuming if you haven't
gone through the tutor at least once.

Part of this assignment will involve creating a directory to store your
submission files, adding that data to a version control system, and publishing
that information for analysis by the course instructors.

## Assignment

### Vimtutor

Vimtutor is nothing more than a shell script that uses vim to open up a
temporary copy of a text file containing an overview of basic commands as well as
sample text to practice editing commands as you learn them. Start it by typing
the following command into your shell prompt:

    vimtutor

Follow the instructions in the file to practice essential vim commands. After
completing the tutor at least once you will be equipped to perform any text
manipulation required for further assignments.

### Read the Manual

Most commands come packaged with documentation that is accessible via the `man`
command. `man` expects as its first argument the name of the program you want
more information about. It can even be used to teach you about `man` itself:

    man man

**Use `man` to learn about all subsequent commands in this assignment.**

### Creating a Workspace

Use `mkdir` to create a directory called `intro-programming` in your home
directory. Any text or files required as part of an assignment submission should
be placed in this folder.

**Create empty exercise directory at `~/intro-programming`.**

### Explore the Filesystem

The shell program takes into account the current working directory when parsing
and executing commands entered at the prompt. You can use commands like `cd` to
update the current working directory to shorten the length of the relative path
for a desired file, and other commands for determining the contents of
directories and what the current working directory is.

**Use cd, pwd, and ls to investigate the following directories and their
contents located within the root directory: bin, boot, dev, etc, lib, media,
mnt, opt, sbin, srv, tmp, usr, var. Use vim to record your observations in
`~/intro-programming/filesystem_notes.txt`.**

You can read a
[document](https://d37djvu3ytnwxt.cloudfront.net/asset-v1:LinuxFoundationX+LFS101x+1T2016+type@asset+block/LFS101_Ch3_Sec1_FSH.pdf)
explaining the purposes of these files to guide your exploration.

### Output Redirection

The `cat` command prints its arguments to the standard output, or STDOUT:

    cat ~/.bashrc

You can redirect the output to a file using the `>` operator:

    cat ~/.bashrc > .bashrc.backup

`cat` derives its name from 'concatenate' since it will sequentially print multiple
arguments to the same output. **Use `cat` and command line globbing shortcuts to
combine all the assignment markdown files into a single file located at
`~/intro-programming/assignment_summary.md`.**

### Version Control

Change your working directory to `~/intro-programming`. Run the following
command to turn the directory and its children contents into a git repository:

    git init

Stage and commit commands as discussed in class:

    git add .
    git commit -m "initial commit"

Create an account on Github, which is free if you don't use any private
repository storage, then use the web interface to create a new repository.
Github provides [excellent
documentation](https://guides.github.com/activities/hello-world/) of their own
for this process..

Once you have added a remote pointer to your repository on github, you can push
the new content on your master branch to the public repository:

    git push -u origin master
    # only need to set the upstream flag once, later invocations can look like:
    git push

Now you should be able to browse the files submitted for this assignment with
the Github web interface available when using a browser to visit a repository
URL.

**Follow the linked tutorials and examples from class to keep submitting changes
and improvements to your repository until class is over. Extensions can be
discussed with the instructor.**

