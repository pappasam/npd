
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

