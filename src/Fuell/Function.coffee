Array   = require "./Array"
Object  = require "./Object"
Pair    = require "./Pair"
HOFU    = require "../HOFU"

exports.Function = Function

exports[k] = v for k, v of HOFU

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

exports.withLength =
withLength = (length, f) ->
  args = ("a" + i for i in [0...length])
  body = """
    return function(#{args.join(", ")}) {
      return f.apply(this, arguments);
    }
  """
  (new Function "f", body) f

exports.flipped = 
flipped = (f) -> (x, y) -> f y, x

exports.remapped = 
remapped = (m, f) -> 
  throw "Incorrect map" if not Array.empty Array.symmetricDifference m, [0...f.length]
  ->
    f.apply this, (arguments[i] for i in m)
