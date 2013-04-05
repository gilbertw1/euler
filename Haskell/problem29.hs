import Data.List

exponent_set = [2..100]

countDistinctExponentSet :: Int
countDistinctExponentSet = helper exponent_set exponent_set []
                        where
                            helper [] _ zs = length (nub zs) 
                            helper (x:xs) ys zs = helper xs ys (zs ++ (map (x^) ys))
                            
main = do
    print result
    where
        result = countDistinctExponentSet