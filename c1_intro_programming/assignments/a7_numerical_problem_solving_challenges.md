# Numerical Problem Solving

Computers excel at numerical calculation, harness that power to seem
Being able to understand code is often more difficult than writing it. It is an
invaluable skill


## Assignments

### Homemade `cat`

What is incorrect or faulty about the following code snippets? Submit corrected
versions of these code samples.  

def printFile(filePath):
    f = file(filePath)
    contents = f.read()
    printContents()

def printContents():
    print("Contents of " + filePath)
    print(contents)

### Exception Ordering

def divideAndConquer(argA, argB):
    return argA / argB
    if argB == 0:
        raise ZeroDivisionError("Woops, divided by zero")

### Gravitation Attraction

Write a function that calculates the gravitic attraction between two bodies
given their masses and separation distance in SI units.

### Escape Velocity

Calculate the speed needed to escape orbit from the earth, and what thrust force
an engine would need to achieve it.

### Orbiting a Black Hole

Imagine a space mission to cross the cosmos and enter long-distance orbit around
a black hole. Assume that at the time of this mission we have figured out the
vagaries of the EM drive and can generate constant thrust of (look this up) N across
space towards a collapsed star that is 100 lightyears away.

### Drake Equation

We covered a lot of ground in our journey, if we make use of the Drake equation
to calculate the theoretical distribution density of intelligent life in the
universe and assume that we have the instrumentation to detect any life within a
1 light year radius from our position throughout the journey, what is the
probability that we will encounter life?

