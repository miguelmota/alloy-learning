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

// specifices scope that bounds the search
// for instances. At most 3 objects in each
// signature except for book which is
// limited to one
run show for 3 but 1 Book
