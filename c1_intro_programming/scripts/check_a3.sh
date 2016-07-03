

if [ -z ${course_vars_loaded+x} ]; then
    echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
    exit 1
fi

assignment_index="3"
thisAssignment="$course_assignments/assignment_$assignment_index"
if [ ! -d "$thisAssignment" ]; then
    echo "Didn't find assignment_$assignment_index subdirectory, use following command to fix"
    echo
    echo "    mkdir $thisAssignment"
    echo
    exit 1
fi

passing="true"

cd $thisAssignment
script_add="save_task.sh"
script_list="list_tasks.sh"

if [ ! -f $thisAssignment/$script_add ]; then
    echo "Script $thisAssignment/$script_add doesn't exist"
    echo "Change to assignment subdirectory and use vim and chmod to"
    echo "create a script"
    echo
    echo "    cd $thisAssignment"
    echo "    vim $script_add"
    echo "    # after editing with vim and using \`:wq\` save and quit contents suggested in"
    echo "    # ~/npd/c1_intro_programming/assignments/a3_python_interpreter_exercises.md )"
    echo "    chmod +x $script_add"
    exit 1
fi

if [ ! -f $thisAssignment/$script_list ]; then
    echo "Script $thisAssignment/$script_list doesn't exist"
    echo "Change to assignment subdirectory and use vim and chmod to"
    echo "create a script"
    echo
    echo "    cd $thisAssignment"
    echo "    vim $script_list"
    echo "    # after editing with vim and using \`:wq\` save and quit contents suggested in"
    echo "    # ~/npd/c1_intro_programming/assignments/a3_python_interpreter_exercises.md )"
    echo "    chmod +x $script_list"
    exit 1
fi

# test that initial list_tasks.sh has zero output
add_cmd="$thisAssignment/$script_add"
list_cmd="$thisAssignment/$script_list"

db_file="$HOME/task_database.txt"
if [ -f $db_file ]; then
    echo "Copying $db_file to backup: $db_file.bak"
    cp $db_file $db_file.bak
    rm $db_file
fi

output=$($list_cmd)
if [ -n "$output" ]; then
    passing="false"
    echo "Listing tasks with none saved should have empty output"
    echo "instead found: |$output|"
fi

$add_cmd "return library books"
output="$($list_cmd)"
expected_output="return library books"

if [ "$output" != "$expected_output" ]; then
    echo "Didnt get expected output: |$expected_output|"
    echo "Instead got: |$output|"
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

