describe "Function", ->
  {Action, Array, Arrays, Environment, Function, Functions, Keys, Map, Number, Object, Optional, Pair, Pairs, String, Strings} = require "../../src/Fuell"

  describe "async", ->
    {async} = Function
    addTwo = async (a, cb) -> cb a + 2
    it "works", ->
      result = null
      runs -> addTwo 3, (x) -> result = x
      waits 1
      runs -> expect(result).toEqual 5

  # describe "a 4 argument function arguments remapping", ->
  #   f = (a,b,c,d) -> a + b * 2 - c - d
  #   it "works correctly on no arguments moved", ->
  #     f1 = remapArgs [0, 1, 2, 3], f
  #     expect(f1 1, 2, 3, 4).toEqual -2

  #   it "works correctly on 1 argument moved", -> 
  #     f1 = remapArgs [1, 0, 2, 3], f
  #     expect(f1 1, 2, 3, 4).toEqual -3

  #   it "works correctly on all arguments moved", ->
  #     f1 = remapArgs [1, 2, 3, 0], f
  #     expect(f1 1, 2, 3, 4).toEqual 3

  #   it "fails on gapping map", ->
  #     (expect -> remapArgs [1, 3, 0], f).toThrow()

  #   it "fails on map having too many values", ->
  #     (expect -> remapArgs [1, 2, 3, 4, 0], f).toThrow()

  #   it "fails on map not having enough values", ->
  #     (expect -> remapArgs [0, 1, 2], f).toThrow()
