class IHaveAStaticMethod(object):

  @staticmethod
  def iAmStatic(anArg):
    print 'I am a static method!\n(Your arg is: %r)' % (anArg,)

print 'I can call the method directly from the class:'
IHaveAStaticMethod.iAmStatic('blah!')
print 'Or I can call it from an instance of the class:'
staticMethodInst = IHaveAStaticMethod()
staticMethodInst.iAmStatic(('I am a', 'tuple'))
