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
