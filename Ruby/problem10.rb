require "EulerExtensions"

max_num = 2_000_000
sum_primes = 0

max_num.primes_to.each do |x|
  sum_primes += x
end

puts sum_primes