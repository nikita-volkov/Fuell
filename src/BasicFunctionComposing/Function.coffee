
exports.Function = Function

exports.nested = 
nested = (container, f) ->
  -> container.call this, f.apply this, arguments

# exports.partiallyApplied = 
# partiallyApplied = (args, f) ->
#   args = members args unless args instanceof Array
#   -> f.apply this, union (members arguments), args
  
# union = (ys, xs) -> if not ys then xs else xs.concat ys
# members = (x) -> v for _, v of x

exports.partiallyApplied = 
partiallyApplied = (args, f) ->
  ->
    args1 = []
    args1.push(arg) for arg in args
    args1.push(arg) for arg in arguments
    f.apply this, args1


exports.withLength =
withLength = (length, f) ->
  args = ("a" + i for i in [0...length])
  body = """
    return function(#{args.join(", ")}) {
      return f.apply(this, arguments);
    }
  """
  (new Function "f", body) f