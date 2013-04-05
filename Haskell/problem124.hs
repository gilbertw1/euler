import EulerCommon (factors)
import Data.List (nub,sortBy)
import Data.Ord (comparing)

rad :: Int -> Int
rad x = foldr (*) 1 $ nub $ factors x

main = do
  print result
  where
    result = (sortBy (comparing (\(_,x) -> x)) $ map (\x -> (x,rad x)) [1..100000]) !! 9999