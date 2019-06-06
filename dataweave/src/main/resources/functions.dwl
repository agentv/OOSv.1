%dw 2.0
output application/dw

import adjustedFor as adj4 from dw::modules::MyFirstMod

var theTotalSeats = 400

fun getTotalSeats (pt) = if (
	(pt contains "737") or
	(pt contains "707")
) 300 else 500

var getTotalSeatsFn = (pt) -> do {
	var pn = pt[-3 to -1] as Number
	---
	if (pn == 737 or pn == 707 or pn == 757) 110 else 150
}

var xes = {
	USD: 1.0,
	EUR: 0.8,
	CAD: 1.2
}
var adjustedFor = (p,c) -> p * xes[c]

---
payload..*return map {
	($), //convert obj to array of k:v pairs
	totalSeats: getTotalSeatsFn($.planeType),
	priceUSD: adjustedFor($.price,"USD"),
	priceEUR: $.price dw::modules::MyFirstMod::adjustedFor "EUR",
	priceCAD: $.price adj4 "CAD"
}