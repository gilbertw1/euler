import EulerCommon as EC

findAtPosition :: [a] -> Integer -> a
findAtPosition (x:xs) 1 = x
findAtPosition (x:xs) y = findAtPosition xs (y-1)

main = do
    print result
    where
        result = findAtPosition EC.primes 10001