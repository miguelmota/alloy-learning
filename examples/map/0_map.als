module example/map

abstract sig Object {}
sig Key, Value extends Object {}
sig Map {
	values: Key -> Value
}

pred show() {}
run show for 2
