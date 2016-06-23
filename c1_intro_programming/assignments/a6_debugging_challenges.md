# Debugging Challenges

Being able to understand code is often more difficult than writing it. It is an
invaluable skill

## Assignment

What is incorrect or faulty about the following code snippets? Submit corrected
versions of these code samples.  

### Homemade `cat`

def printFile(filePath):
    f = file(filePath)
    contents = f.read()
    printContents()

def printContents():
    print("Contents of " + filePath)
    print(contents)
    

### Exception Ordering

def divideAndConquer(argA, argB):
    return argA / argB
    if argB == 0:
        raise ZeroDivisionError("Woops, divided by zero")


