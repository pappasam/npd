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

class ImIterable(object):

  def __init__(self, limit):
    self.iter = ImAnIterator(limit)

  def __iter__(self):
    return self.iter

for i in ImIterable(5):
  print 'My iter value is %s' % i
print 'Iteration done!'
