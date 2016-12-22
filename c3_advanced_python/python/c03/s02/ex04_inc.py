def aDecorator(func):
  def _func(*args, **kwargs):
    #Note: decorators should be able to accept
    #any arguments that may be passed to original method or function.
    print 'I am executing before method call %s!' % func.func_name
    #Execute original method with intended arguments:
    _ret = func(*args, **kwargs)
    print 'I am executing after method call %s!' % func.func_name
    #Be sure to return original methods results:
    return _ret
  return _func

@aDecorator
def mySumFunction(arg1, arg2):
  print 'Summing up %r and %r: %r!' % (arg1, arg2, arg1+arg2)
  return arg1+arg2

@aDecorator
def myProductFunction(arg1, arg2):
  print 'Multiplying %r and %r: %r!' % (arg1, arg2, arg1*arg2)
  return arg1*arg2
