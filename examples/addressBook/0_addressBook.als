module tour/addressBook

// 3 signatures Name, Addr, Book
sig Name, Addr {}
sig Book {
	// addr maps names to addresses.
	// multiple names can be mapped to an address.
	// b->n->a
	addr: Name -> lone Addr
}

pred show {}

// specifices scope that bounds the search
// for instances. At most 3 objects in each
// signature except for book which is
// limited to one
run show for 3 but 1 Book
