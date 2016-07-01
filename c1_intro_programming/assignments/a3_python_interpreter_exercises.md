# Bash Exercises

Bash commands can be placed into files called scripts where the first line is
called a "shebang" and is of the form:

    #!/bin/bash

This tells the shell when executing a file to use the program located at
/bin/bash to interpret the text.

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

In bash use `git clone` to get intro-programming if it doesn't exist, and use mkdir to make
assignment_3 if that hasn't been created yet. Next perform the following
commands:

```bash
cd ~/intro-programming/assignment_3
echo "#!/bin/bash" > save_task.sh
echo "#!/bin/bash" > list_tasks.sh
chmod +x save_task.sh
chmod +x list_tasks.sh
```

Now both scripts are executable, though they perform no commands. Use vim to
inspect their contents, then exit with `:q`.

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

