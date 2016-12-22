layout: true
name: data-model

# Object Store Data Design

---

## Introduction

  * Traditional relational DB design required defining discreet types and explicit relationships between each type.
    * Each data type required a primary key.
    * Relationships between types required references to each key and complex query joins to obtain related data objects.

  * An object store DB simplifies much of this.
    * All related data objects (sub-documents) can be embedded directly into a root document.
    * Querying for the root document will automatically retrieve all associated sub-documents.
    * Instead of a primary key for each data type, only one key is required to enable querying the root document.

---

layout: true
template: data-model

## Example

  * Consider what a data model would look like for a basic address book with contact details.

---

  * Traditional design would require two types:
    * Contact
      * Name (primary key)
      * Date of birth
      * Notes
    * ContactDetails
      * Name (foreign key that links to Contact)
      * DetailType (e.g. e-mail, phone, mobile, etc.)
      * DetailData (e.g. contactname@blahblah.com, 555-555-5555, etc.)
  * Querying for a Contact with details would require a query with a join on `Name`.

---

  * Document based data store allows one document with all details embedded.
    * No need to define foreign key relationships.

```json
{ 'name': 'Contact Name',
  'dob': '1980-01-01',
  'notes': 'Notes about contact',
  'details': [
    { 'type': 'email',
      'data': 'something@something.com'
    }, {
      'type': 'phone',
      'data': '555-555-5555'
    } ]
}
```

---

layout: false

# Mongo Introduction

 * To connect to a Mongo server, running locally on your computer, import the client and initialize with default parameters:

```python
from pymongo import MongoClient
client = MongoClient()
```

 * Mongo stores objects in collections which are organized in databases.
   * Collections can be accessed by the client by defining both the database and collection as attributes.

```python
my_collection = client.my_database.my_collection
```

---

# Inserting Objects

  * The collection object from the Mongo client has a method called `insert` to add one or more documents to a collection.

```python
my_object # Contact object as a python dict from data schema example.

my_collection.insert(my_object)

my_objects = [another_object, third_object]

my_collection.insert(my_objects)
```

---

# Retrieving Objects

  * Objects can be retrieved from their primary key.
    * N.B. Retrieval not just limited to primary, feel free to research further.

  * Use method `find_one` in Mongo client's collection with a query document.
    * Query document is a JSON object with the key name and value defined as in the object.
    * If no object is found, `find_one` returns `None`.

```python
my_object = my_collection.find_one({'name': 'Contact Name'})
```

---

# Ensuring Data Consistency

  * To prevent issues, each object's primary key should be unique.  By default, this is not enforced and can cause problems if multiple objects contain the same primary key.
  * To ensure consistency, create an index with a unique constraint by using method `create_index`.
    * Only needs to be performed once, at DB initialization

```python
my_collection.create_index('name', unique=True)
```

  * When a unique index is in place, if inserting an object with a key that already exists in a collection, it will fail with an exception.

---

# Updating An Object

  * Objects can be updated (or replaced) by using the method `update` with a query object and the updated object version.
    * N.B. The update command has more capabilities, feel free to research further.

```python
my_object = my_collection.find_one({'name': 'Contact Name'})
if my_object is None:
  raise ValueError('Not Found!')
my_object['details'].append({'type': 'mobile', 'data': '555-555-5432'})
my_collection.update({'name': 'Contact Name'}, my_object)
```

---

# Updating An Object (Upserting)

  * If the upsert flag is provided to the `update` method, the update will automtically insert the object if it does not exist.
    * Tip: This can be used to combine the update and the insert functionality into one process.

```python
obj_srch = {'name': 'Contact Name'}
my_object = my_collection.find_one(obj_srch)
if my_object is None:
  my_object = obj_srch.copy()
my_object.setdetault('details', []).append({'type': 'email', 'data': 'my_contact@anotherdomain.com'})
my_collection.update(obj_srch, my_object, upsert=True)
```

---

# Removing An Object

  * An object can be removed by using the method `delete_one` with a search query that matches the document.
    * Alternative method `delete_many` can be used to delete all documents that match the query.

```python
del_result = my_collection.delete_one({'name': 'Contact Name'})
print 'deleted %d documents' % (del_result.deleted_count,)

#Remove all documents that have the e-mail 'my_contact@anotherdomain.com'
query = {'details': {
          '$elemMatch': {'type': 'email',
                         'data': 'my_contact@anotherdomain.com'
                        }
          }
        }
del_result = my_collection.delete_many(query)
print 'deleted %d documents' % (del_result.deleted_count,)
```

---

layout: true

# Access Via Mongo Shell

---

## Accessing Mongo DB

 * A Mongo shell is accessible with the application `mongo`.
   * The database can be specified as an argument when executing `mongo`, e.g.:
```sh
mongo my_database
```
   * Or can be specified (and respecified) in the mongo shell with the `use` command:
```sh
use my_database
```

---

## Operating In A Mongo DB

 * In the mongo shell, operations can be performed through the `db` object, e.g.:

```javascript
db.my_collection.insert({'attr': 'an attr'})
```

 * The operations map out as follows:
   * Insert: `db.my_collection.insert`
   * Find a single object: `db.my_collection.findOne`
   * Update: `db.my_collection.update`
     * Upsert: `db.my_collection.update({'attr': 'an attr'}, {'attr': 'a new value'}, {'upsert': true})`
   * Remove: `db.my_collection.remove`

---

layout: false

# Excercise
  * Create a library of functions that handle DB operations for your data models.
    * A find function that takes your primary key and returns your object or `None` if not found.
    * An update function that accepts your object and either updates or inserts with Mongo's upsert capability.
    * A remove function that takes your primary key and removes the object from Mongo that matches the key.

  * Create unit tests that tests the ability to insert, update, find, and remove for each of your object types.
