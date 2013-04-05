import EulerCommon (digits)
import Data.List (sort)

position :: Int
position = 30

sumOfSquareDigitsList :: [Integer]
sumOfSquareDigitsList = sort [x^y | x <- [2..200], y <- [2..9], let exp = x^y, x == (sum $ digits exp)]

main = do
  print result
  where
    result = sumOfSquareDigitsList !! (position-1)
