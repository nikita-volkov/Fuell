
exports.uniqueId = 
uniqueId = ->
  Strings.interlayedUnion "-", [ 
    new Date().getTime()
    (Math.random() * 0x100000000 + 1).toString(36)
  ]

