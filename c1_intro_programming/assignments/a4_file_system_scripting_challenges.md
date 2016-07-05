# File System Scripting


## Compiled Languages and Summary

All commands in the rest of this assignment are assumed to be run from the
appropriate subdirectory:

    # only run this next line if you havent created assignment_4 yet
    mkdir ~/intro-programming/assignment_4
    cd ~/intro-programming/assignment_4

You should also run the course_setup.sh script:

    ~/npd/c1_intro_programming/scripts/course_setup.sh

If that command gives you an error then you should download a copy of the latest
version of the script and execute it directly:

    wget https://raw.githubusercontent.com/pappasam/npd/C1/c1_intro_programming/scripts/course_setup.sh
    bash course_setup.sh

### Hello World in C

Use vim to open a file `hello.c` and add the following text by entering insert
mode with the `i` key and typing out or copy pasting this text:

```c
#include <stdio.h>
int main(void) {
    printf("hello, world\n");
    return 0;
}
```

Now you can either write your own Makefile based on the instructions from class,
or copy the pre-saved Makefile like so:

    cp ~/npd/c1_intro_programming/scripts/a4_Makefile ~/intro-programming/assignment_4/Makefile

At this point if you are able to run make and compile your source without
receiving any errors you will pass the requirements for the C-related part of
the assignment.

    make
    ./hello

Look at the intermediate files that were also generated to get a better
understanding of the multiple steps in the compilation process.

### Optional: Build Loop Program in 3 Languages

Put the following in a file named `loop.sh`

```bash
#print 1-10 on separate lines
for i in $(seq 10); do
    echo "$i"
done
```

Build and run by changing the execute permissions and invoking:

```bash
chmod +x loop.sh
./loop.sh
```

To make this program in C first you need to write the source file. Open a file `loop.c` with vim:

```c
#include <stdio.h>

int main(void)
{
    int i = 0;
    for (i = 0; i < 10; i++) {
        printf("Loop iteration: %d\n", i);
    }
    return 0;
}
```

And add the following rule to your existing `Makefile`.

```Makefile
loop: loop.c
	gcc -o loop loop.c
```

Now you can build and execute the loop program as follows:

```bash
make loop
./loop
```

For Python you can add the following contents to a file called `loop.py`:

```python
#print 1-10 on separate lines
for i in range(10):
    print(i)
```

Then when your python virtualenv is activated you can run:

    python loop.py


#### OLD STUFF




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


