# Static Methods

  * Static methods are functions associated to a class but does not require an actual instance in which to operate.
    * Static methods are declared by use of the decorator `staticmethod`.

```python ((ex01.py))
```

--

```python <<ex01.py>>
```

---

layout: true
name: class-methods

# Class Methods

---

layout: true
template: class-methods

  * Class methods are functions that receive the class type of the associated instance instead of the instance itself.
    * This is used primarily when the method needs to behave differently depending on the calling type instead of the actual instance.
    * Class methods are declared by use of the decorator `classmethod`.
    * The first argument of the class method is the class object.
    * Class methods do not receive a reference to the calling instance.

---

```python ((ex02.py))
```

---

```python <<ex02.py>>
```

---

layout: true
template: class-methods

  * Class methods are useful as factory functions to wrap `__init__`.
    * In this example, such a function is used to enable copying.

---

```python ((ex03_inc.py))
```

---

  * Additional points of interest about this example:
    * `__eq__` is another special python method that determines how to evaluate the `==` operator.
    * `type` keyword is used to obtain the type of the instance.
      * This is used in the comparison to prevent an inherited type from matching a parent type.

---

```python ((ex03.py))
```

--

```python <<ex03.py>>
```

---

layout: true
name: decorators

# Decorators

---

  * We've used decorators already.
    * `@staticmethod` and `@classmethod` are examples of decorators.
  * The `@` operator results in python wrapping one function into another function.

```python
@aDecorator
def aFunction(args):
  print 'I do stuff on %r!' % (args,)
```

Is equivalent to:

```python
def aFunction(args):
  print 'I do stuff on %r!' % (args,)

aFunction = aDecorator(aFunction)
```

---

layout: true
name: function-decorator
template: decorators

## Implementation (Function Factories):

---

layout: true
name: function-decorator-ex
template: function-decorator

  * A decorator is a function that accepts the original function and returns a different function in it's place.
    * Use function factory pattern to implement this.

---

```python ((ex04_inc.py))
```

---

```python ((ex04.py))
```

--

```python <<ex04.py>>
```

---

layout: true
template: function-decorator

  * A decorator can also define arguments when functions are being wrapped by them.

---

```python
@aDecorator('anArgument')
def aFunction(args):
  print 'I do stuff on %r!' % (args,)
```

  * This syntax is actually just calling a function and taking the return value of that function as the decorator.

```python
myDecorator = aDecorator('anArgument')

def aFunction(args):
  print 'I do stuff on %r!' % (args,)

aFunction = myDecorator(aFunction)
```

---

```python ((ex05_inc.py))
```

---

```python ((ex05.py))
```

--

```python <<ex05.py>>
```

---

layout: true
template: decorators
name: decorators-classes

## Implementation (Invokable Classes):

---

layout: true
template: decorators-classes

  * A decorator can also be defined via a class.

---

```python ((ex06_inc.py))
```

---

```python ((ex06.py))
```

--

```python <<ex06.py>>
```

---

template: decorators

## Excercise

  * Create a decorator that generates debug logging output for any function or method decorated with it.
    * Output should at a minimum contain the following:
      1. The function's name.
      2. The function's arguments (outputted before function execution).
      3. The function's return value (outputted after function execution).
  * Try to utilize Python's builtin logging mechanism for this.
    * If you have trouble with Python logging, then use print statements for now, we will fix it next session.
