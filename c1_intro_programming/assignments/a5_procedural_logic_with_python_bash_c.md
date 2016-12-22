# Procedural Logic and Python

First of all, run the course_setup.sh script to make sure course materials are
up to date.

    ~/npd/c1_intro_programming/scripts/course_setup.sh

As of this push the course script won't verify assignment 5 yet, a
proper test harness will be forthcoming. Until then deliverables should still be
located in a new `assignment_5` subdirectory. If you have not already created
it:

    # replace "intro-programming" with your assignment directory if different!
    mkdir ~/intro-programming/assignment_5
    cd ~/intro-programming/assignment_5

## Style Examples

The following snippets are examples of python code with some deviations from the
preferred style. Can you spot the issues? Add each of these to a file
`~/intro-programming/assignment_5/style.py`.

Can you spot the indentation problems with the following code?

```python
foo = long_function_name(var_one, var_two,
    var_three, var_four)


def long_function_name(
    var_one, var_two, var_three,
    var_four):
    print(var_one)
```

Can you spot the operator order problems with the following code?

```python
# operators: prefix or postfix?
income = (gross_wages +
          taxable_interest +
          (dividends - qualified_dividends) -
          ira_deduction -
          student_loan_interest)
```

Can you spot the blank line problems with the following code?

```python
def top_level_func():
    print("important processing going on here")

def second_func():


    print("another gravely important function")
```

Can you spot the naming problems with the following code?

```python
def topLevelFunc():
    print("important processing going on here")
    mixedCaseVariables = True
```

## Procedural Python

### Temperature Conversion 

Write a function that converts Fahrenheit to Cengtigrade, and another
function that computes the inverse operation. To help get you started here is a
template for the functions, open a file `assignment_5/exercises.py` and add the
following contents:

```python
def to_fahrenheit(degrees_celsius):
    return degrees_celsius

def to_celsius(degrees_fahrenheit):
    return degrees_fahrenheit
```

Refer to the slides for the math equation to implement within the function.

### Controlled Fall

If we discount wind resistance, the only force working on a projectile is
gravity. Therefore when calculating how long until it hits the ground, we can
completely ignore the x dimension.

The equation for the distance travelled by an object under constant acceleration
is:

    vertical_height = (1/2) * gravity_acceleration * time_elapsed * time_elapsed

If we know the distance it can fall and the acceleration due to gravity we only
have to solve for the time_elapsed. Write a function that takes the height
parameter and solves for the time until the projectile hits the ground using the
following equation:

    time_elapsed = square_root((2 * vertical_height) / gravity_acceleration)

Add the following lines to your `exercises.py` file, and replace the current
`return height` line with the mathematical expression performing the previous
function.

HINT: You will need to use a function in the math module, hence the import
statement to help you out.

```python
import math

def get_fall_time(height):
    # gravity isn't going to change, units in m/(s^2)
    acceleration_by_gravity = 9.8

    # replace with logic of above equation
    return None
```

### Inside Range

Since the horizontal velocity of a projectile is unchanged throughout flight
(ignoring air resistance) you can calculate its range based on the initial speed
and the time in the air.

    range = muzzle_velocity * transit_time

Imagine you are playing a physically-based game and you want to setup an
encampment that is out of range of a cannon tower. Write a function that will
take the x and y coordinates of both the tower and the proposed encampment plus
the height of the tower.

Use the height argument and the function you wrote earlier in this assignment to
determine the maximum range it can cover. Then use the coordinates to determine
the distance between the two locations and return a boolean value of true if the
tower can hit the target.

Add the following to your `exercises.py` file, and update the places where
`None` is assigned to a variable and replace it with your own code.

```python
def isVulnerable(tower_height, tower_x, tower_y, target_x, target_y):
    muzzle_velocity = 300

    # update this line to calculate time_in_air using get_fall_time() function
    time_in_air = None

    tower_range = time_in_air * muzzle_velocity
    
    delta_x = None  # difference between tower_x and target_x
    delta_y = None  # difference between tower_y and target_y

    separation = None  # the x and y deltas form a triangle, find the hypotenuse
    if separation < tower_range:
        print("The target is closer than the tower range, what should we return?")
        return None
    else:
        print("The target is further than the tower range, what should we return?")
        return None
```

