max = 4_000_000

cnt = 0
a = 1
b = 1

while b < max do
    cnt += b if b.even?
    a,b = b,a+b
end

puts cnt