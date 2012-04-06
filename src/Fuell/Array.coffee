Async = require "../Async"
FunctionComposing = require "../FunctionComposing"
Object = require "./Object"

exports.Array = Array


###
ASYNC ACTIONS
###
# processBy
exports.collect =
collect = Async.Function.async (action, xs, cb) ->
  zs = []
  for x in xs
    action x, (z) ->
      zs.push z
      cb zs if zs.length == xs.length
      return
  cb zs unless xs.length > 0
  return

exports.collectResults =
collectResults = (action, xs, cb) ->
  collect action, xs, (zs) ->
    zs1 = []
    zs1.push z for z in zs when z?
    cb zs1
    return
  return

exports.each = 
each = Async.Function.async (action, xs, cb) ->
  if xs.length > 0
    finished = 0
    for x in xs
      action x, ->
        finished++
        cb() if finished == xs.length
        return
  else cb()
  return



### 
HIGHER ORDER 
###

# Udon.maximumBy = function(cmp, xs) {
#     var maxBy = function(x, y) { return cmp(x, y) === 1 ? x : y; };
#     return Udon.foldl1(maxBy, xs);
# };

# Udon.minimumBy = function(cmp, xs) {
#     var minBy = function(x, y) { return cmp(x, y) === 1 ? y : x; };
#     return Udon.foldl1(minBy, xs);
# };
exports.minBy = 
minBy = (f, xs) ->
  r = null
  for x in xs
    z = f x
    r = z if z > r || !r?
  r
  

# spanned|broken
exports.spread = 
spread = (f, xs) ->
  r1 = []
  r2 = []
  for x in xs
    if f x then r1.push x
    else r2.push x
  [r1, r2]

exports.resultPairs = 
resultPairs = FunctionComposing.Function.composable (f, keys) -> 
  [k, f k] for k in keys

exports.leftReduction = 
leftReduction = FunctionComposing.Function.composable (f, r, xs) ->
  for x in xs
    r = f r, x
  r

exports.rightReduction = 
rightReduction = FunctionComposing.Function.composable (f, y0, xs) -> 
  y = y0
  for i in [(xs.length - 1)..0]
    y = f xs[i], y
  y

# not `reduced` since the returned type changes
exports.reduction = 
reduction = FunctionComposing.Function.composable (f, xs) -> 
  rightReduction f, (last xs), (allButLast xs) if xs.length > 0


exports.firstResult = 
firstResult = FunctionComposing.Function.composable (f, xs) ->
  return z for x in xs when (z = f x)?

exports.result = 
result = FunctionComposing.Function.composable (f, xs) ->
  ###
  Get either the same array or null if it contains a null
  ###
  for x in xs
    z = f x
    return null if !z?
    z

# processed
exports.results = 
results = FunctionComposing.Function.composable (f, xs) ->
  ###
  
  ###
  z for x in xs when (z = f x)?

exports.allMatch = 
allMatch = FunctionComposing.Function.composable (f, xs) ->
  return false for x in xs when not f x
  true

exports.someMatch = 
someMatch = FunctionComposing.Function.composable (f, xs) ->
  return true for x in xs when f x
  false

exports.noneMatch = 
noneMatch = FunctionComposing.Function.composable (f, xs) ->
  return false for x in xs when f x
  true

exports.matches = 
matches = FunctionComposing.Function.composable (f, xs) ->
  x for x in xs when f x

exports.firstMatch = 
firstMatch = FunctionComposing.Function.composable (f, xs) ->
  return x for x in xs when f x


### 
SET OPS 
###

# unitedWith and use union as flat | combining
exports.union = 
union = (ys, xs) -> 
  if not ys or ys.length is 0 then xs 
  else xs.concat ys

# excluding
exports.difference = 
difference = (ys, xs) -> 
  if not ys then xs
  else x for x in xs when not contains x, ys

# 
exports.intersection = 
intersection = (ys, xs) ->
  if !ys then xs
  else x for x in xs when contains x, ys

# symmetricallyDifferencedWith
exports.symmetricDifference = 
symmetricDifference = (ys, xs) ->
  if !ys then xs
  else union (difference xs, ys), (difference ys, xs)

exports.equalsAsSet = 
exports.equalsSet = 
equalsSet = (ys, xs) ->
  [] == difference ys, xs





### 
GENERAL 
###

length = exports.length = 
  (xs) -> xs.length

empty = exports.empty = 
  (xs) -> xs.length == 0

without = exports.without = 
  (y, xs) -> x for x in xs when not Object.equals y, x

taking = exports.taking = 
  (n, xs) -> xs[0...n]

dropping = exports.dropping = 
  (n, xs) -> xs[n...xs.length]

splitAt = exports.splitAt = 
  (i, xs) -> 
    a = []; b = []
    for i1 in [0...xs.length]
      if i1 < i then a.push xs[i1]
      else b.push[i1]
    [a, b]

sorted = exports.sorted = 
  (xs) -> xs.sort()

sortedBy = exports.sortedBy = 
  (f, xs) -> throw "todo: Arrays.sortedBy"

first = exports.first = 
  (xs) -> xs[0] 

last = exports.last = 
  (xs) -> xs[xs.length - 1]

allButLast = exports.allButLast = 
  (xs) -> xs.slice 0, -1

allButFirst = exports.allButFirst = 
  (xs) -> xs.slice 1  


# # or existing
# exports.filtered = 
# filtered = (xs) ->
#   x for x in xs when x?

# exports.set = 
exports.unique = 
unique = (xs) -> 
  buffer = []
  buffer.push x for x in xs when not contains x, buffer
  buffer
  
# A faster version of unique which works on sorted arrays only.
# deprecated in favor of SortedArray.unique
# exports.uniqueOnSorted = 
# uniqueOnSorted = (xs) ->
#   buffer = []
#   buffer.push xs[0] if xs.length > 0
#   buffer.push x for x in xs when x != last buffer
#   buffer

exports.reversed = 
reversed = (xs) ->
  xs[i] for i in [xs.length-1..0]

exports.appending =
exports.appendedWith =
appendedWith = (y, xs) ->
  if y? then xs.concat [y]
  else xs

exports.prepending =
exports.prependedWith = 
prependedWith = (y, xs) -> 
  if y? then [y].concat xs
  else xs

exports.pairedWith = 
exports.pairs =
pairs = (values, keys) -> [k, values[i]] for k, i in keys
# pairs = (keys, values) -> [k, values[i]] for k, i in keys

exports.map = 
map = (values, keys) ->
  r = {}
  r[k] = values[i] for k, i in keys
  r

exports.contains = 
contains = (y, xs) -> 
  return true for x in xs when Object.equals y, x
  false

exports.partOf = 
partOf = (ys, xs) ->
  return false for x in xs when not contains x, ys
  return true

exports.includes =
includes = (ys, xs) -> partOf xs, ys

# exports.at = 
# at = (i, xs) -> xs[i]

exports.member = 
member = (i, xs) -> xs[i]

exports.copy = 
copy = (xs) -> x for x in xs