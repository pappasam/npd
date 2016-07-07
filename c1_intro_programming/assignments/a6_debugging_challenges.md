# Data Structures and Iteration

We can use code to simulate an event happening many, many times using random
variability to explore how the process works at a higher level.

We will simulate a random walk and add the ability to tune how many steps or
runthroughs we perform. Using these arguments we can gain insight into the long
term behavior of the random walk process.

Begin editing a file located at
`~/intro-programming/assignment_6/random_walk.py` and add the code from the rest
of this document to get started and follow the instructions to make
modifications to complete the assignment.

### Picking a random direction

In order to pick a direction for each time step we need a source of randomness.
We can use the `random` module to get a pseudo-random decimal number between 0
and 1, then look at where the number falls to decide which direction to select:
and then we can use that 

```python
import random

def get_random_direction():
    direction = ""
    probability = random.random()

    if probability < 0.5:
        direction = "west"
    else:
        direction = "east"

    return direction
```

**Update the if-else chain to include extra `elif` statements for the directions
"north" and "south". You will need to change the above probability with which
"west" is selected.**

### Converting Direction Names to Numbers

Add these lines after where you defined the function `get_random_direction`:

```python
def get_direction_displacement(dir_key):
    displacements = {
        'west': (-1, 0),
        'east': (1, 0),
        'north': (0, 1),
        'south': (0, -1)
        }

    # access the dictionary
    # UPDATE HERE: how do you use the key to access a dictionary?
    # replace None with the answer
    return None
```

### Storing and Updating State

We can store our current location as a list of two numbers. There exist more
advanced vector data types, but a list will satisfy our needs for this
assignment.

```python
# example of state, don't add to your file yet
example_location = [0, 0]

# if you wanted to simulate moving 1 unit in the negative x
# direction, you would update the values in this list
change_in_x = -1
change_in_y = 0
example_location[0] += change_in_x
example_location[1] += change_in_y
```

# Implementing Walk

Once the above functions are working to your satisfaction

Now write the function that will tie the above functions

```python

def take_walk(steps):
    current_location = [0, 0]
    for step_index in range(steps):
        direction = get_random_direction()

        displacement = get_direction_displacement(direction)

        # extract the numerical values from the tuple
        delta_x = displacement[0]
        delta_y = displacement[1]

        # UPDATE current_location HERE
        # consult example in 'Storing and Updating State' for method to update
        # current_location

    return current_location
```

At the bottom of your file you should add the main functionality. This is
Pythons method for specifying what code should be run when a module is executed
instead of just being imported.

This prevents modules from performing unnecessary computation or environment
changes when you are simply importing a module to get some desired functions or
variables in your own script.

```python


if __name__ == "__main__":
    steps = 10
    current_location = take_walk(steps)

    print("Done with walk, printing end location: ")
    print(current_location)
```

With your python environment active, you should be able to run this with the
following command:

    python random_walk.py

### Tuning Parameters

You may have noticed that the `take_walk` function has a parameter for the
number of steps to perform. We currently hardcode the invocation to require 10
steps, but it would be interesting if we could tune this number to see how we
get different results with shorter or longer walks without having to edit the
script in vim.

Invoke your script with an argument for the number of steps you would like your
random walk to take. Optionally add several extra arguments to assist debugging:

You can access the arguments as a list of strings by importing the `sys` module
and interacting with `sys.argv`. This is a list of all the arguments, including
the name of the script being run. Take the first non-script argument, which
would be the second element with an index of 1, and assign that to the steps
variable:

```python
# add the following import statement next to the other at the top
import sys

```

```python
# find this line, it should already exist so don't add it
if __name__ == "__main__":
    steps = 10

    # ADD THESE NEW LINES
    if len(sys.argv) > 1:
        steps = int(sys.argv[1])

    # now back to existing code
    current_location = take_walk(steps)
```

### Repeating

We can perform an arbitrarily long walk, but it could be interesting to compare
numerous walks of the same length to analyze the behavior of the underlying
probabilities. Add the following function

```python
def take_all_walks(steps, runs):
    endpoints = []
    for run_index in range(runs):
        end_location = take_walk(steps)
        endpoints.append(end_location)
    return endpoints
```

Also make this update to the main functionality section at the end of the file

```python
# find this section, it should already exist so don't add it
if __name__ == "__main__":
    steps = 10
    if len(sys.argv) > 1:
        steps = int(sys.argv[1])

    # ADD THESE NEW LINES
    runs = 1
    if len(sys.argv) > 2:
        steps = int(sys.argv[2])

    # now back to existing code
    endpoints = take_all_walks(steps, runs)

    # rest of the code...
```

Now `end_locations` will have a list of all the places where the walk
terminated on each of its runs.

### Analyze Average Distance

What is the average distance away from the origin that the walk terminates?
We already have access to the `end_locations` list, so we can iterate through
that to find the distance for each run and add it to a sum variable, then after
the loop is complete divide that by the number of runs to get the average.

```python
def average_final_distance(endpoints):
    total_distance = 0
    for coords in endpoints:
        dx = coords[0]
        dy = coords[1]

        # use the Pythagorean theorem to get distance like last session
        distance = math.sqrt(dx*dx + dy*dy)

        total_distance += distance

    return total_distance / len(endpoints)

# at end of __main__ code add these lines to see if it worked
# mind the indentation, should be 4 spaces in front
    average_displacement = average_final_distance(endpoints)
    print(average_displacement)
```

Experiment with changing the number of steps and number of runs. Do you notice
any patterns? Feel free to share your informal observations in a file
`~/intro-programming/assignment_6/observations.txt`.

### Optional: Analyze Displacement

Instead of calculating the distance and summing that to take an average, you
could directly add the components of the current locations to a summation vector.
When the iteration was done you could divide that vector by the number of
intermediate positions to get the average position throughout the walk.
Code this for extra practice.

