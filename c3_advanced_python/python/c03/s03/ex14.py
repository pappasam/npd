registry = {}

class Registry(type):

  def __new__(cls, name, bases, dct):
    _class = super(Registry, cls).__new__(cls, name, bases, dct)
    registry[name] = _class
    return _class

class A(object):
  __metaclass__ = Registry

class B(A):
  pass

class C(A):
  pass

print 'registry: %r' % registry
