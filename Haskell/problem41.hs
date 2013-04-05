import Data.List
import EulerCommon as EC

max_number = 10000000

isPandigital :: Int -> Bool
isPandigital = (=="1234567") . sort . show
                
findLargestPandigitalPrime :: Int
findLargestPandigitalPrime = head . filter EC.isPrime . filter isPandigital $ [7654321,7654320..]
                                            
main = do
    print result
    where 
    result = findLargestPandigitalPrime
