# describe "Strings", ->
#   _ = require "../../src/FueL/Strings"

#   describe "matches", ->
#     it "returns result", ->
#       expect((_.matches /\w+/, "../abc/  ")[0]).toEqual "abc"
#   describe "firstMatch", ->
#     it "works", ->
#       expect((_.firstMatch /(\w+)/, "../abc/  ")).toEqual "abc"
#   describe "splitBy", ->
#     it "extracts an empty element", ->
#       expect(_.splitBy "/", "a/b/c/").toEqual ["a", "b", "c", ""]
#     it "non-matching strings do split too", ->
#       expect(_.splitBy "/", "").toEqual [""]
#       expect(_.splitBy "/", "abc").toEqual ["abc"]