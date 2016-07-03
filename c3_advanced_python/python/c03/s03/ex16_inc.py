class SetAttrs(type):

  def __new__(cls, name, bases, dct):
    new_dct = {}
    for attr, val in dct.items():
      if isinstance(val, list):
        new_val = val[:]
        for base in bases:
          if isinstance(getattr(base, attr, None), (tuple, list)):
            new_val.extend(getattr(base, attr, None))
      elif isinstance(val, dict):
        new_val = val.copy()
        for base in bases:
          if isinstance(getattr(base, attr, None), dict):
            new_val = dict(getattr(base, attr, None), **new_val)
      elif isinstance(val, set):
        new_val = val.copy()
        for base in bases:
          if isinstance(getattr(base, attr, None), (tuple, list, set)):
            new_val.update(getattr(base, attr, None))
      else:
        new_val = val
      new_dct[attr] = new_val
    return super(SetAttrs, cls).__new__(cls, name, bases, new_dct)
