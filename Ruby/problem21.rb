require 'EulerExtensions'

max_num = 10_000
@map = Hash.new
already = []

def eval(x)
  if @map[x]
    @map[x]
  else
    res = x.divisors.foldr(0) {|y,z| y+z} - x
    @map[x] = res
    res
  end
end

total = 0

(2..max_num).each do |x|
  num = eval x
  othr = eval num
  if x != num && x == othr && !already.include?([othr,num].sort)
    total += num + othr
    already << [num,othr].sort
  end
end

puts total