import EulerCommon as EC
import Data.List

search_space = [1..10000]

isPandigital :: [Int] -> Bool
isPandigital xs = ([1..9] \\ xs) == []

formPandigitalProduct :: Int -> Maybe Int
formPandigitalProduct x = helper x 1 []
                        where
                        helper x y zs | length zs > 9    = Nothing
                                      | length zs < 9    = helper x (y+1) (zs ++ (EC.digits (x*y)))
                                      | isPandigital zs  = Just $ EC.digitsToNum zs
                                      | otherwise        = Nothing
                                      

findLargestPandigitalProduct :: Int
findLargestPandigitalProduct = helper search_space 0
                            where
                            helper [] y     = y
                            helper (x:xs) y = case formPandigitalProduct x of
                                                Just z  -> if z > y then helper xs z else helper xs y
                                                Nothing -> helper xs y
                                                
main = do
    print result
    where
    result = findLargestPandigitalProduct