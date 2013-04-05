expansions = zip ns ds 
    where
    ns = 3 : zipWith (\x y -> x + 2 * y) ns ds
    ds = 2 : zipWith (+) ns ds
 
numDigits = length . show
 
main = do
	print result
	where
    result = length $ filter (\(n,d) -> numDigits n > numDigits d) $ take 1000 expansions
