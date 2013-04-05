lines = IO.readlines('in_problem13.txt')
total = 0

lines.each do |line|
  total += line.to_i
end

puts total.to_s[0..9]