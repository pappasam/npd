from flask import Flask
from json import dumps

app = Flask(__name__)

@app.route('/<oid>')
def findObject(oid):
  #Insert DB lookup code here
  return dumps({'oid': oid, 'attr': 'object_data'})

if __name__ == '__main__':
  with app.test_client() as c:
    resp = c.get('/blah')
    print 'status: %s' % resp.status
    print 'response: %s' % resp.get_data()
