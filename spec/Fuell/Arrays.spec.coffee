describe "Arrays", ->
  Arrays = require "../../src/Fuell/Arrays"

  describe "Set operations", ->
    {union, intersection, difference, symmetricDifference} = Arrays
    describe "union", ->
      it "returns a merged consecutive array", ->
        expect(union [[0,1,2,3], [2,3,4,5], [6]]).toEqual [6,2,3,4,5,0,1,2,3]
      it "accepts nullary secondary param", ->
        expect(union [null, [2,0]]).toEqual [2,0]
        
    # describe "intersection", ->
    #   it "returns an intersection", ->
    #     expect(_.intersection [0,1,2,3], [2,3,4,5]).toEqual [2,3]
    #   it "accepts nullary secondary param", ->
    #     expect(_.intersection null, [2,0]).toEqual [2,0]

    # describe "difference", ->
    #   it "works", ->
    #     expect(_.difference [2,0], [0,1,2,3]).toEqual [1,3]
    #     expect(_.difference [0,1,2,3], [2,3,4,5]).toEqual [4,5]
    #     expect(_.difference [2,3,4,5], [0,1,2,3]).toEqual [0,1]
    #   it "returns empty array for a covered source", ->
    #     expect(_.difference [0,1,2,3], [2,0]).toEqual []
    #     expect(_.difference [0,2], [2,0]).toEqual []
    #   it "accepts nullary secondary param", ->
    #     expect(_.difference null, [2,0]).toEqual [2,0]

    # describe "symmetricDifference", ->
    #   it "works on ordered intersecting arrays", ->
    #     expect(_.symmetricDifference [0,1,2,3], [2,3,4,5]).toEqual [4,5,0,1]
    #     