
check_course_vars_loaded

assignment_index="5"
thisAssignment="$course_assignments/assignment_$assignment_index"
check_assignment_started "$assignment_index"

cd $thisAssignment
passing="true"

if [ -f $thisAssignment/test_exercises.py ]; then
    mv $thisAssignment/test_exercises.py $thisAssignment/test_exercises.py.bak
fi
cp $course_scripts/test_exercises.py $thisAssignment/test_exercises.py

assure_venv
run_unit_tests "$thisAssignment/test_exercises.py" passing

if [ -f $thisAssignment/test_exercises.py.bak ]; then
    mv $thisAssignment/test_exercises.py.bak $thisAssignment/test_exercises.py
else
    rm $thisAssignment/test_exercises.py
fi

if [ "$passing" == "true" ]; then
    echo "COMPLETED: Assignment $assignment_index"
fi
