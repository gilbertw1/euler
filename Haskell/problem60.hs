import EulerCommon as EC

{- Inefficient Implementation
isAnyCombinationPrime :: [Int] -> Bool
isAnyCombinationPrime xs = all (isPrime . EC.digitsToNum) $ map (\x -> concat $ map EC.digits x) $ concat [combs, map reverse combs]
					where
					combs = EC.combinations 2 xs
					
findCombinations :: [Int]
findCombinations = helper EC.primes EC.primes EC.primes EC.primes EC.primes 
				where
				helper (a:as) (b:bs) (c:cs) (d:ds) (e:es) | isAnyCombinationPrime [a,b,c,d,e] = [a,b,c,d,e]
														  | a < b 							  = helper as EC.primes cs ds es
														  | b < c							  = helper (a:as) bs EC.primes ds es
														  | c < d							  = helper (a:as) (b:bs) cs EC.primes es
														  | d < e							  = helper (a:as) (b:bs) (c:cs) ds EC.primes
														  | otherwise						  = helper (a:as) (b:bs) (c:cs) (d:ds) es
														  
main = do
	print result
	where
	result = findCombinations
End Inef Imple -}

primesTo10000 = filter (isPrime) [2..9999]
 
concatNums :: Int -> Int -> Int
concatNums x y = digitsToNum $ concat [digits x,digits y]
 
findCombinations = do
 a <- primesTo10000
 let m = helper a $ dropWhile (<= a) primesTo10000
 b <- m
 let n = helper b $ dropWhile (<= b) m
 c <- n
 let o = helper c $ dropWhile (<= c) n
 d <- o
 let p = helper d $ dropWhile (<= d) o
 e <- p
 return [a,b,c,d,e]
    where
    helper x = filter (\y -> all id[isPrime $ concatNums x y, isPrime $ concatNums y x])

main = do
    print result
    where
    result = sum $ head findCombinations
