module example/map

abstract sig Object {}
sig Key, Value extends Object {}
sig Map {
	// use lone keyword to allow for one or none
	values: Key -> lone Value
}

// assert that the mapping of keys to values is unique
assert mappingIsUnique {
	// this says if a Map _m_ maps a key _k_ to two values
	// _v_ and _v'_ then they must be the same.
	// The relational product operator "->" in "k -> v" is
	// is used to represent the tuple (k,v) and "m.values" 
	// is treated as a set of tuples {(Key, Value)}
	all m:Map, k:Key, v,v':Value |
		k -> v in m.values and k -> v' in m.values implies v = v'
}

// constraint that all keys (and values) belong to some map
fact {
	all k:Key | some v:Value, m:Map | k -> v in m.values
	all v:Value | some k:Key, m:Map | k -> v in m.values
}

pred put(m,m':Map, k:Key, v:Value) {
	// the convention is to use _'_ to decorate the state
	// after the operation.
	// _+_ is the set union operator. This reads "the set
	// of values of after is equal to the union of the set
	// of values before with the extra mapping from k to v".
	// "m.values" is treated as a set of tuples.
	m'.values = m.values + k -> v
}

pred show() {
	// produce at least 1 map
	#Map > 0
}

//check mappingIsUnique for 15

// produce exactly 1 Map
//run show for 2 but exactly 1 Map

run put for 3 but exactly 2 Map, exactly 1 Key, exactly 1 Value
