
# Complete Vimtutor and Basic Shell Commands

While `vim` is a powerful tool that enables highly efficient editing, it has
a bit of a learning curve. To facilitate the process of familiarization a
program called `vimtutor` is usually included along with the vim executable.

There are several other command line programs that will be equally important for
proficiency in your environment. Familiarize yourself with these programs by
experimenting with them in your Vagrant controlled VM environments.

## Setup

If you have not already done so, run the following three commands in your shell
command prompt. You may have to do this again if starting up a new VM through
vagrant.

    sudo apt-get update --fix-missing
    sudo apt-get install vim
    sudo apt-get install git

## Submission

You will not need to submit evidence of having completed vimtutor, though you
should complete it at least once before the next class.

Part of this assignment will involve creating a directory to store your
submission files, adding that data to a version control system, and publishing
that information for analysis by the course instructors.

## Assignment

### Vimtutor

Vimtutor is a shell script that uses vim to open up an ordinary text file. The
words in this text give you instructions on how to edit the same text to
practice vim commands. Start it from your shell prompt with the following
command:

    vimtutor

**Follow the instructions in the file.**

### Read the Manual

Most commands come packaged with documentation that is accessible via the `man`
command. `man` expects as its first argument the name of the program you want
more information about. It can even be used to teach you about `man` itself:

    man man

**Run the above command to learn more about `man`. Use this command to learn
about newly introduced commands.**

### Creating a Workspace

Use `mkdir` to create a directory called `intro-programming` in your home
directory. Any text or files required as part of an assignment submission should
be placed in this folder.

**Create new exercise directory at `~/intro-programming` and inside put a
README.md file where you can save any notes about the assignment you would like
to add:**

    cd ~
    mkdir intro-programming
    cd intro-programming
    touch README.md
    ls -l


### Explore the Filesystem

The shell program takes into account the current working directory when parsing
and executing commands entered at the prompt. You can use commands like `cd` to
update the current working directory, after which paths omitting the `/` (root)
directory will be assumed to be relative to the current position.

** Use `cd` with the following absolute paths as arguments to change the working
directory to each of these folders:

/bin, /boot, /dev, /etc, /lib, /media, /mnt, /opt, /sbin, /srv, /tmp, /usr, /var

While in each directory, use `ls` with the long flag `-l` to print the directory
contents. Run the command again and pipe the output to a summary file located in
`~/intro-programming`.

An example for the `bin` directory would be

    cd /bin
    pwd
    ls -l
    ls -l > ~/intro-programming/bin-contents.txt

And after completing this for each directory you should have a separate file for
each. Use vim to record any errors you encounter in
`~/intro-programming/README.md`. **

You can read a
[document](https://d37djvu3ytnwxt.cloudfront.net/asset-v1:LinuxFoundationX+LFS101x+1T2016+type@asset+block/LFS101_Ch3_Sec1_FSH.pdf)
explaining the purposes of these directories to guide your exploration.

### Version Control

**Follow these instructions plus linked tutorials and examples from class to
publish your work in your own repository. Email a link to the repo to im60@nyu.edu**

Run the following commands to turn `intro-programming` into a git repository:

    cd ~/intro-programming
    git init

Stage and commit commands as discussed in class:

    git add .
    git commit -m "adding initial assignment 1 files"

Create an account on Github, which is free if you don't use any private
repository storage, then use the web interface to create a new repository.
Github provides [excellent
documentation](https://guides.github.com/activities/hello-world/) of their own
for this process.

Creating an empty repository will display instructions for how to add content to
it. You should see two lines that look like the following:

    git remote add origin https://github.com/boombador/asdfasdf.git
    git push -u origin master

Substitute your own repository URL as displayed on the page and enter those
commands in the shell. If you get an error you probably need to ensure that
you're pointing to the right URL and that you're still in the
`intro-programming` directory and already made it into a git repository. Running
`git status` should tell not warn you that you're outside of a git repo.

Now you should be able to browse the files submitted for this assignment with
the Github web interface available when using a browser to visit a repository
URL.

