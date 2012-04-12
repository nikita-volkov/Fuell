Array = require "./Array"
Object = require "./Object"


# valueBy | member
exports.value = 
value = (key, pairs) ->
  return v for [k, v] in pairs when Object.equals key, k


exports.map = 
map = (pairs) -> 
  r = {}
  r[k] = v for [k, v] in pairs
  r

exports.results = 
results = (f, pairs) ->
  # [k, z] for [k, v] in pairs when z = f v
  z for [k, v] in pairs when (z = f k, v)?


exports.keys = 
keys = (pairs) ->
  k for [k, v] in pairs

exports.values = 
values = (pairs) ->
  v for [k, v] in pairs



exports.processValuesBy = 
processValuesBy = (a, pairs, cb) ->
  Array.collect(
    ([k, v], cb) -> a v, (v) -> cb [k, v]
    pairs
    cb
  )