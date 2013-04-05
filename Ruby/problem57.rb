def has_more_digits(x)
    z = x.to_s.split(/\//)
    z[0].length > z[1].length
end
    
def expand(x) 
    current = 2 + Rational(1, 2)
    (x-2).times do 
        current = 2 + Rational(1, current)
    end
    current = 1 + Rational(1, current)
end

total = 0

(4..1000).each do |x|
    x = expand(x)
    total += 1 if has_more_digits(x)
end

puts total

#1 + 1/(2 + 1/(2 + 1/2))