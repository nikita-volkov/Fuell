exports.Object = Object

exports.members = 
members = (x) -> v for _, v of x

exports.instanceOf =
instanceOf = (t, x) -> (x instanceof t) || (t == type x)

exports.type = 
type = (x) -> x?.constructor
