from flask import Flask
from flask import request
from json import dumps

app = Flask(__name__)

@app.route('/<oid>', methods=['POST', 'PUT'])
def updateObject(oid):
  #DB Update/Upsert code goes here
  print 'Parameters (using form.items):'
  for key, val in request.form.items():
    print 'key: %s, val: %s' % (key, val)
  #If Form post contains multiple values per parameter, use lists:
  print 'Parameters (using form.lists):'
  for key, val in request.form.lists():
    print 'key: %s, val: %s' % (key, val)
  return "OK"

if __name__ == '__main__':
  with app.test_client() as c:
    print 'form post with no multi values:'
    sing_val = c.post('/blahblah', data={'myparam': 'myval'})
    print '\nform post with multi values:'
    multi_val = c.post('/blahblah', data={'myparam': ['myval1', 'myval2']})
