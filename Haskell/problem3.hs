import EulerCommon as EC
      
main = do
    print result
    where
        primeFactors = filter EC.isPrime (EC.factors 600851475143)
        result = maximum primeFactors