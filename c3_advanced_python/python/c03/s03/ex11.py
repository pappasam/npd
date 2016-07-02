from pprint import pprint

class Parent(object):

  def __init__(self):
    print 'Initializing Parent'

class AnotherParent(object):

  def __init__(self):
    print 'Initializing AnotherParent'

class Child(Parent, AnotherParent):

  def __init__(self):
    # Only one parent will get initialized!
    super(Child, self).__init__()
    print 'Initializing Child'

instance = Child()
