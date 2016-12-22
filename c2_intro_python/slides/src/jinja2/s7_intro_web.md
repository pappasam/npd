{% extends "base.html" %}

{% block title %}
# Web Programming
{% endblock %}

{% block main %}

# Today's topics

* Web programming in general
* Python for web programming
* Flask

---

# World wide web != internet

## Internet

The global system of interconnected computer networks that use the Internet protocol suite (TCP/IP) to link billions of devices worldwide. - Wikipedia

## World wide web

An information space where documents and other web resources are identified by URLs, interlinked by hypertext links, and can be accessed via the Internet. - Wikipedia

---

# Server-client relationship

## Server

* Provides a service
* Perpetually awaits requests

## Client

* Requests a service from a server

---

# HTTP

## Definition

* Hypertext Transfer Protocol
* Foundation for data communication for the world wide web

---

## HTTP Methods

## Common methods

* GET
* POST
* PUT
* DELETE
* HEAD

## Less common methods

* OPTIONS
* CONNECT
* TRACE
* PATCH

---

# Language choices

## Client-side

Javascript

## Server-side

* Java
* Python
* Haskell
* Any other programming language

---

# Why Python?

## Pros

* Fast development
* Readable, modular code
* Handles strings intelligently (Python 3 only)

## Cons

* Slow
* No threading
* Different language than front-end

---

# Flask

* Extendible
* Micro-framework
* Modular

---

# Simple application

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def helloworld():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(port=5000, debug=True)
    # Navigate the localhost:5000
```

---

# Flask made simple

1. Build application object
1. Run application object
1. Make http requests to URL endpoint where Flask application is exposed

---

# Building application object

```python
from flask import Flask

# Create object
app = Flask(__name__)

# Assign route to object
@app.route('/helloworldendpoint')
def helloworld():
    return 'Hello, World!'
```

---

# Running application object

```python
# Run application on port 5000
app.run(port=5000, debug=True)
```

---

# Make http requests to endpoint

## In web browser

http://localhost:5000/helloworldendpoint

## HTTP Translation

GET http://localhost:5000/helloworldendpoint

---

# Additional information

* There is a lot more to know about Flask and web programming
* This is all you need to know for this course
* For more information, see Flask documentation

{% endblock %}
