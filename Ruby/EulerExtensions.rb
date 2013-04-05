class Integer
  
  def factors(m = 2)
    return @factors if @factors
    return @factors = [] if [0, 1].include?(self)

    if (self % m) == 0 
      @factors = [m] + (self / m).factors(m)
    elsif Math.sqrt(self) <= m
      @factors = [self]
    else
      @factors = factors(m + 1)
    end
  end

  def sieve
    vals = (0..self).to_a
    vals[0..1] = [nil, nil]

    Math.sqrt(self).floor.times do |val|
      next unless vals[val]
      
      ((val ** 2)..self).step(val) do |mult|
        vals[mult] = nil
      end
    end    
    vals
  end

  def primes_to
    sieve.compact
  end

  def prime?
    factors.first == self
  end

  def divisors
    divs = factors.power_set.map do |xs|
      xs.foldl 1 do |x,y|
        x*y
      end
    end
    divs.uniq
  end

  def fac
    return 1 if self == 0
    (1..self).inject {|i,j| i*j}
  end

end

class Array
  def power_set
    inject([[]]){|c,y|r=[];c.each{|i|r<<i;r<<i+[y]};r}
  end

  def foldl(accum, &block)
     each {|value| accum = yield(accum, value)}
     return accum
   end
   
  def foldr(accum, &block)
     reverse.foldl(accum, &block)
   end
end
