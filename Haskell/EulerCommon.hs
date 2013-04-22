module EulerCommon where

import Data.List (nub,tails,permutations,delete)
import Data.Char (toUpper)

-- isPrime Functions
ldp :: (Integral a) => a -> a
ldp n = ldpf primes n

primes :: (Integral a) => [a]
primes = 2 : filter isPrime [3..]

ldpf :: (Integral a) => [a] -> a -> a
ldpf (p:ps) n 
        | rem n p == 0  = p
        | p^2 > n	    = n
        | otherwise     = ldpf ps n
          
isPrime :: (Integral a) => a -> Bool
isPrime n 
        | n < 1	    = error "This is not a positive Integer!!"
        | n == 1	= False
        | otherwise	= ldp n == n
-- end isPrime Functions
    
factors :: (Integral a) => a -> [a]
factors n 
        | n < 1	    = error "This is not a positive Integer!!"
        | n == 1	= []
        | otherwise = p : factors (div n p) where p = ldp n

divisors :: (Integral a) => a -> [a]
divisors x = delete x $ map product $ nub $ powerset $ factors x

powerset :: [a] -> [[a]]
powerset xs = foldr (\h t->t++map(h:)t) [[]] xs

factorial :: (Integral a) => a -> a
factorial = product . enumFromTo 1

eulerTotient :: (Integral a) => a -> a
eulerTotient x 	| length (nub (factors x)) == 1	= x-1 
                | otherwise			            = helper x (nub (factors x))
                where
                    helper x [] = x
                    helper x (y:ys) = helper (x - (div x y)) ys
                    
permutation xs = permutations xs

combinations :: Int -> [a] -> [[a]]
combinations 0 _  = [ [] ]
combinations n xs = [ y:ys | y:xs' <- tails xs
                           , ys <- combinations (n-1) xs']

safeMod :: (Integral a) => a -> a -> a -> a
safeMod a _ 0 = a
safeMod _ x y = mod x y

safeDiv :: (Integral a) => a -> a -> a -> a
safeDiv a _ 0 = a
safeDiv _ x y = div x y

digits :: (Integral a) => a -> [a]
digits 0 = [0]
digits x = case x `divMod` 10 of
                (0,b) -> [b]
                (a,b) -> digits a ++ [b]
                
digitsToNum :: (Integral a) => [a] -> a
digitsToNum [] = 0
digitsToNum (x:xs) = 10^(length xs) * x + digitsToNum xs

toBinary :: (Integral a) => a -> [a]
toBinary x = reverse $ helper x
            where
            helper 0 = []
            helper y = b:(helper a)
                where   
                (a,b) = quotRem y 2

convertWordToNumber :: String -> Int
convertWordToNumber xs = sum $ map convertCharToNumber xs
			
--Todo Make safe for other characters other than a-z				
convertCharToNumber :: Char -> Int
convertCharToNumber x = snd $ head $ filter (\(a,b) -> a==(toUpper x)) $ zip ['A'..'Z'] [1..]
