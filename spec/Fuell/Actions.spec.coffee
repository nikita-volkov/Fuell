describe "Actions", ->
  {Action, Actions, Array, Arrays, Environment, Function, Keys, Map, Number, Object, Optional, Pair, Pairs, RegExp, SortedArray, String, Strings} = require "../../src/Fuell"

  describe "callParallelly", ->
    {callParallelly} = Actions

    addTwo = Function.async (a, cb) ->
      cb a + 2

    it "works", ->

      results = null

      fs = [
        (cb) -> addTwo 1, cb
        (cb) -> addTwo 2, cb
        (cb) -> addTwo 3, cb
      ]
      runs -> callParallelly fs, (results1) ->
        results = results1

      waits 2

      runs -> expect(results).toEqual [3,4,5]

    it "triggers callback on empty functions list", ->
      triggered = false
      runs -> callParallelly [], (xs) -> triggered = true
      waits 2
      runs -> expect(triggered).toBeTruthy()