module grandpa

abstract sig Person {
	// fathers are men and everyone has at most one
	father : lone Man,

	// mothers are women and everyone has at most one
	mother : lone Woman
}

// all men are persons
sig Man extends Person {
	// wives are women and every man has at most one
	wife: lone Woman
}

// all women are persons
sig Woman extends Person {
	// husbands are men and every woman has at most one
	husband : lone Man
}


fact Biology {
	// no person is his or her own ancestor
	no p: Person |
		p in p.^(mother + father)
}


fact Terminology {
	// a man's wife has that man as a husband.
	// a woman's husband has that woman as a wife.
	// (~ = symmetric)
	wife = ~husband
}


fact SocialConvention {
	no wife & *(mother + father).mother
	no husband & *(mother + father).father
}


assert noSelfFather {
	// man cannot be his own father
	no m: Man | m = m.father
}

// sanity check
//check noSelfFather

fun grandpas[p: Person] : set Person {
	// person's grandpas are the fathers of one's own mother and father
	//p.(mother + father).father
	let parent = mother + father + father.wife + mother.husband |
		p.parent.parent & Man
}

pred ownGrandpa[p: Person] {
	p in grandpas[p]
}

// instruct analyzer to search for configuration
// with at most 4 people in which a man
// is his own grandfather
run ownGrandpa for 2 Person expect 1
