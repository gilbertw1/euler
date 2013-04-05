import EulerExtensions
EulerExtensions.addExtensions()

def largest = 0

println 600851475143.factors().each {fac->
  if(fac.isPrime()) {
    largest = fac
  }
}

println largest