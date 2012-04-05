Array = require "./Array"

# A faster version of unique which works on sorted arrays only.
exports.unique = 
unique = (xs) ->
  buffer = []
  buffer.push xs[0] if xs.length > 0
  buffer.push x for x in xs when x != Array.last buffer
  buffer