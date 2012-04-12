# Most probably a useless module

FunctionComposing = require "../FunctionComposing"

exports.pairs =
pairs = (values, keys) -> [k, values[i]] for k, i in keys

exports.map = 
map = (values, keys) ->
  r = {}
  r[k] = values[i] for k, i in keys
  r

# Fits fine in Array
exports.resultPairs = 
resultPairs = FunctionComposing.Function.composable (f, keys) -> 
  [k, f k] for k in keys
