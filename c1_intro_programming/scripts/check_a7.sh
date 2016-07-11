
check_course_vars_loaded

assignment_index="7"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

cd $thisAssignment
passing="true"

if [ -f $thisAssignment/test_debugging.py ]; then
    mv $thisAssignment/test_debugging.py $thisAssignment/test_random_walk.py.bak
fi
cp $course_scripts/test_debugging.py $thisAssignment/test_debugging.py

assure_venv
run_unit_tests "$thisAssignment/test_debugging.py" passing

if [ -f $thisAssignment/test_random_walk.py.bak ]; then
    mv $thisAssignment/test_random_walk.py.bak $thisAssignment/test_debugging.py
else
    rm $thisAssignment/test_debugging.py
fi

if [ "$passing" == "true" ]; then
    echo "COMPLETED: Assignment $assignment_index"
fi
