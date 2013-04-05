require 'EulerExtensions'

puts (100.fac).to_s.split(//).foldr(0) {|x,y| x+y.to_i}