import EulerCommon as EC

---Inefficient Algorithm
findAllPaths :: Int -> Int -> Int
findAllPaths x y 	
    | (x == 0) && (y == 0) = 1					
    | (x == -1) || (y == -1) = 0
    | otherwise =(findAllPaths (x-1) y) + findAllPaths x (y-1)
---End Inefficient Algorithm

findNumPaths :: Int -> Int -> Int
findNumPaths x y = div (EC.factorial (x+y)) ((EC.factorial x) * (EC.factorial y))

main = do
    print result
    where
        result = findNumPaths 20 20