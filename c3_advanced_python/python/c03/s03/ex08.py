class MyClass(object):
  pass

class MyChildClass(MyClass):
  pass

print 'super returns: %r' % super(MyChildClass, MyChildClass())

print 'type of super returned: %r' % type(super(MyChildClass, MyChildClass()))
