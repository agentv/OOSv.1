%dw 2.0

var xes = {
	USD: 1.0,
	EUR: 0.8,
	CAD: 5.2
}
var adjustedFor = (p,c) -> p * xes[c]