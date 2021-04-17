module example/queue

sig Queue { 
	// "lone" is a multiplicity keywords that indicates
	// each Queue has less than or equal to one root
	root: lone Node
}

sig Node {
	next: lone Node
}

// no constraints
pred show() {}

// get sample instances
run show for 2
