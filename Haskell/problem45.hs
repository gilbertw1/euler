import Data.List

{----- Inefficient Implemenation (Runs out of memory)
numberToFind = 2
triangles = map (\n -> div (n*(n+1)) 2) [2..]
pentagonals = map (\n -> div (n*((3*n)-1)) 2) [2..]	
hexagonals = map (\n -> n * ((2*n)-1)) [2..]

findMatchInAllThreeInfiniteLists :: [Int] -> [Int] -> [Int] -> Int -> Int
findMatchInAllThreeInfiniteLists (x:xs) (y:ys) (z:zs) w 
		| (x == y) && (x == z) 	= if w == 1 then x else findMatchInAllThreeInfiniteLists xs ys zs (w-1) 
		| minimum [x,y,z] == x	= findMatchInAllThreeInfiniteLists xs (y:ys) (z:zs) w
		| minimum [x,y,z] == y	= findMatchInAllThreeInfiniteLists (x:xs) ys (z:zs) w
		| minimum [x,y,z] == z	= findMatchInAllThreeInfiniteLists (x:xs) (y:ys) zs w

main = do
	print result
	where
	result = findMatchInAllThreeInfiniteLists triangles pentagonals hexagonals numberToFind
-}

numberToFind = 2
triangle n = div (n*(n+1)) 2
pentagonal n = div (n*((3*n)-1)) 2
hexagonal n = n * ((2*n)-1)

findMatchInAllThreeInfiniteLists :: (Int,Int) -> (Int,Int) -> (Int,Int) -> Int -> Int
findMatchInAllThreeInfiniteLists (x,xt) (y,yp) (z,zh) w 
		| (xt == yp) && (xt == zh) 	= if w == 1 then xt else findMatchInAllThreeInfiniteLists ((x+1),(triangle $ x+1)) ((y+1),(pentagonal $ y+1)) ((z+1),(hexagonal $ z+1)) (w-1) 
		| minimum [xt,yp,zh] == xt	= findMatchInAllThreeInfiniteLists ((x+1),(triangle $ x+1)) (y,yp) (z,zh) w
		| minimum [xt,yp,zh] == yp	= findMatchInAllThreeInfiniteLists (x,xt) ((y+1),(pentagonal $ y+1)) (z,zh) w
		| minimum [xt,yp,zh] == zh	= findMatchInAllThreeInfiniteLists (x,xt) (y,yp) ((z+1),(hexagonal $ z+1)) w

main = do
	print result
	where
	result = findMatchInAllThreeInfiniteLists (2,(triangle 2)) (2,(pentagonal 2)) (2, (hexagonal 2)) numberToFind
