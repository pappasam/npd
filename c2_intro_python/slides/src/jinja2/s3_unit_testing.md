{% extends "base.html" %}

{% block title %}
# Unit Testing
{% endblock %}

{% block main %}

# Today's topics

* Unit testing in general
* Unit testing with unittest
* Nose

---

# Definition

Separately testing the smallest testable parts of an application

---

# Motivation

Ensures your code:

* Is written as a collection of building blocks
* Works in isolation from the broader system
* Works as documented

---

# Does not...

* Ensure a system works
* Test your main module
* Make up for a bad design

---

# Structure

```python
# Taken from https://docs.python.org/3.4/library/unittest.html

from unittest import TestCase  # bring in unit testing module

class TestStringMethods(TestCase):  # inherit from TestCase

  def test_upper(self):
      self.assertEqual('foo'.upper(), 'FOO')

  def test_isupper(self):
      self.assertTrue('FOO'.isupper())
      self.assertFalse('Foo'.isupper())

  def test_split(self):
      s = 'hello world'
      self.assertEqual(s.split(), ['hello', 'world'])
      # check that s.split fails when the separator is not a string
      with self.assertRaises(TypeError):
          s.split(2)

if __name__ == '__main__':
    unittest.main()
```

---

# Directory

## This directory structure organizes unit tests by module

```txt
testrepo/
  src/
    assertions.py
    build.py
    subprocess_extension.py
  tests/
    test_assertions.py
    test_subprocess_extension.py
```

---

# Nose

* Running one unit test is easy
* Running them all is hard
* Enter nose

```sh
cd project_directory
source venv/bin/activate
pip install nose

# run all tests in project directory
nosetests
```

{% endblock %}
