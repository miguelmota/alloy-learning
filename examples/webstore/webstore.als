module example/webstore

open util/ordering[Token] as tk
open util/ordering[State] as st

some sig Item, Token {}

enum Action {
	INIT,
	BUY,
	LOGIN,
	STUTTER
}

fun digest[password: String] : String { password }

pred authenticate[userid,password : String] {
	userid->digest[password] in
		("Alice" -> digest["Bob123"])
}

sig State {
	browser : lone Browser,
	action : Action,
	bought : lone Item,
	cookies : Browser -> Token,
	stock : set Item,
	cart : Token -> (Item+String),
	token: lone Token,
	nextToken: Token
}


pred login[s, s' : lone State ] {
	let browser = s'.browser,
		userid = browser.userid,
		password = browser.password {
		
		one userid
		one password
		no s.cart.userid
		authenticate[ userid,password ]
		
		s'.action = LOGIN
		s'.nextToken = s.nextToken.next
		s'.stock = s.stock
		s'.cart = s.cart + (s.nextToken->userid)
		s'.token = s.nextToken
		s'.bought = none
		s'.cookies = s.cookies + (browser->s.nextToken)	
	}
}

pred buy[ s,s' : State ] {
	let item = s'.bought,
		tkn = s'.token {
		some item
		item in s.stock

		one tkn
		some s.cart[tkn]
		
		s'.action = BUY
		s'.nextToken = s.nextToken
		s'.stock = s.stock-item
		s'.cart = s.cart + (tkn -> item)
		s'.token = tkn
		s'.bought = item
		s'.cookies = s.cookies		
	}
}


pred stutter[s, s' : State ] {
	s'.action = STUTTER
	s'.nextToken = s.nextToken
	s'.stock = s.stock
	s'.cart = s.cart
	s'.browser = none
	s'.token = none
	s'.token = none
	s'.bought = none

	s'.cookies = s.cookies
}

abstract sig Browser {
	userid : String,
	password : String
}

one sig Alice extends Browser{} {
	userid = "Alice"
	password = "Bob123"
}

one sig Eve extends Browser {}

fact {
	st/first.nextToken = tk/first
	st/first.stock =Item
	no st/first.bought
	no st/first.cart
	no st/first.browser
	no st/first.cookies
	st/first.action = INIT

	all s' : State - first, s : s'.prev {
			login[s,s']
		or
			buy[s,s']
		or
			stutter[s,s']
	}
}

assert Evil {
	no s: State | s.browser = Eve
}
check Evil for 4

