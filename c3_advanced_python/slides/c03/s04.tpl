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

  * Consider the following:
    * An address book with contact names and contact details.

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

  * Use method `findOne` in Mongo client's collection with a query document.
    * Query document is a JSON object with the key name and value defined as in the object.
    * If no object is found, `findOne` returns `None`.

```python
my_object = my_collection.findOne({'name': 'Contact Name'})
```

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
my_object = my_collection.findOne({'name': 'Contact Name'})
if my_object is None:
  raise ValueError('Not Found!')
my_object['details'].append({'type': 'mobile', 'data': '555-555-5432'})
my_collection.update({'name': 'Contact Name'}, my_object)
```
