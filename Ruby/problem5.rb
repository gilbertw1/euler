def dividesAll(x)
  num = 2
  divsAll = true
  while(divsAll && num <= 20) do
    divsAll = x % num == 0
    num += 1
  end
  divsAll
end

found = false
count = 21

while(!found) do
  found = dividesAll count
end

puts count