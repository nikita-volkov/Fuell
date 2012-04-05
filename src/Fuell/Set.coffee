Array = require "./Array"


exports.equals = 
equals = (ys, xs) ->
  [] == Array.difference ys, xs
