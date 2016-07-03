from ex14 import registry

for i in ('A', 'B', 'C'):
  inst = registry.get(i, lambda: None)()
  print 'inst: %r' % inst
