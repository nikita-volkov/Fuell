Function = require "./Function"
Array = require "./Array"

exports.func = 
func = (declaration) ->
  head = Array.first declaration
  tail = Array.allButFirst declaration
  # [head, tail...] = declaration
  if head instanceof Function.Function
    Function.partiallyApplied (composed tail), head
  else if isDeclaration head
    Array.reduced Function.nested, (composed declaration)
  else throw "Incorrect declaration"

composed = (xs) ->
  for x in xs
    if isDeclaration x then func x else x
    
isDeclaration = (x) -> 
  (x instanceof Array.Array) && 
  (x.length != 0) &&
  ((x[0] instanceof Function.Function) || isDeclaration x[0])
