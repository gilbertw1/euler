import Data.List
import EulerCommon as EC

--Inefficient Implementation
inefTriangles :: [Int]
inefTriangles = map (\ x -> sum [1..x]) [1..]

inefdivisors :: Int -> [Int]
inefdivisors x = helper x 1 []
            where
                helper :: Int -> Int -> [Int] -> [Int]
                helper number curr divs
                    | curr > (div number 2) = number:divs
                    | (mod number curr) == 0 = helper number (curr+1) (curr:divs)
                    | otherwise = helper number (curr+1) divs
---- End Inefficient

numDivisors :: Int -> Int
numDivisors x = (length $ nub $ EC.powerset $ EC.factors x) - 1

triangles :: [Int]
triangles = map (\x -> div (x^2 + x) 2) [1..] 

isOdd :: Int -> Bool
isOdd x = mod x 2 == 1

findTriangleExceedingFactors :: Int -> Int 
findTriangleExceedingFactors x = helper triangles x
                            where
                                helper :: [Int] -> Int -> Int
                                helper (x:xs) y 
                                    | isOdd x = helper xs y
                                    | numDivisors x > y = x
                                    | otherwise = helper xs y
    
main = do
    print result
    where
        result = findTriangleExceedingFactors 500