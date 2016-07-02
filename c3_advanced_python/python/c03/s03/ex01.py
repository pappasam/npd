class OldStyleClass:
  pass

class AnotherOldStyleClass:
  pass

class NewStyleClass(object):
  pass

class AnotherNewStyleClass(object):
  pass

print 'type of OldStyleClass instance: %r' % type(OldStyleClass())
print 'type of AnotherOldStyleClass instance: %r' % type(AnotherOldStyleClass())
print 'type of NewStyleClass instance: %r' % type(NewStyleClass())
print 'type of AnotherNewStyleClass instance: %r' % type(AnotherNewStyleClass())
