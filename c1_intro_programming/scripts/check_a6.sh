
check_course_vars_loaded

assignment_index="6"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

cd $thisAssignment
passing="true"

if [ -f $thisAssignment/test_random_walk.py ]; then
    mv $thisAssignment/test_random_walk.py $thisAssignment/test_random_walk.py.bak
fi
cp $course_scripts/test_random_walk.py $thisAssignment/test_random_walk.py

assure_venv
run_unit_tests "$thisAssignment/test_random_walk.py" passing

if [ -f $thisAssignment/test_random_walk.py.bak ]; then
    mv $thisAssignment/test_random_walk.py.bak $thisAssignment/test_random_walk.py
else
    rm $thisAssignment/test_random_walk.py
fi

if [ "$passing" == "true" ]; then
    echo "COMPLETED: Assignment $assignment_index"
fi
