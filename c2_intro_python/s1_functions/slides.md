# Functions

Course: 1

Session: 1

Topics: 
Functions, values, and refactoring source code 
Organizing documentation with docstrings

* What?
* How?
* Why?
* When?
* Where?


# What?

* An executable statement
* A user-defined object
* A first-class object

```python
def i_am_a_function(arg1, arg2, banana):
    sum_of_args = arg1 + arg2
    args_with_banana = str(sum_of_args) + " " + banana
    return "Value: " + args_with_banana
```


# How?

1. Create function named FUNCTIONNAME
1. FUNCTIONNAME accepts args in ARGUMENTLIST
1. DOCSTRING documents function behavior
1. STATEMENT_* processes the args
1. Returns SOMETHING to the program

```python
# Abstract
def FUNCTIONNAME(ARGUMENTLIST):
    '''DOCSTRING'''
    STATEMENT_1
    STATEMENT_2
    STATEMENT_3
    return SOMETHING

# Example
def hello(person):
    '''Format a string saying hello to the person

    :param person: STR
    '''
    return "hello {}".format(person)

greeting = hello("samuel") # obtain the greeting
print(greeting) # print the greeting
```


# Why?

* Why == DRY: don't repeat yourself
* Abstraction
* Documentation
* Convention


# When?

Use functions when you:

* Have deeply nested code
* Use 'break' statements
* Want to separately document pieces of functionality
* Cannot explain how your code works
* Any other ideas?


# Where?

Many good programs are structured as follows:

1. Define lots of words
1. Define procedures with these words
1. Order the procedures
1. Send data through them

Functions are useful in all steps 
Therefore, functions belong almost everywhere
