describe "Functions.Basic", ->

  # describe "a partially applied function", ->

  #   it "has length as large as arguments unapplied", ->
  #     f = partiallyApply [8], (a, b, c, d) -> a + b
  #     (expect f.length).toEqual 3
  #     f = partiallyApply [], (a, b, c, d) -> a + b
  #     (expect f.length).toEqual 4
  #     f = partiallyApply [1, 2, 3, 4], (a, b, c, d) -> a + b
  #     (expect f.length).toEqual 0

  #   it "produces correct results", ->

  #     f = partiallyApply [8], (a, b, c) -> a + b
  #     expect(f 9, 12).toEqual 17

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
