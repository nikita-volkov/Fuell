
exports.RegExp = RegExp

exports.global = 
global = (r) ->
  if r.global then r
  else new RegExp r.source, ["g"]