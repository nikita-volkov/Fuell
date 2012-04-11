{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "./Fuell"


text = 
  """
  when "textBeforeTests"
    if "TESTS:" == String.trimmed line
      currentGroup = "testsText"
      continue
  when "testsText"
    if indentation == String.indentation line
      currentGroup = "textAfterTests"
  """
text = Text.indented 4, text
console.log Text.unindented text
