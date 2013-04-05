import EulerCommon as EC

largestPrimeSumUnderMillion = 546

findLargestPrimeSum :: Int
findLargestPrimeSum = helper $ take largestPrimeSumUnderMillion EC.primes
					where
					helper xs | isPrime $ listSum = listSum 
							  | otherwise		  = helper $ drop 1 xs
							  where
							  listSum = sum xs
							 
main = do
	print result
	where
	result = findLargestPrimeSum
