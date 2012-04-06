describe "FunctionTemplate", ->
  {func} = require "../../src/FunctionComposing/FunctionTemplate"

  describe "func", ->

    it "fails when first element is inappropriate", -> 
      (expect -> func [2, sum, 3]).toThrow()

    it "returns a fully-applied function when all parameters are provided", -> 
      (expect (func [difference, 17, 3])()).toEqual -14
      (expect (func [product, 3, 6])()).toEqual 18

    it "returns a partially applied function on lesser arguments", ->
      f = func [difference, 12]
      (expect f instanceof Function).toBeTruthy()
      expect(f 7).toBe -5

    it "filter on a function works", ->
      f = func [matches, isEven]
      expect(f [0, 1, 2, 3, 4]).toEqual([0, 2, 4])

    it "works on nested declarations", -> 
      f = func [mapped, [sum, 2]]
      expect(f [0, 1, 2]).toEqual([2, 3, 4])

    it "works on uber-nested declarations", ->
      f = func [mapped, [mapped, [sum, 3]]]
      expect(f [[2, 3], [4]]).toEqual([[5,6], [7]])

    it "works on nested functions", ->
      f = func [[matches, isEven], [mapped, [sum, 2]]]
      expect(f [2, 3, 4]).toEqual [4, 6]
      expect(f [0, 1, 2, 3]).toEqual [2, 4]

    # it "passes the function unchanged", ->
    #   expect((func difference) 7, 4).toEqual -3



sum = (y, x) -> x + y
difference = (y, x) -> x - y
product = (y, x) -> x * y
quotient = (y, x) -> x / y
isEven = (x) -> x % 2 == 0
isOdd = (x) -> x % 2 == 1
times = (y, x) -> y for i in [0...x]
matches = (f, xs) -> x for x in xs when f x
mapped = (f, xs) -> f x for x in xs
result = (f, x) -> f x if x?