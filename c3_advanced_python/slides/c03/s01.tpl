layout: true
name: iterables

# Python Iterables

---

layout: true
name: writing-iterables

## Writing Iterators

  * A python iterator is an obect with one method named `next`.
  * The next method returns the `next` item of the iterable or raises `StopIteration` when there is no more items to iterate over.

---

```python ((ex01.py))
```

---

template: writing-iterables


```python <<ex01.py>>
```

---

name: making-iterables
template: iterables
layout: true

## Making an Object Iterable

  * An object is iterable if the object's `__iter__` method returns it's iterator.
  * Now we can iterate via a for loop!

---

```python ((ex02.py))
```

---

template: making-iterables

```python <<ex02.py>>
```

---

name: more-iterables
template: iterables
layout: true

## More Iterables

  * An Iterable can implement (or extend) it's own iterator:

---

template: more-iterables

```python ((ex03.py))
```

---

template: more-iterables

```python <<ex03.py>>
```

---

layout: false

# Python Generators
## The yield Statement

  * As usual with python, there is always a neater way to accomplish something.
  * Any function or method can become iterable with the yield statement.  Such functions are called generators:

```python ((ex04.py))
```

--

```python <<ex04.py>>
```

---

layout: true

# Builtin Python Methods

---

## Representing Objects

  * As demonstrated previously, the `__iter__` method has special meaning python, much like `__init__`.
  * Other useful builtin methods are the `__str__` and `__repr__` methods, which allow non string objects to have string values when printing.  These can be useful when debugging or logging.

---

## Representing Objects (Example)

```python ((ex05.py))
```

---

## Representing Objects (Example)

```python <<ex05.py>>
```

---

## Invoking Obects

  * The method `__call__` allows for an object to behave as a function.
  * The arguments of the `__call__` method will depend on how the function is to be called, e.g.:
    * No arguments: `__call__(self)`
    * One or more arguments: `__call__(self, arg1, arg2)`
    * Variable or keyword arguments: `__call__(self, *args, **kwargs)`

---

## Invoking Objects (Example)

```python ((ex06.py))
```

---

## Invoking Objects (Example)

```python <<ex06.py>>
```

---

layout: true

# The With Statement

---

  * The with statement creates a new scope and enables an object to prepare before entering scope and to clean up at the end of the scope.
    * Clean up is always performed even if an exception is encountered.

```python
with file('blah.txt', 'w') as f:
  f.write('This file will automatically close after this line.')
print 'The file is closed!'

```
  * Equivalent to this old style pattern.

```python
f = file('blah.txt', 'w')
try:
  f.write('This file will have to explicitly closed, even if an exception occurs.')
finally:
  f.close()
print 'This file is closed!'
```

---

## Implement It

  * The with statement can be used on any object that implements the methods `__enter__` and `__exit__`.
  * The `__enter__` method:
    * Prepares object before executing block of code.
    * Returned object is passed to block of code.
  * The `__exit__` method:
    * Performs any necessary clean up.
    * Can optionally detect and handle any errors thrown in with block.
      * You can revisit this later.
    * For now, just clean up and return None (no explicit return statement).

---

## Implement It (Example)

```python ((ex12.py))
```

---

## Implement It (Example)

```python <<ex12.py>>
```

---

layout: true

# Additional Builtin Methods

---

## Get/Set Attributes and Items

  * `__getattribute__(self, attr)` is called when an `object.attr` is made.
    * Either returns the attribute value or raises `AttributeError`.
  * `__setattribute__(self, attr, value)` is called when `object.attr = value` is made.
  * `__getitem__(self, item)` is called when an `object[item]` is made.
    * Either returns the attribute or raises `KeyError`.
  * `__setitem__(self, item, value)` is called when `object[item] = value` is made.

---

## Excercise

  * Extend the python dict class to enable accessing items by attribute.
    * Example:

```python
your_dict = YourDict()
your_dict['a'] = 1
print your_dict.a
your_dict.b = 2
print your_dict['b']
```

---

layout: true
name: advance-functions

# Advanced Python Functions

---

## Nested Functions

  * Functions can be defined within functions.
  * Nested functions can access outside variable scope.
    * n.b.: This is called closure.

```python ((ex07.py))
```

--

```python <<ex07.py>>
```

---

## Function Factories

  * A python function can return a reference to a function created by that function.

```python ((ex08.py))
```

--

```python <<ex08.py>>
```

---

## More on Closures

  * Nested and returned functions maintain reference to parent function's scope.
  * Nested functions cannot modify reference in parent scope:

```python ((ex09.py))
```

--

```python <<ex09.py>>
```

---

layout: true
template: advance-functions

## More on Closures

  * Objects in parent scope can still be mutated.

---

```python ((ex10.py))
```

---

```python <<ex10.py>>
```

---

template: advance-functions

## Lambda Functions

  * Functions can be defined inline as a lambda.
  * Syntax:
    * No Arguments: `lambda: 1234`
    * One Argument: `lambda x: x + 1`
    * Multiple arguments: `lambda x, y: x + y`
    * Returns are implied in Lambda, do not specify:
      * This is wrong: `lambda: return 5`
      * This is correct: `lambda: 5`
    * Lambdas are limited to expressions, no statements:
      * Not allowed: `lambda x: x['five'] = 5

---

template: advance-functions

## Lambda Functions (Example)

  * Lambdas are frequently used when a function expects another callable as an argument.
    * e.g. Python's sort function may accept a lambda for the comparator or key functions.

```python ((ex11.py))
```

--

```python <<ex11.py>>
```
