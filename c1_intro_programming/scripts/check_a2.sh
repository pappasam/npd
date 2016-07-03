
if [ -z ${course_vars_loaded+x} ]; then
    echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
    exit 1
fi

assignment_index="2"
thisAssignment="$course_assignments/assignment_$assignment_index"
if [ ! -d "$thisAssignment" ]; then
    echo "Didn't find assignment_$assignment_index subdirectory, use following command to fix"
    echo
    echo "    mkdir $thisAssignment"
    echo
    exit 1
fi

passing="true"
links=""
if [ ! -f "$thisAssignment/index.html" ]; then
    echo "Was expecting to find $thisAssignment/index.html"
    echo
    passing="false"
    links="www.google.com $links"
fi

if [ ! -f "$thisAssignment/vimrc_minimum" ]; then
    echo "Was expecting to find $thisAssignment/vimrc_minimum"
    echo
    passing="false"
    links="https://raw.githubusercontent.com/pappasam/configsettings/master/vimrc_minimum $links"
fi

if [ $passing != "true" ]; then
    echo "Make sure your current directory is the assignment subdirectory, then download"
    echo "the files with wget. Download the files at the following URLs, results"
    echo "should named index.html and vimrc_minimum."
    echo
    echo "    cd ~/intro-programming/assignment_2/"
    for link in $links; do
        echo "    wget $link"
    done
    echo
else 
    echo "COMPLETED: Assignment $assignment_index"
fi

