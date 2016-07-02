class Parent(object):

  def my_method(self):
    print 'I am method in Parent'

class Child(Parent):

  def my_method(self):
    #Call overriden method in parent
    super(Child, self).my_method()
    print 'I am method in Child'

instance = Child()

instance.my_method()
