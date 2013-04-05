import EulerCommon as EC
import Data.Ord
import Data.List

{- Inefficient
findMinimualSolution :: Int -> [Int]
findMinimualSolution d = head $ filter (\(x:y:[])-> solve d x y) $ EC.combinations 2 $ reverse [1..1000]

solve :: Int -> Int -> Int -> Bool
solve d x y = (x^2) - (d*(y^2)) == 1 
-}

minimalSolution :: Int -> Int
minimalSolution d = head $ filter (/=0) $ map (solve d) [1..]

solve :: Int -> Int -> Int
solve d y | isPerfectSquare val = round $ sqrt $ fromIntegral val
          | otherwise           = 0
        where
            val = 1 + (d*(y^2))

isPerfectSquare :: Int -> Bool
isPerfectSquare x = (root^2) == x
            where
                root = round $ sqrt $ fromIntegral x

main = do
    print result
    where
    result = snd $ maximumBy (comparing (\(x,_)->x)) $ zip (map minimalSolution [1..1000]) [1..1000]
--661