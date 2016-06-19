# Classes

Topics: 
Class-based object oriented programming. 
Defining a class and creating objects.


# Objects

Objects are confusing

* Abstract...
* Complex
* Modular
* Loosely-defined in Python

```python
# x, y, and z are all (different) objects
x = "hello"
y = 123
z = lambda t: t + 1
```


# Classes

Classes are confusing

* Abstraction of abstraction
* Create complexity
* Modular
* A user-defined template to create objects
* Better-defined than objects, in Python

```python
# X and Y are classes
from collections import OrderedDict as X

class Y(object):
    pass
```


# Objects & Classes

See below for some analogies.

Objects:

* The keyboard you are using
* Your pet golden retriever named fluffy
* The moon

Classes:

* A keyboard
* A Golden Retriever
* A moon


# Components

* Name - N
* Data Attributes - A
* Methods - M
* Base - B

```python
class N(B):
    A0 = "hello"  # class variable
    A1 = 1.4      # another class variable

    def M0(self):
        self.A2 = "another value"  # instance variable
        self.A3 = {'a': 1, 'b': 2}  # another instance variable
        return "home"

    def M1(self):
        self.A2 = "something else"
        return self.A2
```


# Definitions

Name - the identifier for the class

Data attributes - data associated with a class that is not callable

Methods - callable functions associated with a class

Base - some class on which the class being defined is based


# Object Creation

```python
# Define class
class Holla(object):

    def __init__(self, name):  # constructor
        self.name = name

    def speak(self, word):
        template = "Hey there, it's {}. I just want to say: {}"
        print(template.format(self.name, word))

# Create some objects
brian = Holla('brian')
steve = Holla('steve')
jennifer = Holla('jennifer')

# Use the objects
brian.speak('solid')
steve.speak('weak')
jennifer.speak('hehe')
```


# Conventions

* "self"
* "special" methods - __somename__
* Private methods (or lack thereof)
* Names use CapWords
