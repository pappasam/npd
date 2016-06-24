def root_function(limit):

  def count():
    for i in xrange(limit):
      print 'cnt: %s, limit: %s' % (i, limit)

  return count

print 'root function returns %r' % root_function(7)
func = root_function(3)
print 'calling function returned by root_function(8)'
func()
print 'Can be called on same line:'
root_function(4)()
