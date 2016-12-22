# Unit testing Flatland

## Introduction - a familiar scenario

Although your Flatland shape classes worked fine for your project, they may not work well with someone else's project. If another programmer reuses your shape class, you want to ensure each class achieves what you think it does. This is a perfect time to practice Unit testing!

## Minimum requirement for full credit

* Create a new git repository with the following structure

```txt
npd_c2_a3/
  classes.py
  tests.py
```

* Implement a passing unit test for at least one method in each of the three shape classes
  * Use the unittest module
  * All unit tests shoudld be runnable using the nosetests command line utility

## Challenge requirements

1. Unit test all methods
1. Refactor unit tests to repeat as little code as possible
1. Look into the hypothesis testing framework
  * https://hypothesis.readthedocs.io/en/latest/
1. Write unit tests for other assignments
