import Data.List (sort)

isNotBouncy :: Int -> Bool
isNotBouncy x = xs == sorted || (reverse xs) == sorted
            where
              xs = show x
              sorted = sort xs

getMaxNotBouncy :: Int -> Int
getMaxNotBouncy x = floor ((0.01) * (fromIntegral x))

findNumberWithBouncyPercent :: Int
findNumberWithBouncyPercent = helper 101 100 $ getMaxNotBouncy 101
                    where
                      helper curr nbCount nbMax | newCount <= nbMax = curr
                                                | otherwise         = helper (curr+1) newCount $ getMaxNotBouncy $ curr+1
                                                where
                                                  newCount = if isNotBouncy curr then nbCount + 1 else nbCount

main = do
  print result
    where
      result = findNumberWithBouncyPercent