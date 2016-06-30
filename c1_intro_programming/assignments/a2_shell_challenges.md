
# Session 2: Shell and Python

There are a number of commands that will prove very useful in your day-to-day
operations within the Linux environment. Familiarize yourself with these
commands by performing several exercises.

## Tasks

### Vagrant First Time Setup

The first time you set up a vagrant server you will have to create a directory
to hold the workspace.

If you are in windows, place this on the `Desktop` then use `cd`
to change your current working directory:

    # windows only, first time setup
    mkdir %USERPROFILE%\Desktop\vagrant-workspace
    cd %USERPROFILE%\Desktop\vagrant-workspace

If your host system is linux or apple based:

    # linux, apple, first time only
    mkdir ~/vagrant-worskpace
    cd ~/vagrant-worskpace

Then use `vagrant init` with optional argument of which box to include for the
future. This command creates a Vagrantfile, and the contents of this directory
will be available from both your linux guest OS and your main machine.

    vagrant init hashicorp/precise64

### Startup and Teardown Vagrant

Now any time you want to have your linux VM available you have two steps. First,
change your current working directory to the vagrant workspace created earlier
if not already in it:

    # Windows only
    cd %USERPROFILE%\Desktop\vagrant-worskpace

    # Linux, Apple, etc.
    cd ~/vagrant-worskpace

Now use vagrant to start a VM:

    # all OSes
    vagrant up

There are two options for shutting down the VM, one that simply turns off the
computer simulation as if powering off the hardware and another to power off and
reclaim the disk space allocated to the VM by the host.

    # shuts down and frees up RAM, doesn't wipe VM disk
    vagrant halt

    # reclaims RAM and disk
    vagrant destroy

And now you're ready to connect.

### Connect To Vagrant

Using vagrant to connect is simple but depends on the `ssh` program. Often linux
and apple OSes come with it installed, and Windows can also get it by
downloading the appropriate package from Cygwin.

    # recommended for linux and apple hosts
    vagrant ssh 

For windows it's much easier to use putty:

    host: 127.0.0.1 (localhost)
    port: 2222
    username: vagrant
    password: vagrant

### Complete Vimtutor

If you are still working on vimtutor, or have downtime during class and have not
completed it a second time, continue where you left off.

### Prepare Submissions

Change directories while in your VM's shell to your submission repo:

    cd ~/intro-programming/assignment_2

If you get an error, or haven't created it yet, do so now:

    mkdir -p ~/intro-programming/assignment_2

If you have created a repository previously use git to clone it. This is what
the URL would look like for the sample repository I created in class.

    git clone https://github.com/boombador/intro-programming.git

### Anatomy of a Command Line

Follow in-class discussion on the command prompt, answer the following questions
to demonstrate your understanding of the structure of a command line. This
exercise will take the form of writing answers in a file
`~/intro-programming/assignment_2/commands.md`.

    ls -l ~/intro-programming

Which of the above tokens is the executable? Which is the argument? Which is the
flag?

    git add func_list.c

This one is a bit trickier, what in the above command tokens is an argument and
what is an executable?.

### Download

Use wget to download several files. Use a browser to find the URL of a
particular resource that you would like to download. After downloading
use vim to inspect the files on your machine.

If trying to run `wget` results in an error, run `sudo apt-get install wget` and
double check the URL.

**Create a new file at `~/intro-programming/assignment_2/downloads.md`, use vim
to record the URLs you downloaded and any questions or observations you had
about what you found in the file.**

1. The non-file URL of a website page. Open the resulting source file with vim
and see what your browser receives and parses into the webpage.
2. A configuration file for Vim. If you have no preference, use the following
suggested minimal python focused vimrc:

    https://raw.githubusercontent.com/pappasam/configsettings/master/vimrc_minimum

If you looking at a file on the Github web view you can get a download URL by
going to a github page displaying a vimrc file and using the context menu to
'Copy link address' over the 'Raw' link.

### Search a Codebase

Clone and enter the class repo:

    cd ~
    git clone https://github.com/pappasam/npd.git
    cd npd

Checkout the course 1 branch:

    git checkout C1

**Use `grep` to find all instances of the string 'provision' in that repo.**

Basic grep usage:

    grep 'queryString' file_arg.txt

Where 'queryString' is what you're looking for, and file_arg.txt is the file you
want to search.

HINT: On the manual page look for flags dealing with case sensitivity and
recursive options.

### Git Submission

If you created a new repository in the earlier step (meaning you used `git init`
instead of `git clone`) then you have to set the remote. Here's an example using
the URL for the repo I created in class.

    git remote add origin https://github.com/boombador/intro-programming.git

Once you have an initialized git repository with files in it you are ready to
save, use the following commands

    git add .
    git commit -m "you decide what this message says"
    git push -u origin master

We will go over these commands again plus the benefits of branching and merging
in the next class.

