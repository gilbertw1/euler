import Data.Ratio
import Data.List.Split (splitOn)

signedArea :: (Int,Int) -> (Int,Int) -> (Int,Int) -> Float
signedArea (ax,ay) (bx,by) (cx,cy) = 0.5 * (fromIntegral (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by)))

orientation a b c | sArea > 0 = 1
                  | sArea < 0 = -1
                  | otherwise = 0
                  where
                    sArea = signedArea a b c

hasOrigin :: (Int,Int) -> (Int,Int) -> (Int,Int) -> Bool
hasOrigin a b c = (aOrientation == bOrientation) && (bOrientation == cOrientation)
                where
                  aOrientation = orientation a b (0,0)
                  bOrientation = orientation b c (0,0)
                  cOrientation = orientation c a (0,0)

toI :: String -> Int
toI x = read x :: Int

triangleHasOrigin :: [String] -> Bool
triangleHasOrigin xs = hasOrigin (toI $ xs!!0, toI $ xs!!1) (toI $ xs!!2, toI $ xs!!3) (toI $ xs!!4, toI $ xs!!5)

main = do
  fileText <- readFile "in_problem102.txt"
  print (length $ filter (triangleHasOrigin) $ map (splitOn ",")  $ lines fileText)