Array = require "./Array"

exports.union = 
union = (xss) -> 
  Array.rightReduction Array.union, [], xss

exports.intersection =
intersection = (xss) ->
  Array.rightReduction Array.intersection, [], xss

exports.difference = 
difference = (xss) ->
  Array.rightReduction Array.difference, [], xss

exports.symmetricDifference = 
symmetricDifference = (xss) ->
  Array.rightReduction Array.symmetricDifference, [], xss
