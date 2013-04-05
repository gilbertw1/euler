number_of_digits = 1000

findFibExeedingNumberOfDigits :: Int 
findFibExeedingNumberOfDigits = helper 1 1 3
                            where
                                helper prev curr fib
                                    | (length (show next)) == number_of_digits  = fib
                                    | otherwise                                 = helper curr next (fib+1)
                                    where
                                        next = curr + prev
                                        
main = do
    print result
    where
        result = findFibExeedingNumberOfDigits