
object Main extends App {

  var curr = 2520L

  while (true) {
    if (test(curr)) {
      println(curr)
      System.exit(0)
    }
    curr += 1
  }

  def test(num: Long): Boolean = {
    num % 17 == 0 &&
    num % 19 == 0 &&
    num % 11 == 0 &&
    num % 13 == 0 &&
    num % 20 == 0 &&
    num % 18 == 0 &&
    num % 16 == 0 &&
    num % 15 == 0 &&
    num % 14 == 0 &&
    num % 12 == 0
  }
}
