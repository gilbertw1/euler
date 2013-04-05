import Data.List.Split as S

calculate_using_log :: (Float,Float) -> Float
calculate_using_log (x,y) = y * (log x)

convert_string_to_float :: String -> Float
convert_string_to_float x = read x :: Float

convert_to_float_tuple :: String -> (Float,Float)
convert_to_float_tuple x = ((convert_string_to_float $ head splitted), (convert_string_to_float $ head $ tail splitted))
			where
				splitted = S.splitOn "," x

maxIndex :: [Float] -> Int
maxIndex xs = head $ filter ((== maximum xs) . (xs !!)) [0..]

main = do
    fileText <- readFile "in_problem99.txt"
    print $ 1 + (maxIndex $ map calculate_using_log $ map convert_to_float_tuple $ lines fileText)