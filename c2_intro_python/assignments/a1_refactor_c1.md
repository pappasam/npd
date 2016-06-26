# Refactor assignments from course 1

## Introduction

The course 1 numerical problem solving challenges gave you a taste for problem-solving with a programming language. This taste involved control flow, variable assignment, data organization, and computation. That said, it did little to challenge you in another, arguably more important, aspect of programming: abstraction. This assignment challenges you to abstract the code from course 1 so that your mild-mannered instructor can more easily wrap his head around your solution.

## Assignment

1. Select one solution script from the course 1 problem solving exercises.
1. Copy it into a file called SCRIPT_NAME_refactored.py
  * SCRIPT_NAME is the name of the original script, sans ".py"
1. At the top of the source code, create a module doc string with the following
  * The main question your program tries to answer, written in English
  * The sub questions you need to answer to solve the main problem
  * The sub questions you must answer to solve each sub question
  * Continue in this vein until you have reached ideas you consider "primitive"
1. Now translate these questions into separate Python functions
1. Write a final main function called "main"
  * Takes no arguments
  * Combines your user-defined functions
  * Prints the correct answer to the terminal
1. Run this function

As usual, the above assignment represents the minimum your must accomplish to achieve full credit on this assignment. When you've reached a stopping point on one file, move on to another, then another.

## Example

```python
'''Refactored exercise for some assignment in course

Question:
Find the difference between the cube of the sums and
the sum of cubes for the first 50 natural numbers

Sub questions
* What is a number, cubed?
* What is the sum of numbers?
* What is the difference between two numbers?
* What are the first 50 natural numbers?
'''

def cubed(number):
    '''Get a number, cubed

    :param number: INT an integer
    '''
    return number**3

def numbers_cubed(numbers):
    '''Cube many numbers

    :param numbers: LIST[INT]
    '''
    l = []
    for n in numbers:
        l.append(cubed(n))
    return l

def sum_numbers(numbers):
    '''Sum a list of numbers

    :param numbers: LIST[INT]
    '''
    return sum(numbers)

def first_natural_numbers(n):
    '''Return the first n natural numbers

    :param n: INT the largest natural number returned
    '''
    l = []
    for n in range(1, n + 1):
        l.append(n)
    return l

def difference(n1, n2):
    '''Return the difference between two numbers

    :param n1: INT the number from which n2 is subtracted
    :param n2: INT the number subtracted from n1
    '''
    return n1 - n2

def main():
    first_50 = first_natural_numbers(50)
    first_50_cubed = numbers_cubed(first_50)

    sum_first_50 = sum_numbers(first_50)
    sum_first_50_cubed = sum_numbers(first_50_cubed)

    cubed_sum_first_50 = cubed(sum_first_50)

    answer = difference(cubed_sum_first_50, sum_first_50_cubed)
    print(answer)

if __name__ == '__main__':
    main()
```
