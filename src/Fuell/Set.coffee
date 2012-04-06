Array = require "./Array"


exports.equals = 
equals = (ys, xs) ->
  Array.empty Array.difference ys, xs
