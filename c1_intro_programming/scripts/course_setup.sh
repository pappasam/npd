#!/bin/bash

echo "UNMODIFIED SCRIPT: this script has been written with instructor's"
echo "information as placeholder text. Please replace that info with your own"
echo "and delete these echo and exit commands before running script again"
exit 1

# this is the name of the repository you created on github for your assignment
gitProject="intro-programming"

# the username for the account you created on github
gitUser="boombador"

# this combines the earlier two variables in the URL for git commands
gitRepo="https://github.com/$gitUser/$gitProject.git"

# replace instructor information with your own before running script
git config --global user.name "Ian McLaughlin"
git config --global user.email im60@nyu.edu

# these will silence some errors and use our familiar vim by default
git config --global core.editor vim
git config --global push.default simple

# make sure git project is checked out
if [ ! -d "$HOME/$gitProject" ]; then
    cd $HOME
    git clone $gitRepo
fi

# create assignment_3 dir if it doesn't exist
if [ ! -d "$HOME/$gitProject/assignment_3" ]; then
    echo "Attempting to run \`mkdir assignment_3\`"
    mkdir $HOME/$gitProject/assignment_3
fi
