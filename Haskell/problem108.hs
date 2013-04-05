import Data.Ratio

search :: Int -> Int -> Int
search n x = helper x x (1%n)
           where
             helper x y n | (1%x) + (1%y) == n = 1
                          | (1%x) + (1%y) < n  = 0
                          | otherwise          = helper x (y+1) n

solutions :: Int -> Int
solutions n = sum $ map (search n) [(n+1)..(n*2)]

main = do 
  print result
    where
      result = head $ filter (\x -> x > 50) $ map solutions [1..]