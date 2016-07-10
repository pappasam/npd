# Debugging and Numerical Problem Solving

You will be practicing your debugging skills by taking an existing python
program and examining the errors you get when attempting to run it. Each
individual error you encounter should only affect a few words or at most a
couple lines.

The file you will be debugging contains several function definitions for
calculating physical values like the gravitational attraction between two
objects.

You will not be judged on the correctness of the numbers output by the physics
and math equations, only on getting the program to the state where it can run
without exceptions and successfully print the output that should look roughly
like this (your numbers may vary somewhat):

    The force of attraction due to gravity between the earth and the sun
    is: 3.5422793159941665e+22
    The escape velocity at the surface of the Earth is: 11185.79353278485
    Should see the (idealized) travel time to Saturn given an engine
    with capacity for 1000 Newtons of constant thrust:
    {'seconds': 0, 'minutes': 10, 'years': 1, 'days': 228, 'hours': 9}

Within your assignment repo this work should be located in the file
`assignment_7/debugging.py`. You can copy the original source to this location
with the shell commands:

    cd ~/npd
    cp ~/npd/c1_intro_programming/scripts/a7_source.py ~/intro-programming/assignment_7/debugging.py

If you have accidentally deleted or modified the original source file, recover
it with the following commands in your shell:

    cd ~/npd
    git checkout ~/npd/c1_intro_programming/scripts/a7_source.py

### Escape Velocity

Calculate the speed needed to escape orbit from the earth, and what thrust force
an engine would need to achieve it.

    square_root( 2 * Gravity_constant * earth_mass / earth_radius)

### Gravitation Attraction

Debug the function `force_from_gravity` to calculate the gravitic attraction between two bodies
given their masses and separation distance in SI units. The underlying equation is:

Force = Gravity_constant * (Mass_1 * Mass_2) / (separation^2)

### Need For Speed

Debug the function `time_until_destination` which calculates how long a body
moving under constant acceleration will take to travel a target_distance.

### Full Trip

Debug the function `get_transit_time` which takes into account that half the
journey will be spent accelerating and the second half will be spent
decelerating to make sure our speed is manageable when we reach our destination.

### Pretty Printing

Debug the function `get_readable_time` which converts seconds into a dictionary
containing the number of years, days, hours, minutes and seconds represented.

