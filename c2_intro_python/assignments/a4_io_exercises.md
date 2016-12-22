# Input / Output

## Introduction

Python excels at the following workflow:
  1. Read data from a plain text file into RAM
  1. Operate on this data, transforming it and comparing with with data in other files
  1. Write this data to a plain text file

There are plenty of third party tools and libraries that abstract the reading and writing of files, but it's quite simple to do everything using base python.

This assignment is intended to give you practice writing JSON and YAML files, reading them into Python, and processing their result, and writing a result back to disk.

## Information

For this assignment, we care about the following information:

* First name
* Last name
* Month of birth
* Year of birth
* Favorite color
* Favorite movie

## Requirements for full credit

### Create a new git repository with the following structure

```txt
npd_c2_a4/
  input.csv
  input.json
  input.yaml
  main.py
```

### In your .gitignore, add the following line

```txt
output.*
```

### Actions

* Store information for three different hypothetical people in three different input datasets, formatted in the same way as their extensions:
  * input.csv (comma separated values)
  * input.json
  * input.yaml
* For each file
  * Create a python dictionary that stores the information from the three files
    * {'first_name': VALUE, 'last_name': VALUE, etc...}
* Combine each file's dictionary into one dictionary with top-level key:
  * {'csv', 'json', 'yaml'}
* Export the contents of all three datasets into
  * output.csv
  * output.json
  * output.yaml
