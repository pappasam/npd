from flask import Flask
from flask import request
from json import dumps

app = Flask(__name__)

@app.route('/<oid>', methods=['POST', 'PUT'])
def updateObject(oid):
  #DB Update/Upsert code goes here
  print 'I got a post request!'
  print 'My request data: %s' % (request.get_data(),)
  return "OK"

if __name__ == '__main__':
  with app.test_client() as c:
    post_resp = c.post('/blah', data='{"attr": "My Object data"}')
    print 'status: %s' % post_resp.status
    print 'response: %s' % post_resp.get_data()
