
check_course_vars_loaded

assignment_index="3"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

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

compare_command_output_to_expected () {
    cmd=$1
    expected_output=$2
    output=$($cmd)
    if [ "$output" != "$expected_output" ]; then
        echo "Output of command $cmd was: |$output|"
        echo "Expected output was: |$expected_output|"
        passing="false"
    fi
}

report_assignment_passing () {
    if [ "$2" != "true" ]; then
        echo "Scripts in assignment_$1 do not meet specifications, details available"
        echo "in earlier error messages"
    else 
        echo "COMPLETED: Assignment $1"
    fi
}

expected_output=""
compare_command_output_to_expected "$list_cmd" "$expected_output"

$add_cmd "return library books"
expected_output="return library books"
compare_command_output_to_expected "$list_cmd" "$expected_output"

$add_cmd "learn programming"
$add_cmd "pick up the milk"
expected_output="return library books
learn programming
pick up the milk"
compare_command_output_to_expected "$list_cmd" "$expected_output"

report_assignment_passing $assignment_index $passing

# restore original db from before test
rm $db_file
if [ -f $db_file.bak ]; then
    mv $db_file.bak $db_file 
fi

