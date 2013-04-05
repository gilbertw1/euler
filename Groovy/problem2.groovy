def max = 4000000
def even = {x -> x%2 == 0}

def (a,b,total) = [1,1,0]

while(b < max) {
  if(even(b)) {
    total += b
  }
  (a,b) = [b,a+b]
}

println total