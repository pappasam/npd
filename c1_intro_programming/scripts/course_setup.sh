#!/bin/bash

export course_dir="$HOME/npd"
export course_scripts="$course_dir/c1_intro_programming/scripts"
export course_current_branch="C1"
export course_vars_loaded="true"

echo "If you see errors about installing vim or git, try running: "
echo
echo "    sudo apt-get update --fix-missing --assume-yes"
echo

command_dependencies="git vim"
for needed_command in $command_dependencies; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Installing missing command: %s\n" "$needed_command" >&2
        sudo apt-get install $needed_command --assume-yes
    fi
done

if [ ! -d $course_dir ]; then
    echo "Downloading course repo to $course_dir with branch $course_current_branch"
    git clone -b $course_current_branch https://github.com/pappasam/npd $course_dir
else
    echo "The course materials repo was found at $course_dir, pulling any recent changes..."
    pushd $course_dir
    git pull
    popd
fi

created_config="false"
config_file="$HOME/course_vars.cfg"
if [ ! -f $config_file ]; then
    created_config="true"

    # set_vars.sh will export variables so they can be used in this script
    $course_scripts/set_vars.sh -f $config_file
else
    echo "Parsing existing config file located at $config_file"
fi
source $config_file
export course_assignments="$HOME/$gh_project"


if [ "$created_config" = "true" ]; then
    echo "Updating your git settings: \"$gh_name\" <$gh_email>"

    # write configuration files that tell github your public info
    # the --global flag says to store this information in your home directory
    git config --global user.name "$gh_name"
    git config --global user.email "$gh_email"

    # these settings establish some sensible defaults
    # like using vim for editing and only pushing your active branch
    git config --global core.editor vim
    # git config --global push.default current
fi

echo "Check that $course_assignments exists and has a .git repo"
if [ ! -d $course_assignments ]; then
    echo "Downloading your assignment repo $gh_repo to $course_assignments"
    git clone $gh_repo $course_assignments
else
    if [ ! -d $course_assignments/.git ]; then
        echo "The directory $course_assignments doesn't hold a git project"
        echo "ABORTING SETUP, FIX PROBLEM AND RERUN SETUP SCRIPT:"
        echo ""
        echo "    $course_scripts/course_setup.sh"
        echo ""
        exit 1

    fi

    echo "Your assignment repo was located in $course_assignments"
fi

check_assignment_started () {
    thisAssignment="$course_assignments/assignment_$1"
    if [ ! -d "$thisAssignment" ]; then
        echo "Didn't find assignment_$1 subdirectory, use following command to fix"
        echo
        echo "    mkdir $thisAssignment"
        echo
        exit 1
    fi
}


create_venv () {
    if [ ! -d "$1/VENV" ]; then
        if [ ! -d "$1" ]; then
            echo "Creating $1 and any subdirectories necessary"
            mkdir -p $1
        fi

        echo "Creating virtual environment at $1/VENV"
        cd $1 #|| exit 1 # todo: fail script if this errors
        python3 -m venv VENV
    fi
}

check_if_in_venv () {
    local __is_venv_var=$1
    local INVENV=""
    python -c 'import sys; print sys.real_prefix' 2>/dev/null && INVENV="true" || INVENV="false"
    eval $__is_venv_var="'$INVENV'"
}

assure_venv () {
    local in_venv=""
    check_if_in_venv in_venv
    if [ $in_venv != "true" ]; then
        create_venv $course_assignments
        source $course_assignments/VENV/bin/activate
    fi
}

check_course_vars_loaded () {

    if [ -z ${course_vars_loaded+x} ]; then
        echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
        echo "This should quit calling scripts too... right?"
        exit 1
    fi

    #if [ -z ${course_vars_loaded+x} ]; then
        #if [ -f $config_file ]; then
            #source $config_file
        #else
            #echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
            #exit 1
        #fi
    #fi
}

compare_command_output_to_expected () {
    local cmd=$1
    local expected_output=$2
    local __passingvar=$3
    local output=$($cmd)
    if [ "$output" != "$expected_output" ]; then
        echo "Output of command $cmd was: |$output|"
        echo "Expected output was: |$expected_output|"
        eval $__passingvar="'false'"
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

# $1 = $thisAssignment/test_exercises.py
run_unit_tests () {
    local test_script=$1
    local __passingvar=$2

    local tmp_file=$(mktemp)
    python $test_script 2> $tmp_file
    unit_test_output=$(cat $tmp_file)
    last_line=$(echo "$unit_test_output" | tail -n1)
    rm $tmp_file

    if [[ $last_line == *"OK"* ]]; then
        eval $__passingvar="'true'"
    else
        eval $__passingvar="'false'"
        echo "Unit tests haven't passed, here is output::

        $unit_test_output"
    fi
}

export -f run_unit_tests
export -f check_course_vars_loaded
export -f check_assignment_started
export -f compare_command_output_to_expected
export -f report_assignment_passing
export -f create_venv
export -f check_if_in_venv
export -f assure_venv
$course_scripts/check_a1.sh
$course_scripts/check_a2.sh
$course_scripts/check_a3.sh
$course_scripts/check_a4.sh
$course_scripts/check_a5.sh
$course_scripts/check_a6.sh
$course_scripts/check_a7.sh

cd $assignment_dir
