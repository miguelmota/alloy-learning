module example/map

abstract sig Object {}
sig Key, Value extends Object {}
sig Map {
	values: Key -> Value
}

pred show() {
	// produce at least 1 map
	#Map > 0
}

// produce exactly 1 Map
run show for 2 but exactly 1 Map
