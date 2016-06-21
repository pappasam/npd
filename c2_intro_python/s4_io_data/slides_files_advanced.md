# Files

"A resource for storing information that is available 
to a computer program and is usually based on some kind 
of durable storage" - Wikipedia

In Python:

* Files are an idea, like classes or objects
* File objects expose file-oriented APi, nothing more


# File actions

1. Read
1. Write
1. Execute


# Linux filetypes

Everything is a file

1. Regular
1. Directory
1. Link
1. Special
1. Socket
1. Pipe


# Python filetypes

Everything is an object. 
Therefore, files are objects.

1. Raw binary
1. Buffered binary
1. Text


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


# Context Manager
## Explained

Any class can be made into a context manager 
if it has the following two methods:

```python
def __enter__(self)
    # what to do before context begins
    # what object to bind context to

def __exit__(self, exit_type, exit_value, exit_trace):
    # what to do when context terminates
    # how to terminate the context
```

Context managers can be used with the "with" statement


# Context Manager
## Example

Manage the context of some interaction so cleanup occurs.

```python
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
