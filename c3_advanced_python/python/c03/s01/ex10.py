def root_function(limit):

  cnt = {}

  def count():
    for i in xrange(limit):
      print 'cnt: %s, limit: %s' % (i, limit)
    cnt['cnt'] = (cnt.get('cnt', 0) + 1)
    print 'counter: %d' % cnt['cnt']

  return count

print 'root function returns %r' % root_function(7)
func = root_function(3)
for x in xrange(3):
  print 'calling function for the %d time' % (x+1)
  func()
print 'new state is created when root_function is called again:'
root_function(4)()
