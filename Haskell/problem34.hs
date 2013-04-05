import EulerCommon as EC

search_space = [1..45000]

isCurious :: Int -> Bool
isCurious x | (x == 1) || (x == 2)    	            = False
            | (sum (map (EC.factorial) xs)) == x    = True
            | otherwise					            = False
            where
                xs = EC.digits x
                
findAllCurious :: [Int]
findAllCurious = filter isCurious search_space

main = do
    print result
    where
        result = sum findAllCurious