# Most probably a useless module

HOFU = require "../HOFU"

exports.pairs =
pairs = (values, keys) -> [k, values[i]] for k, i in keys

exports.map = 
map = (values, keys) ->
  r = {}
  r[k] = values[i] for k, i in keys
  r

# Fits fine in Array
exports.resultPairs = 
resultPairs = HOFU.composable (f, keys) -> 
  [k, f k] for k in keys

