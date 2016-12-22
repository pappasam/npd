{% extends "base.html" %}

{% block title %}
# Everything is an Object
{% endblock %}

{% block main %}

# Today's topics

* Namespaces
* Import statement
* Python packages and multi-file projects

---

# Namespaces

## Everything is a giant dictionary

```python
from pprint import pprint
pprint(globals())
```

```txt
>> {'__builtins__': {'ArithmeticError': <class 'ArithmeticError'>,
                  'AssertionError': <class 'AssertionError'>,
                  'AttributeError': <class 'AttributeError'>,
                  'BaseException': <class 'BaseException'>,
                  'BlockingIOError': <class 'BlockingIOError'>,
                  'BrokenPipeError': <class 'BrokenPipeError'>,
```

---

# Scope

* Advanced topic, but important
* Helps organize data for programmer
* Namespaces simplify understanding of scope

---

# Seeing scope

## globals()

* Returns a dictionary containing the current scope's global variables

## locals()

* Returns a dictionary containing the current scope's local variables

---

# Your program and scope

```python
w = lambda s: s + " world"

# The following calls are the same
x = w('hello')
y = locals()['w'].__call__('hello')
z = globals()['w'].__call__('hello')
```

---

# Import statement

1. Find a module, and initialize it (if necessary)
1. Define a name or names in the local namespace (of the scope where the import statement occurs)

---

# Finding a module

## Search along PYTHONPATH

```sh
python -c "import sys; print(':'.join(x for x in sys.path if x))"
```

## NOT the same as the path to your python binary

---

# Main module

```sh
# myscript is the main module
python myscript.py

# now yourscript is the main module
python yourscript.py

# now ourscript is the main module
python ourscript.py
```

---

# Main module code

```python
# main.py
x = 1
y = 2
def add(a, b):
    return a + b

# Translation:
# If this is the main module,
# run the code below
if __name__ == '__main__':
    z = add(x, y)
    print(z)
```

---

# Import example

```python
# one_operations.py
def adder(n):
    return n + 1

# two_operations.py
def adder(n):
    return n + 2

# adder.py
import one_operations as oneops
import two_operations

if __name__ == '__main__':
    n = 1
    n1 = oneops.adder(n)
    n2 = two_operations.adder(n1)
    print("{} became {} and then {}".format(n, n1, n2))
```

---

# Module versus package

## Module

A file containing Python statements and definitions

## Package

A collection of modules that are able to relatively import from each other

---

# Package semantics

```txt
sound/                          Top-level package
      __init__.py               Initialize the sound package
      formats/                  Subpackage for file format conversions
              __init__.py
              wavread.py
              wavwrite.py
              aiffread.py
              aiffwrite.py
              auread.py
              auwrite.py
              ...
      effects/                  Subpackage for sound effects
              __init__.py
              echo.py
              surround.py
              reverse.py
              ...
      filters/                  Subpackage for filters
              __init__.py
              equalizer.py
              vocoder.py
              karaoke.py
              ...
```

---

# Relative imports

Packages may benefit from relative imports.

## Caveat

The main module must be outside of the package

---

# Package benefits

* Less code per file
* Avoid naming conflicts as project grows
* Organize concepts hierarchically

{% endblock %}
