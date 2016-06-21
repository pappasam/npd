# CSV, JSON, YAML

What are they, and why do we care?


# Markup languages

"A markup language is a system for annotating 
a document in a way that is syntactically 
distinguishable from the text. The idea and 
terminology evolved from the 'marking up' of 
paper manuscripts, i.e., the revision instructions 
by editors, traditionally written with a blue 
pencil on authors' manuscripts." -Wikipedia


# Examples

* HTML
* Markdown (this presentation)
* RST
* LaTeX
* Wiki markup
* Many, many more


# Data

Data storage syntax is a grey area.

* It contains markup
* It represents a data structure

Don't worry too much about the distinction yet, 
just be aware that there is one.

JSON and YAML are data storage syntaxes, like CSV.


# CSV

Comma-separated values

One of the oldest file formats


# Example

```txt
"title","length","enjoyable"
"Lawrence of Arabia",228,true
"Gigli",121,false
```


# Gotchas

* Commas may be in a field
* Formatting varies widely
* Unsuitable for complex data structures


# JSON

Javascript Object Notation

Like a python dictionary with stricter syntax


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


# Gotchas

* Must use double-quotes
* No trailing commas
* White space does not matter


# YAML

Initially: Yet Another Markup Language

Revised: YAML Ain't Markup Language

Like JSON, but without curly braces and double quotes


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


# Gotchas

* Spacing matters
* Dashes for lists can be confusing
* Not supported in Python standard library
