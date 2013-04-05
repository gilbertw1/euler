object Factors {
	def findForNumber(num: Int, val m, List[Int] factors): List[Int] = {
		if()
	}
}


600851475143



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