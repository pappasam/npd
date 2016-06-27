{% extends "base.html" %}

{% block title %}
# Functional programming
{% endblock %}

{% block main %}

# Today's topics

* State
* Functional programming

---

# State - technical definition

All the stored information, at a given instant of time, to which your program has access

---

## State - example

* Action 1: Ten people enter a room
  * State 1: a room with 10 people
* Action 2: One more person comes into the room
  * State 2: a room with 11 people
* Action 3: One person transforms into a tiger
  * State 3: a room with 10 people and 1 tiger
* Action 4: the tiger eats everyone in the room
  * State 4: a room with one tiger

---

# Why care about state?

1. Programs exist to alter state
1. Simple == good, and state is often complex
1. Certain programming styles simplify reasoning through state, others do not

---

# Mutation vs reassignment

```python
# Example mutation
a_list = [1, 2, 3]
a_list.append(12)
a_list.pop(0)

# Example reassignment
a_string = "hello"
a_string = a_string + " world"
```

---

# Definitions (for our purposes)

## Reassignment

* Changing a variable's assigned value and changing its reference
* Easy to spot, easy to avoid


## Mutation

* Changing a variable's assigned value while maintaining its reference
* Harder to spot, but also easy to avoid

---

# Sample problem

Take a list of n elements and a number X.
If the number of elements is divisible by 7,
then remove the first element from the list
and add X to the end of the list twice.
Otherwise, simply append X to the end of the list.

---

# Mutation leads to complexity

```python
def lucky_sum(lst, number):
    if len(lst) % 7 == 0:
        lst.pop(0)
        lst.append(number)
        lst.append(number)
    else:
        lst.append(number)
    return sum(lst)

l0 = [1, 123, 531, 9, 126]
sum_1 = lucky_sum(l0, 123)
sum_2 = lucky_sum(l0, 1255)
sum_3 = lucky_sum(l0, 18)
sum_4 = lucky_sum(l0, 7823)
sum_5 = lucky_sum(l0, 123)
```

---

# Avoiding mutation

```python
def lucky_sum(lst, number):
    newlst = lst[1:] + [number, number] \
        if len(lst) % 7 == 0 else lst + [number]
    return newlst, sum(lst)

l0 = [1, 123, 531, 9, 126]
l1, sum_1 = lucky_sum(l0, 123)
l2, sum_2 = lucky_sum(l1, 1255)
l3, sum_3 = lucky_sum(l2, 18)
l4, sum_4 = lucky_sum(l3, 7823)
l5, sum_5 = lucky_sum(l4, 123)
```
---

# Mutation and reassignment

## Final remarks

* mutation != reassignment, although both should be avoided
* Mutation and reassignment are easy
* All references can be reassigned
* Most objects can be mutated
  * strings and tuples are notable exceptions

---

# Functional programming definition

Treat computation as the evaluation of mathematical functions. Values flow from one function to the next

---

# Functional programming effect

Eliminates explicit reassignment and mutation from your code

---

# Key functional programming concepts

* map
* reduce
* filter
* functions as values

Most importantly, all of these return new data and references

---

# Map, reduce, filter

## Map

Doing something to every item in a collection, returning a new collection

## Reduce

Collapsing a collection, returning a smaller result (like sum, which takes an iterable and returns an integer)

## Filter

Remove items from a collection, returning a new collection

{% endblock %}
