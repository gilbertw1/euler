calcRemainder :: Integer -> Integer -> Integer
calcRemainder a n = mod ((a-1)^n + (a+1)^n) (a^2)

main = do
  print result
  where
    result = sum $ map (\ x -> maximum $ map (calcRemainder x) [1..10000]) [3..1000]