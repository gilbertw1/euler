def divs(x) {
  x % 3 == 0 || x % 5 == 0
}

def total = 0

1.upto(999) { x ->
  if(divs(x)) {
    total += x
  }
}

println total