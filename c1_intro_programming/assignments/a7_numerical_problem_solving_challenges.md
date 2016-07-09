# Debugging and Numerical Problem Solving

Computers excel at numerical calculation, use the error output from the python
interpreter to fix this program which performs a number of calculations related
to a theoretical space flight.

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

