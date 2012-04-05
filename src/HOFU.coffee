###
HOFU
Higher Order Function Utils

Extended API for function composition, overloading, asynchronity and other.
###
Function          = require "./HOFU/Function"
FuncByTypesPairs  = require "./HOFU/FuncByTypesPairs"
FuncByLengthMap   = require "./HOFU/FuncByLengthMap"
FuncTemplate      = require "./HOFU/FuncTemplate"

exports[k] = v for k, v of Function

exports.composable = 
composable = (f) ->
  composableByPositions [0], f

exports.composableByPositions = 
composableByPositions = (positions, f) ->
  -> 
    newArgs = []
    for v, i in arguments
      if i in positions && v not instanceof Function.Function
        newArgs.push FuncTemplate.func v 
      else 
        newArgs.push v
    f.apply this, newArgs

exports.async = 
async = (f) ->
  -> callAsync Function.partiallyApplied arguments, f

exports.callAsync = 
callAsync = (f) ->
  if process? && process.nextTick then process.nextTick f
  else setTimeout f, 0
  return

exports.action = 
action = (f) ->
  async (args..., cb) ->
    cb f.apply this, args



exports.overloadedByType = 
overloadedByType = FuncByTypesPairs.func

exports.overloadedByLength = 
overloadedByLength = FuncByLengthMap.func

# an alternative way to expose the internal functionality. Probably preferred
exports.FuncTemplate = FuncTemplate 
