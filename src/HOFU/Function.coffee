Array = require './Array'
Object = require './Object'

exports.Function = Function

exports.partiallyApplied = 
partiallyApplied = (args, f) ->
  args = Object.members args if not Object.instanceOf Array.Array, args
  -> f.apply this, Array.union (Object.members arguments), args

exports.nested = 
nested = (container, f) ->
  -> container.call this, f.apply this, arguments
