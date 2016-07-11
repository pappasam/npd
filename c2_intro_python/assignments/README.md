# Rules for assignments

Welcome to the course 2 assignments. Please read this document before proceeding to any of the assignments, as it contains valuable information that will prevent headache for both you and your instructor.

## Name repositories with the following convention

npd_c2_a(ASSIGNMENT_NUMBER_GOES_HERE)

For example, assignment one's repository should be called *npd_c2_a1*. Assignment two's repository should be called *npd_c2_a2*. And so on.

## Every assignment repository should contain a .gitignore with the following information

```txt
venv/
__pycache__/
*.swp
```

## Use a different virtual environment, named venv, for each assignment

Place your virtual environment in the same repository as your main python script.

```sh
# From the location of main.py, or its equivalent
virtualenv -p python3.4 venv
source venv/bin/activate
```

## Store a record of your dependencies in the same directory as your virtual environment

```sh
source venv/bin/activate
pip freeze > requirements.txt
```
