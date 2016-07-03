#!/bin/bash

config_file=$HOME/course_vars.cfg
if [ ! -f $config_file ]; then
    ./set_vars.sh
fi
source $config_file

course_dir=$HOME/npd
course_scripts=$course_dir/c1_intro_programming/scripts
course_current_branch="C1"
assignment_dir=$HOME/$gh_project

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
fi

if [ ! -d $assignment_dir ]; then
    echo "Downloading your assignment repo $gh_repo to $assignment_dir"
    git clone $gh_repo $assignment_dir
else
    if [ ! -d $assignment_dir/.git ]; then
        echo "The directory $assignment_dir doesn't hold a git project"
        echo "ABORTING SETUP, FIX PROBLEM AND RERUN SETUP SCRIPT:"
        echo ""
        echo "    $course_scripts/course_setup.sh"
        echo ""
        exit 1

    fi
    echo "Your assignment repo was located in $assignment_dir"
fi

# write configuration files that tell github your public info
# the --global flag says to store this information in your home directory
git config --global user.name "$gh_name"
git config --global user.email "$gh_email"

# these settings establish some sensible defaults
# like using vim for editing and only pushing your active branch
git config --global core.editor vim
git config --global push.default simple

$course_scripts/check_a1.sh

cd $assignment_dir
