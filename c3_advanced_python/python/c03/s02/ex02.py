class IHaveAClassMethod(object):

  @classmethod
  def iAmAClassMethod(classobj):
    print 'My classobj: %r' % classobj

class IExtendAClassMethod(IHaveAClassMethod):
  pass

print 'Class Methods can be called statically:'
IHaveAClassMethod.iAmAClassMethod()
print 'Or called from an instance:'
iHaveInst = IHaveAClassMethod()
iHaveInst.iAmAClassMethod()
print 'When Called on an extended class:'
IExtendAClassMethod.iAmAClassMethod()
