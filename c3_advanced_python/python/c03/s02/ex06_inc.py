class aDecorator(object):
  def __init__(self, func):
    self.func = func

  def __call__(self, *args, **kwargs):
    #Note: decorators should be able to accept
    #any arguments that may be passed to original method or function.
    print 'I am executing before method call %s!' % self.func.func_name
    #Execute original method with intended arguments:
    _ret = self.func(*args, **kwargs)
    print 'I am executing after method call %s!' % self.func.func_name
    #Be sure to return original methods results:
    return _ret

@aDecorator
def mySumFunction(arg1, arg2):
  print 'Summing up %r and %r: %r!' % (arg1, arg2, arg1+arg2)
  return arg1+arg2

@aDecorator
def myProductFunction(arg1, arg2):
  print 'Multiplying %r and %r: %r!' % (arg1, arg2, arg1*arg2)
  return arg1*arg2
