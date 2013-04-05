isMultiple :: Int -> Int -> Bool
isMultiple x y = (mod x y) == 0

sumMultiples :: Int
sumMultiples = foldl stepFun 0 [1..999]
            where 
                stepFun :: Int -> Int -> Int
                stepFun x y
                    | (isMultiple y 3) || (isMultiple y 5)  = x+y
                    | otherwise                             = x                       
    
main = do
    print sumMultiples