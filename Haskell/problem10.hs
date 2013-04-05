import EulerCommon as EC

sumPrimesBelowNumber :: Integer -> Integer
sumPrimesBelowNumber x = foldr (+) 0 $ takeWhile (<x) EC.primes
    
main = do
    print result
    where 
        result = sumPrimesBelowNumber 1000000