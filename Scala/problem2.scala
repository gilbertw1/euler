object FibGenerator {
    val fibs = 1 #:: fib(1,1)

    def fib(x: Int, y: Int): Stream[Int] = {
    	return (x+y) #:: fib(y,x+y)
    }
}

val sum = FibGenerator.fibs.takeWhile(_ < 4000000).filter(_ % 2 == 0).foldRight(0)(_ + _)
println(sum)