var sum = (1 until 1000).filter(n => n % 3 == 0 || n % 5 == 0).foldRight(0)(_ + _)

println(sum)