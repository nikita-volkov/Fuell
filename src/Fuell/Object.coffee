HOFU = require "../HOFU"

exports.Object = Object

###
HIGHER ORDER
###

exports.result = 
result = HOFU.composable (f, o) -> 
  throw "deprecated: Object.result in favor of Optional.result"
  f o if o? 


###
GENERAL
###

exports.union = 
union = (y, x) ->
  r = {}
  r[k] = v for k, v of x
  r[k] = v for k, v of y
  r

exports.keys = 
keys = (x) -> 
  k for k of x

exports.members = 
members = (x) -> v for _, v of x

exports.hasMember = 
hasMember = (key, x) ->
  key of x
  # for k of x 
  #   return true if k == key
  # false

exports.member =
member = (k, x) -> x[k]


exports.instanceOf =
instanceOf = (t, x) -> (x instanceof t) || (t == type x)

exports.type = 
type = (x) -> x?.constructor

exports.isNull = 
isNull = (x) -> !x?

exports.empty = 
empty = (x) ->
  return x.length == 0 if (instanceOf Array, x) || (instanceOf String, x)
  return false for own key of obj
  Boolean x

exports.notEmpty = 
notEmpty = (x) -> not empty x

exports.equals =
equals = (y, x) ->
  return true if x == y
  return false if "object" != typeof x
  return false if (type x) != (type y)
  return false for v, i in x when not equals y[i], v
  return false for k, v of x when (not hasMember k, y) or (not equals y[k], v)
  true

exports.elementOf =
elementOf = (ys, x) -> 
  return true for y in ys when equals x, y
  false


exports.after = 
after = (ys, x) -> [x].concat ys

exports.before = 
before = (ys, x) -> ys.concat [x]


exports.self = 
self = (x) -> x



# exports.maybe = 
# maybe = (p, x) -> x if p x 

# exports.either = 
# either = (p, y, x) -> if p x then x else y

