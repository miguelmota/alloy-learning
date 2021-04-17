module example/map

abstract sig Object {}
sig Key, Value extends Object {}
sig Map {
	values: Key -> Value
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

pred show() {
	// produce at least 1 map
	#Map > 0
}

// searching for scope of 3 produces counter example
check mappingIsUnique for 3

// produce exactly 1 Map
run show for 2 but exactly 1 Map
