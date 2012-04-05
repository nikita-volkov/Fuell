HOFU = require "../HOFU"

# deprecated in favor of `parallel`
exports.callParallelly = 
callParallelly = HOFU.async (fs, cb) ->
  results = []
  for f in fs
    f (result) ->
      results.push result
      cb results if results.length == fs.length
      return
  cb results unless fs.length > 0
  return

# deprecated in favor of `queue`
exports.callConsecutively = 
callConsecutively = (actions, cb) -> 
  queue = (a for a in actions)
  callNext = ->
    if queue.length > 0 then queue.shift() callNext
    else cb()
  callNext()
  return
  # throw "todo: Actions.callConsecutively"



exports.queue = 
queue = (actions) ->
  (cb) -> callConsecutively actions, cb

exports.parallel = 
parallel = (actions) ->
  (cb) -> callParallelly actions, cb
