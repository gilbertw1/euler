def isPalindrome(x) {
  x.toString() == x.toString().reverse()
}

def largest = 0

100.upto(999) {x->
  100.upto(999) {y->
    def val = x*y
    if(isPalindrome(val) && val > largest) {
      largest = val
    }
  }
}

println largest