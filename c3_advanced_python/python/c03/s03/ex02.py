class Parent(object):

  def my_method(self):
    print 'I am method in Parent'

class Child(Parent):

  pass

instance = Child()

instance.my_method()
