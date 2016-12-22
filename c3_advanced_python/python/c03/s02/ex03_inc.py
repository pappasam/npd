class ClassWithFactoryFunction(object):

  def __init__(self, a):
    self.a = a

  def _serialize(self):
    return {'a': self.a}

  @classmethod
  def _copy_function(cls, obj=None):
    return cls(**obj._serialize()) if obj is not None else cls()

  def makeCopy(self):
    return self._copy_function(self)

  def __eq__(self, obj):
    return type(self) == type(obj) and self.a == obj.a

class ExtendedClassWithFactoryFunction(ClassWithFactoryFunction):

  def __init__(self, a, b):
    self.b = b
    super(ExtendedClassWithFactoryFunction, self).__init__(a)

  def _serialize(self):
    _srl = super(ExtendedClassWithFactoryFunction, self)._serialize()
    _srl.update({'b': self.b})
    return _srl

  def __eq__(self, obj):
    return super(ExtendedClassWithFactoryFunction, self).__eq__(obj) and self.b == obj.b
