sumOfSquares :: [Int] -> Int
sumOfSquares xs = sum (map (^2) xs)

squareOfSum :: [Int] -> Int
squareOfSum xs = (sum xs)^2

main = do
    print result
    where
        numbers = [1..100]
        result = (squareOfSum numbers) - (sumOfSquares numbers)
    