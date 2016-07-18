layout: true
name: design-http

# Designing HTTP Based Web Services

---

## An Overview of HTTP

  * An HTTP request may contain the following components:
    * A URI: Identifies the resource the request is operating on.
    * A Method: Defines how to operate on the resource.
    * Headers: Optional key value pairs which can be used to define the following:
      * Authentication
      * Define input format (e.g. JSON, XML, etc)
      * Define format for output
    * A Body: Provides data relating to the request.

  * An HTTP request will result in a response, which will contain the following:
    * An HTTP Code: Defines the status of the request (e.g. success, failure, etc).
    * An HTTP Body: Returns data as a result from the request.

---

## The CRUD Model

  * CRUD defines a convention for how to layout HTTP web services:
    * The URI defines the resource object to operation on, i.e. URI defines the object's ID.
    * The Method defines which operation to use on the object.
    * The Body passes necessary details for the operation (e.g. the object to store, etc.).
    * Response Code: Uses HTTP standard codes (200 or 201 for success, 400 - 599 for failure).
    * Response Body: Returns object where applicable (e.g. on Retrieve).
  * CRUD Operations usually map out to the following standard HTTP Methods:
    * Create: PUT (or POST)
    * Retrieve: GET
    * Update: POST
    * Delete: DELETE

---

## Creating (And Updating) An Object

  * Upsert can be used to combine the Create and Update operations.
    * Operation on an new ID results in a Create operation.
    * Operation on an existing ID results in an Update operation.
  * Use the POST HTTP method.
  * Example: Create or Update on an object with the ID of `object_1`
    * Method: `POST`
    * URI: `/object_1`
    * Body: `{ 'attr': 'an attr for obect 1' }
    * Response Code: 201: Created
      * Can return an alternate code, 200: OK for operation was an update.

---

## Retrieving An Object

  * Use the GET HTTP Method.
  * Example: Retrieve object `object_1`
    * Method: `GET`
    * URI: `/object_1`
    * Body: (left blank)
    * Response Code: 200: OK
    * Response Body: `{ 'attr': 'an attr for obect 1' }`

---

## Deleting An Object

  * Use the DELETE HTTP Method.
  * Exampe: Delete obect `object_1`
    * Method: `DELETE`
    * URI: `/object_1`
    * Body: (left blank)
    * Response Code: 200: OK

---

layout: true
name: build-methods

# Building Server HTTP Methods

---

layout: true
template: build-methods

## Building Controllers

  * Controllers
    * accept the parameters and data from a request
    * perform the necessary actions
    * generate a response

  * Example of a simple controller:

---

```python ((ex01.py))
```

---

```python <<ex01.py>>
```

---

layout: true
template: build-methods

## Routing Controllers

  * CRUD API model requires that controllers be routed by URI and HTTP method.
    * Previous example showed how to route with a parameter that becomes the object's primary ID.
  * To route by method, use `app.route` methods keyword argument.

---

```python ((ex02.py))
```

---

```python <<ex02.py>>
```

---

layout: true
template: build-methods
name: accept-request

## Accepting Request Data

---

layout: true
template: accept-request

  * Flask exposes the request via a global `request` object.
    * How can this object be global?
    * Feel free to read up on context local variables later.
  * To access the request body directly, use method `request.get_data`.

---

```python ((ex03.py))
```

---

```python <<ex03.py>>
```

---

layout: true
template: accept-request

  * If the API utilizes HTTP form-encoding (format used for form posts), Flask can parse this for you.
    * Use the `request.form` attribute.

---

```python ((ex04.py))
```

---

```python <<ex04.py>>
```

---

template: design-http

## Excercise

  * Create your API controllers to be able to create, retrieve, update, and remove your data objects via the API.
    * Utilize your data objects and DB functions from earlier in this course.
  * Decide on the input format for submitting to your API, recommendations:
    * Form Post (x-url-form-encoded):
      * Can easily integrate with web sites (use HTML form posts to run API methods).
    * JSON Encoding:
      * Can easily encode complex data structures.
      * Integrates well with javascript.
  * Be sure to code safely!
    * Make sure your code enforces proper object schema.
      * Your application should ignore or throw an error when it gets input that does not fit your data design.
      * Your application should convert to proper types as necessary (and throw an error if it can't).
  * Use `app.test_client` to execute your controller code to test it properly.
