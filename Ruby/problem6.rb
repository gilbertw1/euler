square_of_sum = 0
sum_of_square = 0

(1..100).each do |x|
  square_of_sum += x
  sum_of_square += x**2
end

square_of_sum = square_of_sum**2

puts (square_of_sum - sum_of_square)