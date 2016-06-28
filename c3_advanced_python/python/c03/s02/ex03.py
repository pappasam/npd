from ex03_inc import ClassWithFactoryFunction, ExtendedClassWithFactoryFunction

inst1 = ClassWithFactoryFunction('An Attribute')
inst1Cpy = inst1.makeCopy()
print 'is inst1Cpy the same object as inst1? %r' % (inst1 is inst1Cpy)
print 'is inst1Cpy equal to inst1? %r' % (inst1 == inst1Cpy)

inst2 = ExtendedClassWithFactoryFunction('An Attribute', 'Another Attribute')
inst2Cpy = inst2.makeCopy()
print 'is inst2Cpy the same object as inst2? %r' % (inst2 is inst2Cpy)
print 'is inst2Cpy equal to inst2? %r' % (inst2 == inst2Cpy)

print 'is inst1 equal to inst2? %r' % (inst1 == inst2)
