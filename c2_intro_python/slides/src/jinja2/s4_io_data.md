{% extends "base.html" %}

{% block title %}
# Filetypes: CSV, JSON, YAML
# Files in general
{% endblock %}

{% block main %}

# CSV, JSON, YAML

What are they, and why do we care?

---

# Markup languages

"A markup language is a system for annotating
a document in a way that is syntactically
distinguishable from the text. The idea and
terminology evolved from the marking up of
paper manuscripts, i.e., the revision instructions
by editors, traditionally written with a blue
pencil on authors' manuscripts." -Wikipedia

---

# Examples

* HTML
* Markdown (this presentation)
* RST
* LaTeX
* Wiki markup
* Many, many more

---

# Data

Data storage syntax is a grey area.

* It contains markup
* It represents a data structure

Don't worry too much about the distinction yet,
just be aware that there is one.

JSON and YAML are data storage syntaxes, like CSV.

---

# CSV

Comma-separated values

One of the oldest file formats

---

# Example

```txt
"title","length","enjoyable"
"Lawrence of Arabia",228,true
"Gigli",121,false
```

---

# Gotchas

* Commas may be in a field
* Formatting varies widely
* Unsuitable for complex data structures

---

# JSON

Javascript Object Notation

Like a python dictionary with stricter syntax

---

# Example

```txt
{
  "movies": [
    {
      "title": "Lawrence of Arabia",
      "length": 228,
      "enjoyable": true
    },
    {
      "title": "Gigli",
      "length": 121,
      "enjoyable": false
    }
  ],
  "creatures": ["Tiger", "Bear", "Cat"]
}
```

---

# Gotchas

* Must use double-quotes
* No trailing commas
* White space does not matter

---

# YAML

Initially: Yet Another Markup Language

Revised: YAML Ain't Markup Language

Like JSON, but without curly braces and double quotes

---

# Example

```txt
movies:
  - title: Lawrence of Arabia
    length: 228
    enjoyable: true
  - title: Gigli
    length: 121
    enjoyable: false
creatures:
  - Tiger
  - Bear
  - Cat
```

---

# Gotchas

* Spacing matters
* Dashes for lists can be confusing
* Not supported in Python standard library

---

# Files

"A resource for storing information that is available
to a computer program and is usually based on some kind
of durable storage" - Wikipedia

In Python:

* Files are an idea, like classes or objects
* File objects expose a file-oriented API, nothing more

---

# File actions

1. Read
1. Write
1. Execute

---

# Linux filetypes

Everything is a file

1. Regular
1. Directory
1. Link
1. Special
1. Socket
1. Pipe

---

# Python filetypes

Everything is an object. Therefore, files are objects.

1. Raw binary
1. Buffered binary
1. Text

---

# Context

File-like objects lend themselves to context managers

```python
with open('newfile.txt', 'w') as f_write:
    # In write-only context for open file newfile.txt
    f_write.write('What a wonderful line\n')
# File is now closed, context has exited

with open('newfile.txt', 'r') as f_read:
    # In read-only context for open file newfile.txt
    contents = f_read.read()
# File is now closed, context has exited
```

---

# Context Manager - overview

Any class can be made into a context manager if it has the following two methods:

```python
def __enter__(self)
    # what to do before context begins
    # what object to bind context to

def __exit__(self, exit_type, exit_value, exit_trace):
    # what to do when context terminates
    # how to terminate the context
```

Context managers can be used with the "with" statement

---

# Context Manager - example

```python
# Manage the context of some interaction so cleanup occurs
from databaseclass import Conn
class Connection(object):
    def __init__(self, ip_address, password):
        self.ip_address = ip_address
        self.password = password

    def __enter__(self):
        self.conn = Conn(self.ip_address, self.password)
        return self.conn

    def __exit__(self, exit_type, exit_value, exit_trace):
        # could have used (self, *args):
        self.conn.close()

# Now, we can use it "with" style :p
with Connection("10.0.0.1", "surfervictory") as myconn:
    # Now we have a connection
    result = myconn.query()
    myconn.post("I did a query")
# Now the connection is closed
```

{% endblock %}
