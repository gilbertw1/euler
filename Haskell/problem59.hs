import Data.Bits
import Data.Char
import Text.Regex.Posix
import Data.List.Split

evalRegex = "(nd | th| ch|ch )"
startAscii = 97
endAscii = 122

greater :: (Int,Int) -> (Int,Int) -> (Int,Int)
greater (x,x') (y,y') | x > y  	  = (x,x')
					  | otherwise = (y,y')

decodeText :: [Int] -> Int -> Int -> Int -> (Int,Int)
decodeText cipher a b c = ((map chr asciiCodeRep) =~ evalRegex::Int,(sum asciiCodeRep)) 
					where
					asciiCodeRep = map (\(x,y) -> xor x y) $ zip cipher $ concat $ repeat [a,b,c]
					
findSumWithMostMatches :: [Int] -> Int
findSumWithMostMatches xs = snd $ helper xs startAscii startAscii startAscii (0,0)
						where
						helper xs a b c r | a == endAscii = r
										  | c == endAscii = helper xs a (b+1) startAscii $ greater (decodeText xs a b c) r 
									      | b == endAscii = helper xs (a+1) startAscii c $ greater (decodeText xs a b c) r
										  | otherwise 	  = helper xs a b (c+1) $ greater (decodeText xs a b c) r
										
main = do
	cipher <- readFile "in_problem59.txt"
	seq cipher $ print $ findSumWithMostMatches $ map (\x -> read x ::Int) $ splitOn "," cipher
