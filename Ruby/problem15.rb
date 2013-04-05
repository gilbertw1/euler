require 'EulerExtensions'

def all_paths(x,y)
  (x+y).fac / (x.fac * y.fac)
end

puts all_paths(20,20)