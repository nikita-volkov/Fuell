describe "Object", ->
  Object = require "../../src/Fuell/Object"

  describe "equals", ->
    {equals} = Object
    it "returns false on unequal numbers", ->
      expect(equals 3, 2).toBeFalsy()
    it "returns true on equal arrays", ->
      expect(equals [1, 2, 3], [1, 2, 3]).toBeTruthy()
    it "returns true on deeply equal arrays", ->
      expect(equals [1, [2], 3], [1, [2], 3]).toBeTruthy()
    it "returns false on disordered intersecting arrays", ->
      expect(equals [1, 2, 3], [1, 3, 2]).toBeFalsy()
    it "returns true for deeply equal simple objects ignoring order", ->
      expect(equals {a:2, b:[1]}, {b:[1], a:2}).toBeTruthy()

  describe "type", ->
    {type} = Object
    it "must return `Object` on simple object", ->
      expect(type {}).toEqual Object.Object
    it "must return the class on custom object", ->
      class A
      expect(type new A).toEqual A
    it "must return `String` on string", ->
      expect(type "abs").toEqual String
    it "must return `Array` on array", ->
      expect(type [1, 2]).toEqual Array
    it "must return `Function` on function", ->
      expect(type ->).toEqual Function
      expect(type new Function).toEqual Function
    it "must return `Number` on number", ->
      expect(type 1).toEqual Number
      expect(type 0.3254468).toEqual Number
      expect(type -1235).toEqual Number
    it "must return `Boolean` on boolean", ->
      expect(type true).toEqual Boolean
