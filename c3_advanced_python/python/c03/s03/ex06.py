class Parent(object):

  def my_method(self):
    print 'I am method in Parent'

class AnotherParent(object):

  def another_method(self):
    print 'I am another method in a new parent class'

class Child(Parent, AnotherParent):

  def my_method(self):
    #Call overriden method in parent
    super(Child, self).my_method()
    print 'I am method in Child'

instance = Child()

instance.my_method()

instance.another_method()
