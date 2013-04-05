import EulerCommon as EC
import Data.List

numberInSequence = 4

flattenFactors :: [Int] -> [(Int,Int)]
flattenFactors xs = helper (tail xs) [((head xs),1)]
				where
				helper [] ys 		 	  = ys
				helper (x:xs) ((y,yv):ys) = if x == y 
											then helper xs ((y,yv+1):ys) 
											else helper xs ((x,1):(y,yv):ys) 

allDisjoint :: [(Int,Int)] -> [[(Int,Int)]] -> Bool
allDisjoint xs [] = True
allDisjoint xs (ys:yss) | not $ (intersect xs ys == []) && (length xs == numberInSequence) = False
						| otherwise					  									   = allDisjoint xs yss

diffFactorsSequence :: Int -> Int
diffFactorsSequence x = helper x [] 1
				where
				helper x ys z | allDisjoint flattenedFactors ys  && correctSize = helper (x+1) (flattenedFactors:ys) (z+1)
							  | otherwise 										= z
							  where
							  flattenedFactors = flattenFactors $ EC.factors x
							  correctSize = length flattenedFactors == numberInSequence

findFirstInDifferenctFactorsSequence :: Int
findFirstInDifferenctFactorsSequence = helper 3
									where
									helper x | diffFactorsSequence x > numberInSequence = x
											 | otherwise								= helper (x+1)

main = do
	print result
	where
	result = findFirstInDifferenctFactorsSequence
