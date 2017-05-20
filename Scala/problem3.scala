
object Main extends App {

  val num = 600851475143L
  println(primeFactors(num).max)

  def primeFactors(n: Long): Seq[Long] = {
    var work = n
    var factors = Seq[Long]()
    
    while (n % 2 == 0) {
      factors :+= 2L
      work = work / 2
    }

    for (i <- 3.to(Math.sqrt(work).toInt).by(2)) {
      while(work % i == 0) {
        factors :+= i.toLong
        work = work / i
      }
    }

    if (work > 2) {
      factors :+= work
    }

    factors
  }
}

/*
 The prime factors of 13195 are 5, 7, 13 and 29.

 What is the largest prime factor of the number 600851475143 ?
 */
