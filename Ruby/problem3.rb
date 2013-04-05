require "EulerExtensions"

largest = 0

600851475143.factors.each do |x|
  largest = x if x.prime?
end

puts largest