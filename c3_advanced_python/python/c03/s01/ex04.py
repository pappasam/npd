def generator(limit):
  cnt = 0
  while cnt <= limit:
    #Each iteration will return the current value of cnt.
    yield cnt
    #On the next iteration call, the python interpretter
    #resumes execution after each yield statement.
    cnt += 1
  #When the iteration is exhausted, return from the function.
  return

for i in generator(5):
  print 'My iter value is %s' % i
print 'Iteration done!'
