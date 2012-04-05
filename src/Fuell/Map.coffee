Object = require "./Object"
# Pairs = require "./Pairs"


exports.hasKey = 
hasKey = Object.hasMember

exports.value = 
value = Object.member

exports.values = 
values = Object.members

exports.keys = 
keys = Object.keys

exports.pairs = 
pairs = (m) -> [k, v] for k, v of m

# withValuesProcessed 
# withValuesMapped 
# mappingValues
# resultsOnValues
# processingValues
exports.mappingValues = 
mappingValues = (f, m) ->
  m1 = {}
  m1[k] = f v for k, v of m
  m1

# mappingPairs
# mapping
exports.mapping = 
mapping = (f, m) ->
  m1 = {}
  for k, v of m
    [k1, v1] = f k, v
    m1[k1] = v1
  m1



# exports.collect = 
# collect = (a, m, cb) ->
#   Pairs.collect a, (pairs m), (pairs) -> cb Pairs.map pairs 
  
# exports.collect = 
exports.processValuesBy = 
processValuesBy = (a, m, cb) ->
  ###
  Processes all values of the map by action 

  TEST:
    processValuesBy1 = (cb) ->
      processValuesBy(
        (x, cb) -> 
          setTimeout (-> cb x - 1), 1
        {"a": 1, "b": 4, "c": -2}
        cb
      )

    @callsBackIn 10, processValuesBy1
    processValuesBy1, (r) -> @equals {c: -3, a: 0, b: 3}, r

  ###
  m1 = {}
  elements = 0
  elementsProcessed = 0

  processEntry = (k, v) -> 
    a v, (v) -> 
      m1[k] = v
      elementsProcessed++
      cb m1 if elementsProcessed == elements

  for k, v of m
    elements++
    processEntry k, v
    
  cb m1 unless elements > 0
