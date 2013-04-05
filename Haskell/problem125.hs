import Data.List (nub)

maxNum :: Integer
maxNum = 100000000

isPalindrome :: Integer -> Bool
isPalindrome x = (show x) == reverse (show x)

searchSumPals :: [Integer] -> Integer
searchSumPals xs = helper xs []
            where
              helper [x] y = sum $ nub y
              helper (x:xs) y = helper xs $ y ++ (searchSeries $ x:xs)

searchSeries :: [Integer] -> [Integer]
searchSeries xs = helper xs 2 []
            where
              helper xs count total | currSum >= maxNum     = total
                                    | isPalindrome currSum  = helper xs (count+1) (currSum:total)
                                    | otherwise             = helper xs (count+1) total
                                    where
                                      currSum = sum $ take count xs

main = do
  print result
  where
    result = searchSumPals $ map (^2) [1..(floor $ sqrt $ fromIntegral maxNum)]