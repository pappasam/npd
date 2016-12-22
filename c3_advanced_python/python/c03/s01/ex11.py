stuff = [ '1', '11', '2', '222', '4', '356', '5603' ]

print 'default sort:'
print sorted(stuff)

print 'sort by int value of string:'
print sorted(stuff, key=lambda x: int(x))
