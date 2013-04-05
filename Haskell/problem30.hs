num_range = [2..200000]

toIntList :: Int -> [Int]
toIntList x = map (\y -> read [y] :: Int) (show x) 

isSumOfFifthPowerDigits :: Int -> Bool
isSumOfFifthPowerDigits x = sum (map (^5) (toIntList x)) == x

sumAllSumOfFifthPowerDigits :: Int
sumAllSumOfFifthPowerDigits = sum (filter isSumOfFifthPowerDigits num_range)

main = do
    print result
    where
        result = sumAllSumOfFifthPowerDigits