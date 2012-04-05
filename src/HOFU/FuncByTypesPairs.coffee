require "./Object"

exports.func = 
func = (template) ->
  ->
    for [types, f] in template
      return f.apply this, arguments if argsMatchTypes types, arguments
    throw "Function does not support types of supplied arguments: #{(type arg)?.name for arg in arguments}"

argsMatchTypes = (types, args) ->
  return false if args.length != types.length
  return false for t, i in types when t? && !Object.instanceOf t, args[i]
  true