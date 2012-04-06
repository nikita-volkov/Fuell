Array   = require "./Array"
Object  = require "./Object"
Pair    = require "./Pair"
Set     = require "./Set"

exports[k] = v for k, v of require "../BasicFunctionComposing/Function"
exports[k] = v for k, v of require "../FunctionComposing/Function"
exports[k] = v for k, v of require "../Async/Function"

exports.Function = Function

exports.disposable = 
disposable = (f) -> 
  # -> if "result" in Object.keys f then f.result else f.result = f()
  -> if "result" of f then f.result else f.result = f()

exports.memoized = 
memoized = (f) ->
  f.cache = []
  ->
    r = Array.firstResult [[Pair.value], [Object.equals, arguments], [Pair.key]], f.cache
    if r then r
    # args = arguments
    # r = firstMatch f.cache, (pair) -> Object.equals pair[0], args
    # if r then r[1]
    else 
      r = f.apply this, arguments
      f.cache.push [arguments, r]
      r

exports.flipped = 
flipped = (f) -> (x, y) -> f y, x

exports.remapped = 
remapped = (m, f) -> 
  throw "Incorrect map" if not Set.equals [0...f.length], m
  ->
    f.apply this, (arguments[i] for i in m)
