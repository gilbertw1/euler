import List as L

currencies = [1,2,5,10,20,50,100,200]
total = 200

iterate_count :: [Int] -> Int
iterate_count xs = sum $ map iterate_count $ combine_smallest $ L.sort xs

combine_smallest :: [Int] -> [[Int]]
combine_smallest xs = filter (\xs -> not $ xs == []) $ map (combine_for_currency xs) $ filter (\x -> not $ x == (head xs)) currencies

combine_for_currency :: [Int] -> Int -> [Int]
combine_for_currency xs curr = combine xs curr 0 

combine :: [Int] -> Int -> Int -> [Int]
combine [] curr total = []
combine (x:xs) curr total 	| sumVal == curr = (curr:xs)
							| sumVal > curr  = []
							| otherwise      = combine xs curr (sumVal)
						where
							sumVal = total + x

main = do
	print result
	where 
		result = iterate_count $ take 10 $ repeat 1