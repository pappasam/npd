from pprint import pprint

class Root(object):
  pass

class Parent(Root):
  pass

class AnotherParent(object):
  pass

class Child(Root, Parent, AnotherParent):
  pass

instance = Child()

print 'instance\'s MRO:'
pprint(type(instance).__mro__)
