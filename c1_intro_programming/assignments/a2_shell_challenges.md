
# Session 2: Shell and Python

There are a number of commands that will prove very useful in your day-to-day
operations within the Linux environment. Familiarize yourself with these
commands by performing several exercises.

## Tasks

### Complete Vimtutor

If you are still working on vimtutor, or have downtime during class and have not
completed it a second time, continue where you left off.

### Prepare Submissions

Follow in class demonstration to ensure your github submission repo is properly
configured. The commands should look like the following:

    cd ~/intro-programming
    mkdir assignment_1 
    git mv * assignment_1
    mkdir assignment_2

**Ensure all the files from the previous assignment are moved into the
directory `~/intro-programming/assignment_1`, and an empty directory is created
for assignment_2. Stage, commit, and push these changes to your public
submission repository as demonstrated in class.**

### Anatomy of a Command Line

Follow in-class discussion on the command prompt, answer the following questions
to demonstrate your understanding of the structure of a command line. This
exercise will take the form of writing answers in a file
`~/intro-programming/assignment_2/commands.md`.

    ls -l ~/intro-programming

Which of the above tokens is the executable? Which is the argument? Which is the
flag?

    git add func_list.c

This one is a bit trickier, what in the above command is an argument and what is
an executable?

### Download

If trying to run `wget` results in an error, run `sudo apt-get install wget`.

Use wget to download several files. Use a browser to find the URL of a
particular resource that you would like to download. After downloading
use vim to inspect the files on your machine.

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

**Use `grep` to find all instances of the string 'provision' in that repo. The
basic usage pattern of grep is:**

    grep 'queryString' file_arg.txt

Where 'queryString' is what you're looking for, and file_arg.txt is the file you
want to search.

HINT: On the manual page look for flags dealing with case sensitivity and
recursive options.

### Python Usage

**Follow the demonstrations in class to perform some example python computation.
Once completed use <ctrl><s> to use bpython's save feature to record your
command history and save it into
`~/intro-programming/assignment_2/python_history.py`.**


