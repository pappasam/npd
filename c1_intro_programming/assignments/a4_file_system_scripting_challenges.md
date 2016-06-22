# File System Scripting

Scripting gets its name from the fact that you can write commands in the file
and point and interpreter at that file to dynamically run through and execute
them.


## Assignment

### Vagrant Provisioning

Your Vagrant environment is intentionally minimal with the idea that you can
customize how the initial configuration is carried out. The most straightforward
method is to write a `bootstrap.sh` file in the same directory as your
Vagrantfile. This script should include commands to install any programs you
need and create directories for your project layout.

### Write a shell script that will use `ifconfig` and `grep` to print out the
lines indicating potential connection IP addresses to your VM.

### Use the `os` module in python to create a reminder logging script. Write a
python script to check for a `reminders` directory in your home directory and
create it if not there. The first argument to the script should be string
(enclosed in quotes so it can include spaces) which should be written to a file
with a filename that encodes the current date.

