class ImAnIterator(object):

  def __init__(self, limit):
    self.limit = limit
    self.cnt = 0

  def next(self):
    if self.cnt > self.limit:
      raise StopIteration()
    try:
      return self.cnt
    finally:
      self.cnt +=1

_iter = ImAnIterator(5)
while True:
  try:
    print 'My iter value is %s' % _iter.next()
  except StopIteration, si:
    print 'Iteration done!'
    break
