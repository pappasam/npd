class MixIn(object):

  def mixInStuff(self):
    print 'I Implement mix-in stuff!'

class SecondMixIn(object):
  def secondMixInStuff(self):
    print 'I Implement second mix-in suff!'

class ThirdMixIn(object):
  def thirdMixInStuff(self):
    print 'I Implement third mix-in stuff!'

class A(MixIn, SecondMixIn):
  pass

class B(MixIn, ThirdMixIn):
  pass

class C(SecondMixIn, ThirdMixIn):
  pass
