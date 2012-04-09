
exports.union = 
union = (ms) ->
  r = {}
  r[k] = v for k, v of m for m in ms
  r
