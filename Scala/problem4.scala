
object Main extends App {

  var curr = 999*999
  while(true) {
    if (isPalindrome(curr) && multipleOfThreeDigitFactors(curr)) {
      println(curr)
      System.exit(0)
    }
    curr -= 1
  }

  def multipleOfThreeDigitFactors(num: Int): Boolean = {
    var threeDigitFactors = Seq[Int]()
    for(i <- 900.to(999)) {
      if (num % i == 0) {
        threeDigitFactors :+= i
      }
    }
    threeDigitFactors.combinations(2).exists(c => c.reduce(_*_) == num)
  }

  def isPalindrome(num: Int): Boolean = {
    num.toString == num.toString.reverse
  }

}
