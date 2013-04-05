import Data.List as L
import Data.List.Split as S
import EulerCommon as EC

main = do
		fileText <- readFile "in_problem22.txt"
		print (sum $ map (\(x,y) -> x*y) $ zip [1..] $ map EC.convertWordToNumber $ L.sort $ map (init . tail) $ S.splitOn "," fileText)
