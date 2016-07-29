from pymongo import MongoClient
from unittest import TestCase, main
#Replace with your module's name
try:
  from your_module.py import find_object, update_object, remove_object
except ImportError, ie:
  def find_object(my_key):
    return None
  def update_object(my_obj):
    return None
  def remove_object(my_obj):
    return None

client = MongoClient()

#Insert the name of your DB here (as a string).
MY_DB = 'my_database'

#Insert the name of your COLLECTION here (as a string).
MY_COLL = 'my_collection'

#Inser the name of your primary key here (as a string).
MY_PRIMARY_KEY_NAME = 'an_attr'

my_coll = client.get_database(MY_DB).get_collection(MY_COLL)

class MongoTests(TestCase):

  def setUp(self):
    my_coll.create_index(MY_PRIMARY_KEY_NAME, unique=True)

  def test_insert(self):
    my_obj = dict()
    my_obj[MY_PRIMARY_KEY_NAME] = 'my_key'
    update_object(my_obj)
    my_db_obj = my_coll.find_one(my_obj)
    self.assertEquals(my_obj, my_db_obj)

  def test_find(self):
    my_obj = dict()
    my_obj[MY_PRIMARY_KEY_NAME] = 'my_key'
    my_coll.insert(my_obj)
    my_found_obj = find_object(my_obj)
    self.assertEquals(my_obj, my_found_obj)

  def test_delete(self):
    my_obj = dict()
    my_obj[MY_PRIMARY_KEY_NAME] = 'my_key'
    my_coll.insert(my_obj)
    self.assertEquals(remove_object(my_obj), True)
    self.assertEquals(my_coll.find_one(my_obj), None)

  def tearDown(self):
    my_coll.drop()

if __name__ == '__main__':
  main()
