stringToIntegerList :: String -> [Integer]
stringToIntegerList [] = []
stringToIntegerList (x:xs) = (read [x] :: Integer) : stringToIntegerList xs 

main = do
    print result
    where
        result = sum (stringToIntegerList (show (2^1000)))