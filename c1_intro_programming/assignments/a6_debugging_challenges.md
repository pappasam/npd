# Data Structures and Iteration

We can use code to simulate an event happening many, many times using random
variability to explore how the process works at a higher level.

## Assignment

We will simulate a random walk and add the ability to tune how many steps or
runthroughs we perform. Using these arguments we can gain insight into the long
term behavior of the random walk process.

Begin editing a file located at
`~/intro-programming/assignment_6/random_walk.py`, add the following text
snippets to get started and follow the instructions to make modifications to
complete the assignment.

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

### Storing and Updating State

We can store our current location as a list of two numbers. There exist more
advanced vector data types, but a list will satisfy our needs for this
assignment.

```python
current_location = [0, 0]

# if you wanted to simulate moving 1 unit in the negative x
# direction, you would update the values in this list
#current_location[0] += -1
#current_location[1] += 0
```

### Simulating the Walk

At the bottom of your file

```python
moves = {
    'west': (-1, 0),
    'east': (1, 0),
    'north': (0, 1),
    'south': (0, -1)
    }

steps = 10
for step_index in range(steps):
    direction = get_random_direction()

    # use the direction key to lookup dictionary value
    new_move = moves[direction]

    # extract the numerical values from tuple stored in dictionary
    delta_x = new_move[0]
    delta_y = new_move[1]

    # remember the above instructions for how to update a list?
    # UPDATE current_location HERE
```

### Tuning Parameters

You may have noticed that we saved the number of steps in an intermediate value
as 10. It would be interesting if we could tune this number to see how we get
different results with shorter or longer walks without having to edit the script
in vim. 

Invoke your script with an argument for the number of steps you would like your
random walk to take. Optionally add several extra arguments to assist debugging:

```bash
python random_walk.py 5 secondArg "third arg"
```

You can access the arguments as a list of strings by importing the `sys` module
and interacting with `sys.argv`. This is a list of all the arguments, including
the name of the script being run. Take the first non-script argument, which
would be the second element with an index of 1, and assign that to the steps
variable:

```python
# add the import statement to the top of your file
import sys

# print the arguments to get a better understanding of sys.argv
# remove this debug statement before submitting
print(sys.argv)

# update the existing line where steps is set to 10
steps = sys.argv[1]
```

### Repeating

Take another argument

runs = int(sys.argv[2])

```python
end_locations = []
for run_index in range(runs):
    current_location = [0, 0]

    for step_index in range(steps):
        direction = get_random_direction()

        # the code from the loop earlier in the assignment
        # should go in here, indent it all by 4 space to nest it
        # ...

    end_locations.append(current_location)

print(end_locations)
```

Now `end_locations` will have a list of all the places where the walk
terminated.

### Analyze Average Distance

What is the average distance away from the origin that the walk terminates?
We already have access to the `end_locations` list, so we can iterate through
that to find the distance for each run and add it to a sum variable, then after
the loop is complete divide that by the number of runs to get the average.

```python
total_distance = 0
for coords in endpoints:
    dx = coords[0]
    dy = coords[1]

    # use the Pythagorean theorem to get distance like last session
    distance = math.sqrt(dx*dx + dy*dy)

    total_distance += distance

average_distance = total_distance / len(endpoints)
```

Experiment with changing the number of steps and number of runs. Do you notice
any patterns? Feel free to share your informal observations in a file
`~/intro-programming/assignment_6/observations.txt`.

### Optional: Analyze Displacement

Instead of calculating the distance and summing that to take an average, you
could directly add the components of the current locations to a summation list.
When the iteration was done you would have an average of the position as it
evolved throughout a walk. Add this for extra practice.

