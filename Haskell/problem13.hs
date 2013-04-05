convertStringListToIntegerList :: [String] -> [Integer]
convertStringListToIntegerList xs = map (\ x -> read x::Integer) xs

main = do
    fileText <- readFile "in_problem13.txt"
    print (sum (convertStringListToIntegerList (lines fileText)))