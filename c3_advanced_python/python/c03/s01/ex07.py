def root_function(limit):

  def count(cnt):
    for i in xrange(cnt):
      #Outside scope variable, limit is accessible in here!
      print 'cnt: %s, limit: %s' % (cnt, limit)

  for j in xrange(limit):
    count(j)

root_function(4)
