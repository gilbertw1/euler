def isMultiple(x)
    x % 3 == 0 || x % 5 == 0
end

count = 0

(1..999).each do |x|
    count += x if isMultiple x
end

puts count
