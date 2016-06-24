# How this works:

External source code files are located in python/course/session/name.py.

The following, when placed into the tpl file located at slides/c03/s01.tpl
will inject the external file into the md document located at python/c03/s01/ex01.py:

```python ((ex01.py))
```

# To build a tpl to an md file:

execute the build.sh script on the tpl file with this package's root as the PWD:

bash build.sh slides/c03/s01.tpl

This will create an md file located at slides/c03/s01.md

Use this file with markdown-to-slides, etc. to complete document.
