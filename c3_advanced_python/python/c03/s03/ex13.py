#The following is equivalent to
#class inline_class(object):
#  attr = 4
#  def method(self):
#    return self.attr
inline_class = type('inline_class', (), {'attr': 4, 'method': lambda self: self.attr})

print 'inline_class: %r' % inline_class

inst = inline_class()
print 'method return: %s' % inst.method()
