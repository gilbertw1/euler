import EulerCommon as EC

target :: Int
target = 89

chain_ends_with :: Int -> Int -> Bool
chain_ends_with end num | num == 1   = False
                        | num == end = True
                        | otherwise  = chain_ends_with end $ iterate_chain num

iterate_chain :: Int -> Int
iterate_chain x = foldr (+) 0 $ map (^2) $ EC.digits x

main = do
    print result
    -- Pretty Inefficient (Good way would use caching)
    where result = length $ filter (chain_ends_with target) [1..100000]