main = do
	print result
	where
	result = reverse $ take 10 $ reverse $ show $ foldr (\x y -> y + (x^x)) 0 [1..1000]
