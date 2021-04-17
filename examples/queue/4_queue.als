module example/queue

sig Queue { 
	// "lone" is a multiplicity keywords that indicates
	// each Queue has less than or equal to one root
	root: lone Node
}

sig Node {
	next: lone Node
}

// no node should be it's own successor
fact nextNotReflexive {
	no n:Node | n = n.next
}

fact allNodesBelongToSomeQueue {
	// The ".*" operator represents the _reflexive transitive closure_,
	// it returns the set consisting of all elements.
	// example:
	// q.root,
	// q.root.next,
	// q.root.next.next,
	// ...
	all n:Node | some q:Queue | n in q.root.*next
}

fact nextNotCyclic {
	// the ".^" operator represents the 
	// _non-reflexive transitive closure_,
	// which return sthe set consisting of all elements.
	// it does not include _n_ itself.
	// example:
	// n.next,
	// n.next.next,
	// n.next.next.next,
	// ...
	no n:Node | n in n.^next
}

// no constraints
pred show() {}

// get sample instances
run show for 2
