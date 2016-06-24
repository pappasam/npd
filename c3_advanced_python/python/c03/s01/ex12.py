from cStringIO import StringIO
from json import dumps, loads

class BufferHandler(object):

  def __init__(self, buf):
    self.buf = buf

  def __enter__(self):
    return self

  def write(self, data):
    self.buf.write('%s\n' % dumps(data))

  def read(self):
    self.buf.seek(0)
    return loads(self.buf.readline())

  def __exit__(self, type, value, traceback):
    self.buf.seek(0)
    self.buf.truncate()

buf = StringIO()
print 'buf value (before with statement): %r' % buf.getvalue()
with BufferHandler(buf) as bh:
  bh.write({'a': 1, 'b': 2})
  print 'buf value: %s' % buf.getvalue()
  print 'object read out of handler: %r' % (bh.read(),)
  bh.write({'c': 3, 'd': 4})
  print 'buf value: %s' % buf.getvalue()
print 'buf value (after with statement): %r' % buf.getvalue()
