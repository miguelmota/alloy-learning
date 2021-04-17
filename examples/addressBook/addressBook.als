module tour/addressBook

// 3 signatures Name, Addr, Book
sig Name, Addr {}
sig Book {
	// addr maps names to addresses.
	// multiple names can be mapped to an address.
	// b->n->a
	addr: Name -> lone Addr
}

pred show(b: Book) {
	// to see instance with more than one link, add constraint.
	// "#b.addr" is the number of associations in this mapping.
	#b.addr > 1

	// does our model allow one name to map to two addresses?
	// this will not fine any instances.
	//some n: Name | #n.(b.addr) > 1

	// replace inconsistent constraint by a weaker one.
	// allows for more than one address in the address book.
	#Name.(b.addr) > 1

	// notes:
	// the expression "n.b(b.addr)" is looking up a single
	// name _n_ in address book _b_.
	// The expression "Name.(b.addr)" looks up the entire set
	// of names.
}

pred add(b, b': Book, n: Name, a: Addr) {
	// constraint that says that the address mapping in the 
	// new book is equal to the address mapping in the old book,
	// with the addition of a link from the name to the address.
	b'.addr = b.addr + n -> a
}

pred showAdd (b,b': Book, n: Name, a: Addr) {
	// invoke "add" predicate
	add [b, b', n, a]
	#Name.(b'.addr) > 1
}

// specifices scope that bounds the search
// for instances. At most 3 objects in each
// signature except for book which is
// limited to one
run showAdd for 3 but 2 Book
