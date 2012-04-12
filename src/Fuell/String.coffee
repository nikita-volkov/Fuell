
exports.String = String


exports.prepending = 
prepending = (y, x) -> y + x

exports.appending = 
appending = (y, x) -> x + y

exports.repeated = 
repeated = (times, string) ->
  r = ""
  r += string for i in [0...times]
  r

exports.remainder =
remainder = (beginning, string) ->
  if startsWith beginning, string
    dropping (length beginning), string

exports.length = 
length = (x) -> x.length

exports.union = 
union = (y, x) -> x + y

exports.replacing = 
replacing = (search, replacement, x) ->
  if search instanceof RegExp
    # search = new RegExp search.source, ["g"] if !search.global
    x.replace search, replacement
  else
    x.split(search).join(replacement)

exports.trimmed = 
trimmed = (x) -> 
  if String::trim? then x.trim() 
  else x.replace /^\s+|\s+$/g, ""

exports.splitAt = 
splitAt = (n, x) -> 
  throw "todo: Strings.splitAt"

exports.splitBy = 
splitBy = (a, x) -> 
  ###
  Splits string by regex or a substring.
  ###
  x.split a

exports.startsWith = 
startsWith = (a, x) -> 
  a == x.substr 0, a.length

exports.endsWith = 
endsWith = (a, x) -> a == x.substr x.length - a.length

exports.empty = 
empty = (x) -> 
  x.length == 0

exports.optional = 
optional = (x) ->
  x if x.length != 0

exports.dropping = 
dropping = (n, string) ->
  string.substr n

### REGEX ###
exports.matches = 
matches = (r, x) -> 
  if r.global then (x.match r) ? []
  else x.match r

exports.firstExtract = 
firstExtract = (r, x) -> 
  if m = r.exec x then m[1]

exports.doesMatch = 
doesMatch = (r, x) -> 
  if r.exec x then true else false
  
exports.extracts = 
extracts = (r, s) -> (s.match r)?[1..]


exports.indented = 
indented = (spaces, text) ->
  indentation = repeated spaces, " "
  String.replacing "\n", "\n" + indentation, text

exports.indentation = 
indentation = (string) ->
  ###
  Detects starting indentation in text
  ###
  firstExtract /^( *)/, string

