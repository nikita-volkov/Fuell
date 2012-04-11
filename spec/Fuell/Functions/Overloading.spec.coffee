# describe "Functions.Overloading", ->
#   {funcByLength, funcByTypes} = require "../../../src/FueL/Functions/Overloading"
#   Arrays = require "../../../src/FueL/Arrays"
#   Strings = require "../../../src/FueL/Strings"
#   Numbers = require "../../../src/FueL/Numbers"

#   describe "an overloaded by length number writer", ->
#     f = funcByLength {2: ((a,b)->a+b), 4: ((a,b,c,d)-> a+b+c+d)}
#     it "returns correct result", ->
#       (expect f 1, 2).toEqual 3
#       (expect f 1, 2, 3, 4).toEqual 10

#     it "fails on incorrect number of arguments", ->
#       (expect -> f()).toThrow()
#       (expect -> f 1).toThrow()
#       (expect -> f 1, 2, 3).toThrow()
#       (expect -> f 1,2,3,4,5).toThrow()
#       (expect -> f 1,2,3,4,5,6).toThrow()

#   describe "an overloaded by types array or string joiner", ->
#     f = funcByTypes [
#       [[String, String], Strings.union],
#       [[Array, Array], Arrays.union]
#     ]
#     it "joins strings", ->
#       expect(f "cd", "ab").toEqual("abcd")

#     it "joins arrays", ->
#       expect(f [3, 4, 5], [1, 2]).toEqual([1,2,3,4,5])
      
#     it "fails on numbers", ->
#       expect(-> f 2, 4).toThrow()
      
#     it "fails on one string", ->
#       expect(-> f "ds").toThrow()

#     it "fails on three strings", ->
#       expect(-> f "1", "a", "c").toThrow()

#   describe "an overloaded by types of different length function", ->
#     f = funcByTypes [
#       [[String, String], -> "2 strings"],
#       [[Array], -> "1 array"]
#     ]
#     it "executes appropriate function", ->
#       expect(f "", "").toEqual "2 strings"
#       expect(f [1]).toEqual "1 array"

#   describe "funcByTypes", ->
#     it "ignores parameter if type for it is null", ->
#       f = funcByTypes [
#         [[null, String], Strings.union]
#       ]
#       expect(f 2, "abc").toEqual "abc2"
#     it "treats empty parameters list correctly", ->
#       f = funcByTypes [
#         [[], -> 1]
#       ]
#       expect(f()).toEqual 1
#       expect(-> f 1).toThrow()
#     it "counts null parameters", ->
#       f = funcByTypes [
#         [[null], -> 1]
#         [[String, null], -> 2]
#       ]
#       expect(f 0).toEqual 1
#       expect(f "0", 0).toEqual 2
#     it "does not ignore specified parameters", ->
#       f = funcByTypes [
#         [[String, String], Strings.union]
#       ]
#       expect(-> f 2, "abc").toThrow()