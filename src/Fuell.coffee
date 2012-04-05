# exports[k] = v for k, v of m for m in [
#   Array     = require "./Fuell/Array"
#   Function  = require "./Fuell/Function"
#   Map       = require "./Fuell/Map"
#   Number    = require "./Fuell/Number"
#   Object    = require "./Fuell/Object"
#   Pairs     = require "./Fuell/Pairs"
#   String    = require "./Fuell/String"
# ]

# eval "exports.#{name} = #{name};" for name in [
#   "Array"
#   "Func"
#   "Map"
#   "Number"
#   "Object"
#   "Pairs"
#   "String"
# ]


# modules = {}
# modules[name] = require "./Fuell/#{name}" for name in [
#   "Action", "Actions", "Array", "Arrays", "Environment", "Function", "Keys", "Map", "Number", "Object", "Optional", "Pair", "Pairs", 'RegExp', 'Set', 'SortedArray', "String", "Strings", "Text"
# ]

# exports[k] = v for k, v of modules


exports[name] = require "./Fuell/#{name}" for name in [
  "Action"
  "Actions"
  "Array"
  "Arrays"
  "Environment"
  "Function"
  "Keys"
  "Map"
  "Number"
  "Object"
  "Optional"
  "Pair"
  "Pairs"
  'RegExp'
  'Set'
  'SortedArray'
  "String"
  "Strings"
  "Text"
]
