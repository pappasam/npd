# Shell Challenges

There are a number of commands that will prove very useful in your day-to-day
operations within the Linux environment. Familiarize yourself with these
commands by performing several exercises.

## Setup

All of the commands necessary for this section should already be installed when
your operating system is finished with its setup process. 

Windows instructions are [here][install-windows].

## Assignment

### Prepare Submissions

In your previous assignment you created the directory `~/intro-programming` and
placed any files to be submitted within it. Now we will organize this repo file
organization to keep multiple assignments organized. Change your working
directory into the repository folder, then use `git mv` to change the stored
location of the files:

    mkdir assignment_1 
    git mv * assignment_1
    mkdir assignment_2

**Ensure all the files from the previous assignment are moved into the
directory `~/intro-programming/assignment_1`, and an empty directory is created
for assignment_2. Stage, commit, and push these changes to your public
submission repository added to Github in the last class.**

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

In class we discussed the standard input and output channels available by
default to most programs and how it is possible to redirect those streams of
data so that other programs can directly process them without needing to
explicitly save to an intermediate file.

### Packaging it Up

Use the `tar` command to package your `assignment_2` directory into a tarball.
If you are in a graphical linux environment, use a browser to email the tarball
to `im60@nyu.edu`. If in a vagrant environment, you can access the file from
your host machine by moving the tarball to the `/vagrant/` directory and submit
it using your host OS.

[install-windows]: http://www.everydaylinuxuser.com/2014/05/how-to-install-linux-mint-as-virtual.html

