allDividesEvenly :: [Int] -> Int -> Bool
allDividesEvenly [] y = True
allDividesEvenly (x:xs) y
    | mod y x == 0  = allDividesEvenly xs y
    | otherwise     = False

findSmallestNumberDividesEvenly :: [Int] -> Int
findSmallestNumberDividesEvenly xs = helper 1 xs
                                where
                                helper :: Int -> [Int] -> Int
                                helper x ys 
                                    | (mod x 13 == 0) && (mod x 17 == 0) && allDividesEvenly ys x   = x
                                    | otherwise                                                     = helper (x+1) ys

main = do
    let result = findSmallestNumberDividesEvenly [1..20]
    print result