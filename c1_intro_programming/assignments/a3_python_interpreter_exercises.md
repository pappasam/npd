# Bash Exercises

Bash commands can be placed into files called scripts where the first line is
called a "shebang" and is of the form:

    #!/bin/bash

This tells the shell when executing a file to use the program located at
/bin/bash to interpret the text.

## Setup

If you haven't already, clone the course site into your home directory. The
`-b` option here causes the `git clone` command to check out the `C1` branch,
which we do because that is where our current course lives. The final argument
places the repository within the home directory in a project directory at
`~/intro-course`, since that is slightly more readable than npd.

    git clone -b C1 https://github.com/pappasam/npd.git ~/intro-course
    cd ~/intro-course
    chmod +x c1_intro_programming/scripts/course_setup.sh

    # don't run next line until you update the script with your git information
    c1_intro_programming/scripts/course_setup.sh

After you update the script downloaded in the course resources repository and
run it you should have your assignment repo cloned and the assignment_3
directory created for you if it does not exist.

This would be a good script to examine, spend a bit of time trying to understand out
how it works before moving on.


## Assignment

Create two script files `save_task.sh` and `list_tasks.sh` that perform like the
following:

```bash
$ ./list_tasks.sh
$ ./save_task.sh "return library books"
$ ./list_tasks.sh
return library books
$ ./save_task.sh "learn programming"
$ ./save_task.sh "pick up the milk"
$ ./list_tasks.sh
return library books
learn programming
pick up the milk
```

We will break down the problem into several steps.

### Create the scripts

Use `cd` to change directories into your assignment_3 directory. Then create
each script starting with it's shebang using output redirection. Finally use
chmod to make them executable.

```bash
cd ~/intro-programming/assignment_3
echo "#!/bin/bash" > save_task.sh
echo "#!/bin/bash" > list_tasks.sh
chmod +x save_task.sh
chmod +x list_tasks.sh
```

Though executable, both scripts perform no commands. Use vim to inspect their
contents, then exit with `:q`.

### Listing Tasks

From bash use vim to edit `save_task.sh`:

```bash
vim save_task.sh
```

Make the contents match the following:

```bash
#!/bin/bash

newTask="think of a sample task"
echo $newTask >> ~/task_database.txt
```

Press <escape> to make sure you're in normal mode, then `:wq` to save and quit
out of vim. Now use vim to edit the script to list the tasks:

```bash
vim list_tasks.sh
```

And now the contents for this file should be:

```bash
#!/bin/bash
cat ~/task_database.txt 
```

By appending a string to a file using the `echo` command you can store tasks one
per line. 

From now on if you are asked to edit a file you should enter the command `vim
<filename>`, use the commands you learned in vimtutor to edit the text, then
quit by pressing <escape> to make sure you're in normal mode, then `:wq` to
save and quit.

The following is an example of how the commands should function once your files
match the examples. Only input the lines starting with the `$` symbol, but don't
type it or the lines without it:

```bash
$ ./save_task.sh
$ ./save_task.sh
$ ./list_tasks.sh
think of a sample task
think of a sample task
```

### Expanding Variables

Edit `save_tasks.sh` with vim and add the following lines:

```bash
newTask="when you see this the task text has been expanded"

# double quotes are expanded, single are not
echo $newTask
echo "$newTask"
echo '$newTask'
```

Experiment with this file by making small changes and saving with vim, then
executing the file again as in the example above with `./save_task.sh`. You
should understand what a variable is and how it gets replaced with its contents.

### Command Line Arguments

When bash starts a script it automatically sets several variables for you, one
example is the positional argument set. Here are some comands that prints the first 3
arguments with each one seperated by a row of symbols, add them to
`save_tasks.sh` after the lines of from the "Expanding Variables" section.

```bash
echo "------------"
echo "first arg: $1"
echo "============"
echo "first arg: $2"
echo "============"
echo "first arg: $3"
```

Now experiment with different arguments. Here are some examples to get you
started:

```bash
./save_tasks first "second" "eleventy one"
```

### Final Product

Finally use vim to replace the newTask definition line in `save_tasks.sh`:

```bash
newTask=$1
echo "$newTask"
```

At this point the script should behave as outlined in the first section. Commit
your changes and push them:

    cd ~/intro-programming
    git add assignment_3
    git commit -m "adding task script"
    git push

You should be able to find your script on Github.

