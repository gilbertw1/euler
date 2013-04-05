min = 800
max = 999

def palindrome?(x) 
  x.to_s == x.to_s.reverse
end

largest = 0

(min..max).each do |x|
  (min..max).each do |y|
    square = x*y
    largest = square if palindrome? square
  end
end

puts largest