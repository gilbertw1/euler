import EulerCommon as EC
import Data.List

total_truncatable = 11

isTruncatable :: Int -> Bool
isTruncatable x = helper x True && helper x False
                where
                helper x left   | prime && single = True
                                | prime && left   = helper (EC.digitsToNum $ tail xs) left
                                | prime           = helper (EC.digitsToNum $ init xs) left
                                | otherwise       = False
                                where
                                xs = EC.digits x
                                single = length xs == 1
                                prime = not ([0] `isPrefixOf` xs) && EC.isPrime x

findTruncatablePrimesSum :: Int
findTruncatablePrimesSum = helper EC.primes total_truncatable 0
                        where
                        helper _ 0 z = z
                        helper (x:xs) y z   | x > 10 && isTruncatable x   = helper xs (y-1) (x+z)
                                            | otherwise                    = helper xs y z
                                            
main = do
    print result
    where
    result = findTruncatablePrimesSum