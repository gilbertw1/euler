sumEvenFibsUnder :: Int -> Int
sumEvenFibsUnder x = helperFun 1 1 0 x
                where
                    helperFun :: Int -> Int -> Int -> Int -> Int
                    helperFun x y z w
                        | newFib > w        = z
                        | mod newFib 2 == 0 = helperFun y newFib (z+newFib) w 
                        | otherwise         = helperFun y newFib z w
                        where
                            newFib = x + y

main = do
    print result
    where   
        result = sumEvenFibsUnder 4000000