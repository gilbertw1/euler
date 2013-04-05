import Data.List

searchSpaceMax = 10000
searchSpaceMin = 405
cubeSpace = map (^3) [searchSpaceMin..searchSpaceMax]
sortedCubeSpaceGroups = group $ sort $ map sort $ map show cubeSpace
numberOfPerms = 5

isPermOf :: Integer -> String -> Bool
isPermOf x y = (sort $ show x) == (sort y) 

main = do
    print result
    where 
    result = head $ filter (`isPermOf` (head $ head $ filter ((==numberOfPerms) . length) sortedCubeSpaceGroups)) cubeSpace
