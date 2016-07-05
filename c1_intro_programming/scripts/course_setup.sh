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

$course_scripts/check_a1.sh
$course_scripts/check_a2.sh
$course_scripts/check_a3.sh
$course_scripts/check_a4.sh

cd $assignment_dir
