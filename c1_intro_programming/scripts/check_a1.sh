
if [ -z ${course_vars_loaded+x} ]; then
    if [ -f $config_file ]; then
        source $config_file
    else
        echo "Course variables have not been set, you probably need to run \"./course_setup.sh\""
        exit 1
    fi
fi

assignment_index="1"
thisAssignment="$course_assignments/assignment_$assignment_index"

# create assignment_1 dir if it doesn't exist
if [ ! -d "$thisAssignment" ]; then
    echo "Didn't find assignment_$assignment_index subdirectory, use following command to fix"
    echo
    echo "    mkdir $thisAssignment"
    echo
    exit 1
fi

echo "Looking for files meant to be generated in assignment 1"
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

