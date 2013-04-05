import EulerCommon as EC
import Data.List.Split as L

triangles :: [Int]
triangles = map (\x -> div (x^2 + x) 2) [1..] 

isInOrderedList :: [Int] -> Int -> Bool
isInOrderedList (x:xs) y | x > y  = False
						 | x == y = True
						 | otherwise = isInOrderedList xs y	
		
main = do
    fileText <- readFile "in_problem42.txt"
    print (length $ filter (isInOrderedList triangles) $ map EC.convertWordToNumber $ map (init . tail) $ L.splitOn "," fileText)
