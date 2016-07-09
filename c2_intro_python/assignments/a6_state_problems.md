# Functional Programming

## Introduction

Functional programming is easy to present in a classroom environment because it lends itself to succinct problems. As such, see below for some succinct problems.

## Minimum requirements for full credit

Solve the following three problems without importing any modules.

1. Write a function called *filter_custom* that takes two arguments: l (list) and f (a function that takes one argument). filter_customshould return a new list that contains all the elements e of l for which f(e) is True
1. Write a function called *map_custom* takes two arguments: l (list) and f (a function that takes one argument). map_custom should return a new list that applies f(e) for every element e in l.
1. Write a function called *reduce_custom* that takes three arguments: l (list), f (a function that takes two arguments), and starting_value. reduce_custom should return a single value that applies f(v, e) for every e in l from left to right. The initial value for v should be starting_value, and subsequent values should be the previously calculated value from f(v, e).

## Challenge requirements

1. Solve the above three problems using functionsin the itertools library
1. Write a function that takes two lists and returns a new list containing elements that were not found in either list.
  * Hint: explore the *set* data structure. How does this differ from a list?
1. Write a class called List that stores data like a normal python list but that also has map, filter, and reduce as methods (with the same functionality as above).
