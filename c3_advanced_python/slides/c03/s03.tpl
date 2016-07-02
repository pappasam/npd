layout: true
name: extend-classes

# Extending Classes

---

## An Overview of New Style Classes

  * All classes ultimately inherit from the `object` type:

```python
class MyClass(object):
  pass
```

  * In Python 3.0, this is assumed, thus the following is equivalent:

```python
class MyClass:
  pass
```

  * However, this is not the case for Python 2.x.
    * It is recommended that the explicit definition is always used for compatbility and consistency.

---

layout: true
template: extend-classes
name: difference-extend-classes

## Old Style Verus New Style

  * Remember, this only applies to Python 2.x.

  * In old style classes, all instances have the same type, `instance`.

  * With new style classes, the instance's type is it's class.

---

```python ((ex01.py))
```

---

```python <<ex01.py>>
```

---

template: difference-extend-classes

  * Why do we prefer new style classes?
    * New style classes have improved support for multiple inheritance.

---

template: extend-classes

## Method Inheritance

  * When a class extends another class, it obtains the parent class's methods.

```python ((ex02.py))
```

--

```python <<ex02.py>>
```

---

layout: true
template: extend-classes
name: overriding-methods

## Overriding Methods

---

  * A child class can override a method defined the parent's class.

```python ((ex03.py))
```

--

```python <<ex03.py>>
```

---

  * A child class can explicitly call the method it overrides.

```python ((ex04.py))
```

--

```python <<ex04.py>>
```

---

  * This is commonly used when an extended instance needs to initialize it's parent as well.

```python ((ex05.py))
```

--

```python <<ex05.py>>
```

---

layout: true
template: extend-classes
name: multiple-inheritance

## Multiple Inheritance

  * A class can inherit (extend) from multiple classes.
  * A class that is inherited from multiple classes has access to methods implemented within each parent class.

---

```python ((ex06.py))
```

---

```python <<ex06.py>>
```

---

layout: true
template: extend-classes
name: multiple-problems

## Multiple Inheritance: The Diamond Problem

---

  * Multiple inheritance can generate ambiguities as to how something is inherited.
  * Consider the following.

```python ((ex07.py))
```

---

layout: true
template: multiple-problems

  * This is why the `super` function was implemented for new style classes.
  * What is returned by `super`?

---

```python ((ex08.py))
```

--

```python <<ex08.py>>
```

---

    * The `super` function returns a proxy object to resolve issues related to multiple inheritance.
    * When an attribute is accessed from the proxy object, it follows a Method Resolution Order (MRO) to determine which parent to resolve from.
      * N.B.: Python uses C3 Linearization to determine the MRO.

---

layout: true
template: multiple-problems

Let's revisit our provious example:

---

```python ((ex07.py))
```

---

```python <<ex07.py>>
```

---

layout: true
template: multiple-problems

  * How can we determine which method will be resolved by `super`?
    * Examine the object's MRO.

---

```python ((ex09.py))
```

---

```python <<ex09.py>>
```

--

  * How does the method `my_method` get resolved?
    * Python's new style classes follows this MRO order until it finds a method to resolve.
    * Note since we are explicitly calling `super` in `Child`'s `my_method`, the actual resolution order is:
      * `Parent`
      * `AnotherParent`

---

template: multiple-problems
name: mro-description

  * Python's MRO can be summed up as follows:
    * Try the first ancestor class.
      * Continue up the ancestor's hierarchy.
    * If a type can be found as a super type of a sibling, stop recursing the branch and try the successive ancestor class.
      * Use the order as defined in the class declaration, from left to right.

---

template: mro-description

  * From our previous example:
    * Python first tries the class `Parent`, then examines `Parent`'s ancestor, `object`.
      * Since `object` is also a super class of `AnotherParent`, recursion on class `Parent` stops.
    * Python then continues with the second ancestor of `Child`, which is `AnotherParent`.
    * Finally, the last class to resolve is the common ancestor, `object`.

---

layout: true
template: extend-classes
name: more-problems

## Multiple Inheritance: Ambigious Resolution

  * Python's `super` function does not like redundant inheritance.

---

```python ((ex10.py))
```

---

```python <<ex10.py>>
```

--

  * Tip: Do not inherit from a class if inheriting from another class that is already a subclass.
    * In this case, there is no reason to define `Child` as inheriting from `Root` since `Parent` already inherits from it.

---

template: extend-classes

## Multiple Inheritance: Initialization Problem

  * The `super` function only finds and returns the first attribute (method) in the resolution order.
    * What happens when multiple classes need to be initialized?

```python ((ex11.py))
```

--

```python <<ex11.py>>
```

---

layout: true
template: extend-classes
name: work-arounds

## Multiple Inheritance: Mix-In Strategy

---

  * A Mix-In class implement methods that can be included into any class to implement functionality into that class.
    * A Mix-In should not be part of any inheritance heirarchy.

--

```python ((ex12_inc.py))
```

---

```python ((ex12.py))
```

--

```python <<ex12.py>>
```

---

template: extend-classes

## Excercise

  * Create a Mix-In class that implements the ability to convert an inheriting class to JSON.
    * Mix-In should implement the method `to_json` that returns a json string of the object.
  * Apply this Mix-In class to your extended Python dictionary to enable your dictionary to return a JSON version of itself when the `to_json` method is called.
