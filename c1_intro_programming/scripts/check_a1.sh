
if [ -z ${course_vars_loaded+x} ]; then
    echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
    exit 1
fi

thisAssignment="$course_assignments/assignment_1"

# create assignment_1 dir if it doesn't exist
if [ ! -d "$thisAssignment" ]; then
    echo "Didn't find assignment_1 subdirectory, use following command to fix"
    echo
    echo "    mkdir $thisAssignment"
    echo
    exit 1
fi

echo "Looking for files meant to be generated in assignment 1"
passed=true
root_subdirs="bin boot dev etc lib media mnt opt sbin srv tmp usr var"
for subdir in $root_subdirs; do
    target_file="$thisAssignment/$subdir-contents.txt"

    if [ -f $target_file ]; then
        passed=false
        echo "Expected to find contents of /$subdir in $target_file, but the file was not found"
        echo "You can generate this file with the follow commands:"
        echo
        echo "    cd /$subdir"
        echo "    ls -l > $target_file"
        echo
    fi
done

