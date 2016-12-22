class ImAnIterator(object):

  def __init__(self, limit):
    self.limit = limit
    self.cnt = 0

  def next(self):
    if self.cnt > self.limit:
      raise StopIteration()
    try:
      #Now we will only return self, which will have a string value.
      return self
    finally:
      self.cnt +=1

  def __str__(self):
    return 'My value is %s' % (self.cnt-1) #Adjust for earlier increment!

  def __repr__(self):
    return '<Iterator with limit of %s>' % self.limit

class ImIterable(ImAnIterator):

  def __iter__(self):
    return self

_iter = ImIterable(5)
print 'this object is %r' % _iter #Use %r to specify the repr value.
for i in _iter:
  print i #This now calls ImAnIterator.__str__().
print 'Iteration done!'
