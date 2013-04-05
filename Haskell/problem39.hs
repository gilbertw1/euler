isRight :: Int -> Int -> Int -> Bool
isRight x y z = (x^2) + (y^2) == (z^2)

getTripletsThatSumToNumber :: Int -> [(Int,Int,Int)]
getTripletsThatSumToNumber x = filter (helper n) $ zip3 [1..x] [1..x] [1..x]
                            where
                            helper n (x,y,z) = sum == n && sum < 180 && isRight a b c
                                where
                                sum = x+y+z