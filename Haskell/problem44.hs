pentagonals :: [Int]
pentagonals = map (\n -> div (n* ((3*n)-1)) 2) [1..5000]

findInterestingPentagonalPair :: [Int] -> [Int] -> (Int,Int)
findInterestingPentagonalPair (x:xs) ys | z == (0,0) = findInterestingPentagonalPair xs ys
									    | otherwise  = z
									    where									    
										helper a [] cs = (0,0)
										helper a (b:bs) cs | (elem (a+b) cs) && (elem (a-b) cs) = (a,b)
														   | otherwise 							= helper a bs cs
										z = helper x ys ys
														   
mySeq :: [Int] -> [Int]
mySeq [] = []
mySeq (x:xs) = x `seq` x:(mySeq xs)														   

main = do
	print ((fst result) + (snd result))
	where
	result = findInterestingPentagonalPair ps ps
		where
		ps = mySeq pentagonals				
