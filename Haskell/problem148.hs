start = [1,2,1]
rows = 1000 --000000

nextRow :: [Integer] -> [Integer]
nextRow xs = helper xs []
        where
          helper (x:[]) zs = [1] ++ zs ++ [1]
          helper (x:y:xs) zs = helper (y:xs) $ (x+y):zs

findDivisibleInPascal :: Int
findDivisibleInPascal = helper start 3 3
                     where
                       helper xs y z | z > rows  = y
                                     | otherwise = helper (nextRow xs) (y + (length $ filter (\n -> not $ mod n 7 == 0) xs)) (z+1)

main = do
  print result
  where
    result = findDivisibleInPascal