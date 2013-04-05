import Data.List
import EulerCommon as EC

max_number = 3000--20161

deleteAll :: [Int] -> [Int] -> [Int]
deleteAll [] ys = ys
deleteAll (x:xs) ys = deleteAll xs (delete x ys)

addToList :: Int -> [Int] -> [Int]
addToList x [] = []
addToList x (y:ys)
    | z > max_number    = []
    | otherwise         = z : addToList x ys
    where
        z = x + y

getAllSums :: [Int] -> [Int]
getAllSums xs = helper xs []
                where
                    helper :: [Int] -> [Int] -> [Int]
                    helper [] zs = zs
                    helper (x:xs) zs = helper xs (nub ((addToList x xs) ++ zs))

isAbundant :: Int -> Bool
isAbundant x = (sum (EC.divisors x)) > x

getAllAbundantNumbers :: [Int] -> [Int]
getAllAbundantNumbers xs = filter (isAbundant) xs

--All even numbers above 48 can be written as the sum of two abundant numbers
getAllNumbersNotAbuntantSumsBelow :: Int -> [Int]
getAllNumbersNotAbuntantSumsBelow x = filter (\y -> notElem y abundantSums) (filter (\y -> y > 48 && (mod y 2 == 1)) [1..x])
                                    where 
                                        abundantSums = (getAllSums (getAllAbundantNumbers [1..x]))
                        
main = do
    print result
    where
        result = sum (getAllNumbersNotAbuntantSumsBelow max_number)