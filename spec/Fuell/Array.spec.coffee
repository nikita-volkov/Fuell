describe "Array", ->
  {Action, Array, Arrays, Environment, Function, Functions, Keys, Map, Number, Object, Optional, Pair, Pairs, String, Strings} = require "../../src/Fuell"

  describe "Set operations", ->
    _ = Array
    describe "union", ->
      it "returns a merged consecutive array", ->
        expect(_.union [0,1,2,3], [2,3,4,5]).toEqual [2,3,4,5,0,1,2,3]
      it "accepts nullary secondary param", ->
        expect(_.union null, [2,0]).toEqual [2,0]
        
    describe "intersection", ->
      it "returns an intersection", ->
        expect(_.intersection [0,1,2,3], [2,3,4,5]).toEqual [2,3]
      it "accepts nullary secondary param", ->
        expect(_.intersection null, [2,0]).toEqual [2,0]

    describe "difference", ->
      it "works", ->
        expect(_.difference [2,0], [0,1,2,3]).toEqual [1,3]
        expect(_.difference [0,1,2,3], [2,3,4,5]).toEqual [4,5]
        expect(_.difference [2,3,4,5], [0,1,2,3]).toEqual [0,1]
      it "returns empty array for a covered source", ->
        expect(_.difference [0,1,2,3], [2,0]).toEqual []
        expect(_.difference [0,2], [2,0]).toEqual []
      it "accepts nullary secondary param", ->
        expect(_.difference null, [2,0]).toEqual [2,0]

    describe "symmetricDifference", ->
      it "works on ordered intersecting arrays", ->
        expect(_.symmetricDifference [0,1,2,3], [2,3,4,5]).toEqual [4,5,0,1]
        
  describe "Higer order functions", ->

    describe "spread", ->
      {spread} = Array
      it "works", ->
        odd = (x) -> x % 2 == 1
        expect(spread odd, [0, 1, 2, 3, 4]).toEqual [[1,3],[0,2,4]]

  #   describe "mapped", ->
  #     it "works", ->
  #       expect(_.mapped ((x) -> x + 1), [0,1,2]).toEqual [1,2,3]
        
  #   f1 = (a, b) -> a + b
  #   f2 = (b, a) -> a + b
  #   v1 = ["a", "b", "c"]

  #   describe "foldedLeft", ->
  #     it "works", ->
  #       expect(_.foldedLeft f1, "x", v1).toEqual "xabc"
  #     it "works on reversed function", ->
  #       expect(_.foldedLeft f2, "x", v1).toEqual "cbax"
  #   describe "foldedRight", ->
  #     it "works", ->
  #       expect(_.foldedRight f1, "x", v1).toEqual "abcx"
  #     it "works on reversed function", ->
  #       expect(_.foldedRight f2, "x", v1).toEqual "xcba"
  #   describe "foldedLeft1", ->
  #     it "works", ->
  #       expect(_.foldedLeft1 f1, v1).toEqual "abc"
  #     it "works on reversed function", ->
  #       expect(_.foldedLeft1 f2, v1).toEqual "cba"
  #   describe "foldedRight1", ->
  #     it "works", ->
  #       expect(_.foldedRight1 f1, v1).toEqual "abc"
  #     it "works on reversed function", ->
  #       expect(_.foldedRight1 f2, v1).toEqual "cba"
  #     it "results in undefined on empty list", ->
  #       expect(_.foldedRight1 f1, []).toEqual undefined

  describe "General", ->

    describe "contains", ->
      {contains} = Array
      it "works on primitives", ->
        expect(contains 23, [1, 3, 23]).toBeTruthy()
        expect(contains 23, [1, 3, 33]).toBeFalsy()

  describe "Async", ->
    describe "collect", ->
      {collect} = Array
      it "triggers callback even on empty list", ->
        triggered = false
        runs -> collect (Function.action ->), [], -> triggered = true
        waits 1
        runs -> expect(triggered).toBeTruthy()
