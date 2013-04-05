import Data.List
import Data.Ratio
import EulerCommon as EC

search_range = [11..99]

curriedSafeMod = EC.safeMod 0
curriedSafeDiv = EC.safeDiv 0

getCuriousFractions :: [Ratio Int]
getCuriousFractions = map (\(x,y) -> x % y) (nub (helper search_range search_range))
                where
                    helper xs [] = []
                    helper xs (y:ys) = (filter isCurious $ zip xs $ take (length xs) (repeat y)) ++ helper xs ys

isCurious :: (Int,Int) -> Bool
isCurious (x,y) | (x1 == 0) || (x2 == 0) || (y1 == 0) || (y2 == 0) || (x >= y)      = False
                | (((x1 / y1) == r) && (x2 == y2)) || (((x1 / y2) == r) && (x2 == y1))  = True
                | (((x2 / y1) == r) && (x1 == y2)) || (((x2 / y2) == r) && (x1 == y1))  = True
                | otherwise										  						= False
                where
                    x1 = (read (show (curriedSafeMod x 10)))::Double
                    x2 = (read (show (curriedSafeDiv x 10)))::Double
                    y1 = (read (show (curriedSafeMod y 10)))::Double
                    y2 = (read (show (curriedSafeDiv y 10)))::Double
                    r  = ((read (show x))::Double) / ((read (show y))::Double)
                
main = do
    print result
        where
            result = denominator $ product getCuriousFractions