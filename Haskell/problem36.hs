import EulerCommon as EC

limit = 1000000

isPalindromeBin :: [Int] -> Bool
isPalindromeBin xs = xs == reverse xs

isPalindrome :: Int -> Bool
isPalindrome x = xstring == reverse xstring
            where
            xstring = show x
            
sumPalidromicNumbers :: Int
sumPalidromicNumbers = sum (filter (\x -> isPalindrome x && isPalindromeBin (EC.toBinary x)) [1..limit])

main = do
    print result
    where
    result = sumPalidromicNumbers