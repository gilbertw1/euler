binomial :: Integer -> Integer -> Integer
binomial x y = div (productRange (y+1) x) (productRange 1 (x-y))

productRange :: Integer -> Integer -> Integer
productRange x y = product [x..y]

main = do
  print result
    where
      result = sum [binomial (8+a) a+binomial (9+a) a-10|a<-[1..100]]