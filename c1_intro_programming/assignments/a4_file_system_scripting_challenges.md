# File System Scripting

Python is a high-level, dynamic, interpreted programming language. It is a
sophisticated tool for directing computer hardware to perform some action that
we want, with enough conceptual abstraction so that we can understand the
instructions.

Installing Python puts a program on your machine that is able to read text
structured in the python syntax. If you invoke `python` from the command line
without arguments it will parse one line at a time and execute it, or it can
execute all the commands in a file known as a module.

Scripting gets its name from the fact that you can write commands in the file
and point the interpreter at that file to dynamically run through and execute
them.

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

## Hello World in C

Use vim to open a file `hello.c` and add the following text by entering insert
mode with the `i` key and typing out or copy pasting this text:

```c
#include <stdio.h>
int main(void) {
    printf("Hello World\n");
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

## Optional: Build Loop Program in 3 Languages

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

The next section will cover how to set up your python environment, but you could
try the following command to use the default python interpreter. If it doesn't
execute properly try again after following the instructions in the next section.

    python loop.py

### Python Setup

From within the `assignment_4` subdirectory` create a new virtual environment.

    # only create VENV if it doesn't exist already
    python3 -m venv VENV

If you get an error saying that python3 doesn't exist, follow these steps to
download, compile the source, and install the executable. The `configure` and
`make` commands will likely take a while to complete and generate a large amount
of output that won't make much sense to you yet.

```bash
cd /home/vagrant/
sudo wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tar.xz
sudo tar -xvf Python-3.4.1.tar.xz
cd Python-3.4.1
sudo ./configure
make
sudo make install
```

Now you can try the earlier command to create the `VENV` directory. It will
contain scripts and executables used by this project that will be kept isolated
from other python programs present on this machine.

Activate your virtualenv like so:

    source VENV/bin/activate

Now if you type python without the 3 at the end, you should still get the
interpreter for the version 3.4 that you installed earlier. If you type in
`python` at a prompt with VENV active you should get something like the
following:

    (VENV) $ python
    Python 3.4.1 (default, Jun 30 2016, 17:11:23)
    [GCC 4.8.4] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

### Procedural Python


Add the following contents to the file `save.py`. You will be able to call these
functions to perform the intended functionality of the script very simply after
these helper functions are defined:

```python
import os
import sys

def parseArguments(argvArray):
    """ Since sys.argv includes the name of the script itself, we omit
    the first element and combine the rest into a single string. Then we
    add a newline so appended tasks won't be bunched up."""

    argsAsWord = " ".join(argvArray[1:])
    return argsAsWord + "\n"


def saveTask(taskString):
    """ writes passed taskString to the file database"""

    dbFilename = "task_database_python.txt"
    dbPath = os.path.join( os.getenv("HOME"), dbFilename )
    with open(dbPath, "a") as myfile:
        myfile.write(taskString)
```

To invoke a function you type its name followed by an opening parenthesis, then
any arguments that it may expect, then a closing parenthesis. If it generates
any result you can put variable and and equals sign before the function
expression to store the result in the function. For example to parse the
arguments automatically exposed in the `sys` module:

```python
parsedTask = parseArguments(sys.argv)
```

At this point the script is nearly complete, you just need to add one more line
where you invoke `saveTask` with `parsedTask` as an argument. There is no need
to save the result, we didn't define one for saveTask anyway.


The listing script will be even simpler, open a file `list.py` and add the
following contents:

```python
import os

dbFilename = "task_database_python.txt"
dbPath = os.path.join( os.getenv("HOME"), dbFilename )
with open(dbPath, "r") as myfile:
    dbContents = myfile.read()
    trimmedContents = dbContents.rstrip()
```

All you need to do is add one more line where you invoke the `print()` function
with the `trimmedContents` variable. It has to be at the same level of
indentation as the previous line where trimmedContents is declared.

### Optional: Improve Python Script

You could add some argument parsing logic to perform more complicated actions.
For instance, you could add a priority or a due date, and write tasks to
individual files.

