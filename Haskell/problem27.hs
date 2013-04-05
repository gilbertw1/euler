import EulerCommon as EC

a_range = [-1000..1000]
b_range = [-1000..1000]

extractNumPrimesForEquation :: Int -> Int -> Int
extractNumPrimesForEquation x y = helper x y 0
                            where
                                helper a b n 
                                    | (z > 0) && EC.isPrime z  = helper a b (n+1)
                                    | otherwise     = n
                                    where z = n^2 + (a*n) + b 

findEquationWithLongestPrimeResults :: [Int] -> [Int] -> (Int,Int,Int)
findEquationWithLongestPrimeResults x y = helper x y (0,0,0)
                                    where
                                        helper [] _ t = t
                                        helper (a:as) bs t 
                                            | larger largestInSet t = helper as bs largestInSet
                                            | otherwise             = helper as bs t
                                            where
                                                largestInSet = findLargestInSet a bs
                            
larger :: (Int,Int,Int) -> (Int,Int,Int) -> Bool
larger (fSize,_,_) (sSize,_,_) = fSize > sSize
                                                
findLargestInSet :: Int -> [Int] -> (Int,Int,Int)
findLargestInSet x ys = foldr (\a b -> if larger a b then a else b) (0,0,0) (map (\new_y -> ((extractNumPrimesForEquation x new_y),x,new_y)) ys)
                            
main = do
    print result
    where
        result = findEquationWithLongestPrimeResults a_range b_range