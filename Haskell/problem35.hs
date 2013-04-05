import EulerCommon as EC

limit = 1000000

rotations :: [a] -> [[a]]
rotations xs = helper xs [] (length xs)
            where
                helper [] _ _       = []
                helper _ ys 0       = ys
                helper (x:xs) ys z  = helper rotation (rotation:ys) (z-1)
                    where
                        rotation = xs ++ [x]

isCircular :: Int -> Bool
isCircular x = all EC.isPrime (map digitsToNum (rotations (digits x)))

numCirclesBelowMax :: Int
numCirclesBelowMax = helper EC.primes 0 
                where
                    helper (x:xs) y | x > limit     = y
                                    | isCircular x  = helper xs (y+1)
                                    | otherwise     = helper xs y
                                    
main = do
    print result
    where
        result = numCirclesBelowMax