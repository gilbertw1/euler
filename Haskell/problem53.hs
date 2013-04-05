import EulerCommon as EC

target = 1000000
maxVal = 100

mySafeDiv = EC.safeDiv 0

combinatoric :: Integer -> Integer -> Integer
combinatoric n r = mySafeDiv (EC.factorial n) ((EC.factorial r) * (EC.factorial (n-r)))  

findNumCombinatoricsUnderTarget :: Integer
findNumCombinatoricsUnderTarget = helper 1 0
						where
						helper x y | x > maxVal = y
								   | otherwise  = helper (x+1) (y + (subHelper x 1 0))
								   where
								   subHelper n r v | n < r 		    = v
												   | comb > target = subHelper n (r+1) (v+1)
												   | otherwise 	   = subHelper n (r+1) v
												   where 
												   comb = combinatoric n r

main = do
	print result
	where
	result = findNumCombinatoricsUnderTarget
