Array     = require "./Array"
Object    = require "./Object"
Function  = require "./Function"

# or disposableAction or disposableWithCallback in Function module
exports.disposable = 
disposable = (f) ->
  ->
    throw "The arguments must contain only a callback" unless arguments.length == 1 && Object.instanceOf Function, arguments[0]
    if f.executed
      # cb = Array.last arguments
      # throw "Last argument is not a callback" unless cb instanceof Function
      # cb()
      arguments[0]()
    else
      f.executed = true
      f.apply this, arguments
    return

exports.conditional = 
conditional = (predicate, action) ->
  (args..., cb) ->
    if (predicate.apply this, args) then action.apply this, arguments
    else cb()

# exports.callWhen = 
# callWhen = (condition, action, cb) ->
#   if condition then action cb
#   else cb()

exports.checkCallsBackIn =
checkCallsBackIn = (msecs, action, cb) ->
  ###
  Triggers the `cb` when either the `action` finishes or timeout exceeds, passing the `cb` a boolean informing on whether the action did call back.
  ###
  calledBack = false
  timedOut = false

  action ->
    if not timedOut
      calledBack = true
      cb true

  setTimeout(
    -> 
      if not calledBack
        timedOut = true
        cb false
    msecs
  )
