class ImIterable(object):

  def __init__(self, limit):
    self.limit = limit
    self.cnt = 0

  def next(self):
    if self.cnt > self.limit:
      self.cnt = 0 #Need to reset state!
      raise StopIteration()
    try:
      return self.cnt
    finally:
      self.cnt +=1

  def __iter__(self):
    return self

  def __call__(self, cnt):
    self.cnt = cnt
    return self

_iter = ImIterable(5)
for i in _iter:
  print 'My iter value is %s' % i
print 'New iteration starting from 2:'
for i in _iter(2): #Calling _iter.__call__ with cnt of 2.
  print 'My iter value is %s' % i
print 'Iterations done!'
