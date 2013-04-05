require "EulerExtensions"

FACTORS = 500

def triangle_for(n)
  (n * (n+1))/2
end

found = false
curr = 2

while(!found)
  triangle = triangle_for(curr)
  found = triangle.divisors.length > FACTORS
  curr += 1
end

puts triangle