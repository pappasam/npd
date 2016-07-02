class Parent(object):

  def __init__(self):
    print 'Parent is initialized'

class Child(Parent):

  def __init__(self):
    super(Child, self).__init__()
    print 'Child is initialized'

instance = Child()
