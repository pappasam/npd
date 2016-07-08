{% extends "base.html" %}

{% block title %}
# Functions
{% endblock %}

{% block main %}

# Today's topics

* Functions, values, and refactoring source code
* Organizing documentation with docstrings

---
# What is a function?

.left-column[
* executable statement
* user-defined object
* first-class object
]
.right-column[
### Minimal function

```python
def i_am_a_function(arg1, arg2, banana):
    sum_of_args = arg1 + arg2
    args_with_banana = str(sum_of_args) + " " + banana
    return "Value: " + args_with_banana
```
]

---

# How is a function made?

```python
## Steps

# 1. Create function named FUNCTIONNAME
# 2. FUNCTIONNAME accepts args in ARGUMENTLIST
# 3. DOCSTRING documents function behavior
# 4. STATEMENT_* processes the args
# 5. Returns SOMETHING to the program

def FUNCTIONNAME(ARGUMENTLIST):
    '''DOCSTRING'''
    STATEMENT_1
    STATEMENT_2
    STATEMENT_3
    return SOMETHING

# Example
def hello(person):
    '''Format a string saying hello to the person'''
    return "hello {}".format(person)

greeting = hello("samuel") # obtain the greeting
print(greeting) # print the greeting
```

---

# Why make a function?

* Why == DRY: don't repeat yourself
* Abstraction
* Documentation
* Convention

---

# When to make a function?

## Use functions when you:

* Have deeply nested code
* Use 'break' statements
* Want to separately document pieces of functionality
* Cannot explain how your code works
* Any other ideas?

---

# Where should you use functions?

#### Many good programs are structured as follows:

1. Define lots of words
1. Define procedures with these words
1. Order the procedures
1. Send data through them

#### Functions are useful in all steps and belong almost everywhere

{% endblock %}
