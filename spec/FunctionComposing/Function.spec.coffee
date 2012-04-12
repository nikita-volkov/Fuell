describe "Function", ->
  {composableByPositions} = require "../../src/FunctionComposing/Function"

  describe "composableByPositions", ->
    it "works", ->
      d = [[matches, isEven], [mapped, [sum, 2]]]
      f = composableByPositions [0], result
      expect(f d, [0, 1, 2, 3]).toEqual [2, 4]
    




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