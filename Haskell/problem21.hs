import Data.List
import EulerCommon as EC

createDivisorPairs :: [Int] -> [(Int, Int)]
createDivisorPairs xs = (map (\y -> ((sum (EC.divisors y)),y)) xs)
					 
getAmicablePairs :: [Int] -> [(Int, Int)]
getAmicablePairs xs = helperFunction (createDivisorPairs xs)
                    where
                        helperFunction :: [(Int, Int)] -> [(Int, Int)]
                        helperFunction [] = []
                        helperFunction (x:xs) = (filter (\y -> ((fst x) == (snd y)) && ((snd x) == (fst y))) xs) ++ (helperFunction xs)

convertPairListToSingular :: [(Int,Int)] -> [Int]
convertPairListToSingular [] = []
convertPairListToSingular ((x,y):xs) = x : y : convertPairListToSingular xs

main = do
    print result
    where
        pairs = getAmicablePairs [1..9999]
        result = sum (nub (convertPairListToSingular pairs))