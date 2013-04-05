import EulerCommon as EC
import Data.List
import Data.Ord

minVal = 1000
maxVal = 9999
seqLength = 6

searchSpace = concat functionLists
functionLists = generateFunctionLists [triangle,square,pentagonal,hexagonal,heptagonal,octagonal]

triangle   n = div (n*(n+1)) 2	
square     n = n^2	 
pentagonal n = div (n*((3*n)-1)) 2	 
hexagonal  n = n*((2*n)-1)	 	
heptagonal n = div (n*((5*n)-3)) 2	
octagonal  n = n*((3*n)-2)

hasOneFromEach :: [Int] -> Int -> Bool
hasOneFromEach xs y = helper functionLists xs 0
				where
				helper [] as z = z == y
				helper (f:fs) as z | (length $ filter (`elem` f) as) > 0 = helper fs as (z+1)
								   | otherwise 						     = helper fs as z

longest [] = []
longest x  = maximumBy (comparing length) x

generateFunctionLists :: [(Int-> Int)] -> [[Int]]
generateFunctionLists [] = []
generateFunctionLists (f:fs) = (helper f 1 []) : generateFunctionLists fs 
					where
					helper f curr vx | currVal > maxVal = vx
									 | currVal < minVal = helper f (curr+1) vx
									 | otherwise	 	= helper f (curr+1) ((currVal):vx)
									 where
									 currVal = f curr
					
isSeq :: Int -> Int -> Bool
isSeq x y = (drop 2 $ EC.digits x) == (take 2 $ EC.digits y)

isSeqAll :: [Int] -> [Int] -> Bool
isSeqAll [] _ = True
isSeqAll (x:xs) zs | (length $ filter (x `isSeq`) zs) > 0 && (length $ filter (`isSeq` x) zs) > 0 = isSeqAll xs zs
				   | otherwise																  	  = False

searchForCycle :: [Int] -> [Int] -> [Int]
searchForCycle ys xs | oneFromEach && length xs == seqLength = xs
					 | not oneFromEach			     		 = [1]
					 | otherwise 			 		 		 = (helper $ map (:xs) $ filter (isSeq $ head xs) ys)
				where	
				oneFromEach = hasOneFromEach xs $ length xs
				helper zs = longest $ map (searchForCycle ys) zs 
					
main = do
	print result
	where
	result = sum $ head $ filter (\x -> length x == seqLength && isSeqAll x x) $ map (searchForCycle searchSpace) $ map (\x->[x]) searchSpace
