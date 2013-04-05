import Data.Maybe (fromJust)

is_perfect_square :: Int -> Bool
is_perfect_square n | n < 2 	= False
					| otherwise = (round . sqrt $ fromIntegral n) ^ 2 == n

perfect_squares :: [Int]
perfect_squares = map (^2) [2..5000]

find_perfect_triple :: (Int,Int,Int)
find_perfect_triple = find_xpy perfect_squares	[]

find_xpy :: [Int] -> [Int] -> (Int,Int,Int)
find_xpy [] ys = (-1,-1,-1)
find_xpy (x:xs) ys 	| res == Nothing = find_xpy xs (x:ys)
					| otherwise		 = fromJust res
					where
					res = find_xpz x ys
						
find_xpz :: Int -> [Int] -> Maybe (Int,Int,Int)
find_xpz xpy [] = Nothing
find_xpz xpy (z:zs) 	| not $ is_perfect_square (xpy - z) = find_xpz xpy zs
						| res == Nothing 					= find_xpz xpy zs
						| otherwise 						= res
						where
						res = find_xmz xpy z zs

find_xmz :: Int -> Int -> [Int] -> Maybe (Int,Int,Int)
find_xmz xpy xpz [] = Nothing
find_xmz xpy xpz (z:zs) | not $ is_perfect_square (xpy - z) = find_xmz xpy xpz zs 
						| res == Nothing					= find_xmz xpy xpz zs
						| otherwise							= res
						where
						res = extract_xyz xpy xpz z

extract_xyz :: Int -> Int -> Int -> Maybe (Int,Int,Int)
extract_xyz xpy xpz xmz | is_perfect_square xmy && facts	= Just (x,y,z)
						| otherwise							= Nothing
						where
						ypz = xpy - xmz
						xmy = xpz - ypz
						ymz = xpy - xpz
						x = div (xpy + xmy) 2
						y = div (ypz + ymz) 2
						z = div (xpz - xmz) 2
						facts = x > 0 && y > 0 && z > 0 && x+y == xpy && x+z == xpz && y+z == ypz

main = do
	print result
	where 
	result = (\(x,y,z) -> x+y+z) find_perfect_triple
