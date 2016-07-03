from ex16_inc import SetAttrs

class Root(object):
  __metaclass__ = SetAttrs

  a = 'an attribute'
  b = ['data in a list']
  c = {'a': 'an attr in a dict', 'b': 'another attr in the dict'}

class Parent(Root):

  a = 'an overridden attribute'
  b = ['more data in a list']
  c = {'b': 'an overridden attr in the dict', 'c': 'a new attr in the dict'}

class SecondParent(Root):

  b = ['more data']
  d = set(('abc',))

class Child(Parent, SecondParent):

  c = {'d': 'an attr defined in child'}
  d = set(('def',))
