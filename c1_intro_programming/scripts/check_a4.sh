
check_course_vars_loaded

assignment_index="4"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

cd $thisAssignment
passing="true"

if [ ! -f "$thisAssignment/Makefile" ]; then
    passing="false"
    echo "You need a Makefile. You can either create your own or use the one in"
    echo "the course repo with the following command. The only requirement is that"
    echo "the executable generated is named \"hello\":"
    echo
    echo "    cp ~/npd/c1_intro_programming/scripts/a4_Makefile ~/intro-programming/assignment_4/Makefile"
    echo
    exit 1
fi

if [ ! -f "$thisAssignment/hello.c" ]; then
    passing="false"
    echo "You need to create hello.c and then run \"make\" to build it. Create that file"
    echo "before re-running this script"
    exit 1
fi

make
if [ ! -x "$thisAssignment/hello" ]; then
    passing="false"
    echo "Makefile exists but doesn't generate an executable, please fix."
    exit 1
fi

output=$(./hello)
expected_output="Hello World"
if [ "$output" != "$expected_output" ]; then
    echo "Got output: |$output|"
    echo "Instead expected: |$expected_output|"
    passing="false"
fi

script_add="save.py"
script_list="list.py"

if [ ! -d "$thisAssignment/VENV" ]; then
    echo "Creating virtual environment in directory $thisAssignment/VENV"
    python3 -m venv VENV
fi
source VENV/bin/activate

if [ ! -f $thisAssignment/$script_add ]; then
    echo "Script $thisAssignment/$script_add doesn't exist"
    echo "Change to assignment subdirectory and use vim to create a script"
    echo
    echo "    cd $thisAssignment"
    echo "    vim $script_add"
    echo "    # after editing with vim and using \`:wq\` to save and quit add contents suggested in"
    echo "    # ~/npd/c1_intro_programming/assignments/a4_file_system_scripting_challenges.md )"
    echo "    python $script_add"
    exit 1
fi

if [ ! -f $thisAssignment/$script_list ]; then
    echo "Script $thisAssignment/$script_list doesn't exist"
    echo "Change to assignment subdirectory and use vim and chmod to"
    echo "create a script"
    echo
    echo "    cd $thisAssignment"
    echo "    vim $script_list"

    echo "    # edit with vim, and using \`:wq\` to save and quit, add contents suggested in"
    echo "    # ~/npd/c1_intro_programming/assignments/a4_file_system_scripting_challenges.md )"
    echo "    python $script_list"
    exit 1
fi

# test that initial list_tasks.sh has zero output
add_cmd="python $thisAssignment/$script_add"
list_cmd="python $thisAssignment/$script_list"

db_file="$HOME/task_database_python.txt"
if [ -f $db_file ]; then
    echo "Copying $db_file to backup: $db_file.bak"
    cp $db_file $db_file.bak
    rm $db_file
fi

# throwing away error becuase it made python exercise just a bit too messy
output=$($list_cmd 2> /dev/null)
if [ -n "$output" ]; then
    passing="false"
    echo "Listing tasks with none saved should have empty output"
    echo "instead found: |$output|"
fi

$add_cmd "return library books"
output="$($list_cmd)"
expected_output="return library books"
if [ "$output" != "$expected_output" ]; then
    echo "Got output: |$output|"
    echo "Instead expected: |$expected_output|"
    passing="false"
fi

$add_cmd "learn programming"
$add_cmd "pick up the milk"
output=$($list_cmd)
expected_output="return library books
learn programming
pick up the milk"

if [ "$output" != "$expected_output" ]; then
    passing="false"
    echo "Didnt get expected output: |$expected_output|"
    echo "Instead got: |$output|"
fi


if [ "$passing" != "true" ]; then
    echo "Scripts in assignment_3 do not meet specifications, details available"
    echo "in earlier error messages"
else 
    echo "COMPLETED: Assignment $assignment_index"
fi

# restore original db from before test
rm $db_file
if [ -f $db_file.bak ]; then
    mv $db_file.bak $db_file 
fi

