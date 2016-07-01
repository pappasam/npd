# File System Scripting

Python is a high-level, dynamic, interpreted programming language, as wikipedia
says. It is a sophisticated tool for directing computer hardware to perform some
action that we want, with enough conceptual abstraction so that mere mortals can
understand understand the instructions.

Installing Python puts an program on your machine that is able to read text
structured in the python syntax. If you invoke `python` from the command line
without arguments it will parse one line at a time and execute it, or it can
execute all the commands in a file known as a module.

Scripting gets its name from the fact that you can write commands in the file
and point and interpreter at that file to dynamically run through and execute
them.

## Assignment

### Vagrant Provisioning

Your Vagrant environment is intentionally minimal with the idea that you can
customize how the initial configuration is carried out. The most straightforward
method is to write a `bootstrap.sh` file in the same directory as your
Vagrantfile. This script should provide commands for provisioning a
development or production environment for your application.

- make sure that these packages are installed: git, vim
- create any project layout as needed
- git clone any projects that will be built and executed
- start up any servers or testing suites as appropriate

You can come back and refine this.

### Write a shell script that will use `ifconfig` and `grep` to print out the
lines indicating potential connection IP addresses to your VM.

### Log Users

Write a bash script to record the output of the `w` command in a file. Run this
occasionally to see who's on your system. Make the script more useful by
appending to the logfile instead of overwriting.

On your vm most of the time you should be the only active user unless some
services are running under dedicated users. If the activity from an unknown user
looks questionable, you may have an unwelcome guest!

### Customize Your Bash

Edit the file located at ~/.bashrc, affectionately referred to as your bashrc.
Use the `alias` command and environment variables to create convenient shorthand
commands that can make common operations require fewer keystrokes.

### Use Cron to create automated dustbin

Linux doesn't generally have a recycling bin, most deletion commands are meant
to be permanent. You can use crontab to periodically execute a script that
deletes the contents of a `scratch` directory in your home dir.

### Python Potentiality

Create python versions of the scripts in the above exercises, read about
`os.environ` to interact with environment variables like in the bashrc. Don't
bother with creating aliases.


