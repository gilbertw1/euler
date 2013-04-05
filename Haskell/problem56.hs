import EulerCommon as EC

maxNum = 100

main = do
	print result
	where
	result = maximum $ map (\x -> maximum $ map (\y -> sum $ EC.digits (x^y)) [1..maxNum]) [1..maxNum]
