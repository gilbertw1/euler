def iterate(x)
  if x.odd?
    (3*x)+1
  else
    x/2
  end
end

def num_iterations(x)
  count = 0
  curr = x
  while(curr != 1)
    count += 1
    curr = iterate(curr)
  end
  count+1 #We Count 1 As Well
end

longest = 0
num = 0

1.upto(1_000_000) do |x|
  its = num_iterations(x)
  if its > longest
    longest,num = its,x
  end
end

puts num