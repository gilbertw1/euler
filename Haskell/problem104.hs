import Data.List (sort)

isPandigital :: String -> Bool
isPandigital xs = "123456789" == (sort xs)

isPandigitalBothEnds x = (isPandigital $ show a)  && (isPandigital $ take 9 $ show x)
                where
                  a = x `mod` 1000000000

fibs :: (Integer -> Integer -> Bool) -> Integer
fibs f = genFibs 4 1 2 f
      where
        genFibs i x y f | f i z     = i
                        | otherwise = genFibs (i+1) y z f
          where
            z = x + y

main = do
  print result
    where
      result = fibs (\x y -> isPandigitalBothEnds y)