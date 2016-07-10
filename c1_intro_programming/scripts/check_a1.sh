
check_course_vars_loaded

assignment_index="1"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

passing="true"
missing_subdirs=""
missing_counter=0
root_subdirs="bin boot dev etc lib media mnt opt sbin srv tmp usr var"
for subdir in $root_subdirs; do
    target_file="$thisAssignment/$subdir-contents.txt"

    if [ ! -f $target_file ]; then
        if [ $passing = "true" ]; then
            echo
            echo "Expected to find contents of /$subdir in"
            echo "$target_file, but the file was not found"
            echo "You can generate this file by entering the following commands:"
            echo
            echo "    cd /$subdir"
            echo "    ls -l > $target_file"
            echo
        fi
        missing_subdirs="$subdir $missing_subdirs"
        passing="false"
        ((missing_counter++))
    fi
done

if [ $passing = "false" ]; then
    echo "Missing \"*-contents.txt\" files for the following root subdirectories:"
    echo "$missing_subdirs"
    echo "There are $missing_counter missing files"
    echo
else
    echo "COMPLETED: Assignment $assignment_index"
fi 

