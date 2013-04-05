import Data.List

aRange = [10..99]
bRange = [100..999]

asRange = [1..9]
bsRange = [1000..9999]

isPandigital :: [Int] -> Bool
isPandigital x = null (nums \\ xs)
            where
            xs = concat (map show x)
            nums = concat (map show [1..(length xs)])
            
findPandigitalProducts :: [Int] -> [Int] -> [Int]
findPandigitalProducts [] ys = []
findPandigitalProducts (x:xs) ys = nub ((map (helper x) ys) ++ findPandigitalProducts xs ys)
                            where
                                helper a b  | isPandigital [a,b,z]  = z
                                            | otherwise             = 0
                                            where z = a*b
                                
main = do
    print result
    where
        result = sum ((findPandigitalProducts aRange bRange) ++ (findPandigitalProducts asRange bsRange))