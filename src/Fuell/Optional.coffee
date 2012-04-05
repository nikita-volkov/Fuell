HOFU = require "../HOFU"

exports.result = 
result = HOFU.composable (f, o) ->
  f o if o? 

exports.after = 
after = (ys, x) -> 
  if x? then [x].concat ys
  # else ys # it should return nothing when there's no x

exports.before = 
before = (ys, x) -> 
  if x? then ys.concat [x]