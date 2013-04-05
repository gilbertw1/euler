isPalindrome :: Integer -> Bool
isPalindrome x = z == (reverse z)
    where z = show x

myMax :: [Integer] -> Integer
myMax [] = 0
myMax xs = maximum xs

largestPalindromeProduct :: Integer -> [Integer] -> Integer
largestPalindromeProduct x ys = myMax (filter isPalindrome (map (\ z -> z * x) ys))

searchProducts :: [Integer] -> [Integer] -> Integer
searchProducts xs ys = searchProductsFun xs ys 0

searchProductsFun :: [Integer] -> [Integer] -> Integer -> Integer
searchProductsFun [] ys z = z
searchProductsFun (x:xs) ys z 
    | z < w = searchProductsFun xs ys w
    | otherwise = searchProductsFun xs ys z
    where w = largestPalindromeProduct x ys
    
main = do
    print result
    where
        result = searchProducts (reverse [800..999]) [800..999]