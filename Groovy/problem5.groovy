def dividesAll(x) {
  [1..20].each { a ->
    if(x % a != 0) {
      return false
    }
  }
  return true
}

def found = false
def curr = 20

while(!found) {
  if(dividesAll(curr)) {
    found = true
  } else {
    curr++
  }
}

println curr