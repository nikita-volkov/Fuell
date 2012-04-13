BasicFunctionComposing = require "../BasicFunctionComposing"

exports.Function = Function

exports.async = 
async = (f) ->
  -> callAsync BasicFunctionComposing.Function.partiallyApplied arguments, f

exports.callAsync = 
callAsync = (f) ->
  if process? && process.nextTick then process.nextTick f
  else setTimeout f, 0
  return

exports.action = 
action = (f) ->
  async (args..., cb) ->
    cb? f.apply this, args


