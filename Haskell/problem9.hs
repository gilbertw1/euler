isPythag :: (Int,Int,Int) -> Bool
isPythag (x,y,z) = (x^2 + y^2) == z^2

findPythagTripletForSum :: Int -> (Int,Int,Int)
findPythagTripletForSum x = helper 1 1 (x-2) x
                        where
                            helper :: Int -> Int -> Int -> Int -> (Int,Int,Int)
                            helper x y z sum 
                                | result == (0,0,0) = helper (x+1) (y+1) (z-2) sum
                                | otherwise = result
                                where result = searchForTriplet x y z
    
searchForTriplet :: Int -> Int -> Int -> (Int,Int,Int)
searchForTriplet x y z
    | y >= z = (0,0,0)  
    | isPythag (x,y,z) = (x,y,z)
    | otherwise = searchForTriplet x (y+1) (z-1)
    
main = do
    let result = findPythagTripletForSum 1000
    print result