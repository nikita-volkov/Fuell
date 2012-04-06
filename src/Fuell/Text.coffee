String = require "./String"
Array = require "./Array"
Strings = require "./Strings"

# exports.equals = 
# equals = (y, x) ->
#   throw "TODO: Text.equals"

# exports.normalized = 
# normalized = (text) ->
#   throw "TODO: Text.normalized"

exports.indented = 
indented = (spaces, text) ->
  indentation = String.repeated spaces, " "
  # String.prepending indentation, 
  # String.replacing /\n(?!$)/, "\n" + indentation, text
  
  # (indentation + line for line in lines text).join "\n"
  Strings.multilineText Array.results ((l) -> indentation + l), lines text 
# exports.indented = 
# indented = (spaces, text) ->
#   indentation = repeated spaces, " "
#   # String.prepending indentation, 
#   String.replacing "\n", "\n" + indentation, text

exports.indentation = 
indentation = (text) ->
  ###
  Detects minimum indentation in text
  ###
  Array.minBy ((indentation) -> indentation.length), 
  Array.results String.indentation, lines text
  

exports.unindented = 
unindented = (text) ->
  String.replacing(
    "\n" + indentation text
    "\n"
    text
  )

exports.lines = 
lines = (text) ->
  text.split /\r\n|\r|\n/
  

