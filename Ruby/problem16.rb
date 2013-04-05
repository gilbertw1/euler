total = 0

(2**1000).to_s.each_char do |x|
  total += x.to_i
end

puts total