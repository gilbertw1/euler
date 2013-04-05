import EulerCommon as EC
import Data.List

increment = 3330
startValue = 1488

isPrimePermSequence :: Int -> Bool
isPrimePermSequence x = if not $ isPrime x then False else helper x 1
				where
				helper x y | y == 3 													  		= True
						   | (sort $ EC.digits x) == (sort $ EC.digits next) && EC.isPrime next = helper next (y+1)
						   | otherwise 													  		= False
						   where
						   next = x + increment

main = do
	print result
	where
	seqHead = head $ filter (isPrimePermSequence) [startValue..]
	result = [seqHead, seqHead+increment, seqHead+increment*2]
