import EulerCommon as EC
import Data.List

maxNumber = 6

hasInterestingProperty :: Int -> Bool
hasInterestingProperty x = helper x 2
                    where
                    helper x y | y > maxNumber							  = True
                               | (EC.digits x) \\ (EC.digits (x*y)) == [] = helper x (y+1) 
                               | otherwise 								  = False

main = do
	print result
	where
	result = head $ filter hasInterestingProperty [1..]
