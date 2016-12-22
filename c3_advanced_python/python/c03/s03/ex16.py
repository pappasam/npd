from ex16_inc2 import Root, Parent, SecondParent, Child

print 'Attributes in Root:'
for i in ('a', 'b', 'c'):
  print '%s: %r' % (i, getattr(Root, i, None))

print 'Attributes in Parent:'
for i in ('a', 'b', 'c'):
  print '%s: %r' % (i, getattr(Parent, i, None))

print 'Attributes in SecondParent:'
for i in ('a', 'b', 'c', 'd'):
  print '%s: %r' % (i, getattr(SecondParent, i, None))

print 'Attributes in Child:'
for i in ('a', 'b', 'c', 'd'):
  print '%s: %r' % (i, getattr(Child, i, None))
