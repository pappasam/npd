#!/bin/bash

config_file="$HOME/course_vars.cfg"
if [ ! -f $config_file ]; then
    # set_vars.sh will export variables so they can be used in this script
    ./set_vars.sh -f $config_file

    # write configuration files that tell github your public info
    # the --global flag says to store this information in your home directory
    git config --global user.name "$gh_name"
    git config --global user.email "$gh_email"

    # these settings establish some sensible defaults
    # like using vim for editing and only pushing your active branch
    git config --global core.editor vim
    git config --global push.default simple
else
    echo "Parsing existing config file located at $config_file"
fi
source $config_file

command_dependencies="git tmux vim"
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
    echo "The course materials repo was found at $course_dir"
fi

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

$course_scripts/check_a1.sh
$course_scripts/check_a2.sh
$course_scripts/check_a3.sh

cd $assignment_dir
