square_size = 1001

getDiagSumForOddSquare :: Integer
getDiagSumForOddSquare = helper (div (square_size-1) 2) 1 1 0
                        where 
                            helper max_lvl val lvl acc
                                | lvl > max_lvl  = acc+1
                                | otherwise      = helper max_lvl (fst lvlRes) (lvl+1) (acc + (snd lvlRes)) 
                                where
                                    lvlRes = execLvl val lvl
                                    
execLvl :: Integer -> Integer -> (Integer,Integer)
execLvl val lvl = ((val + (step * 4)),addSteps val step)
            where
                step = lvl * 2
                addSteps x y = snd (foldr (\a (bo,bs) -> (a+bo,bs + (a+bo))) (x,0) (take 4 (repeat y)))
                
main = do
    print result
    where
        result = getDiagSumForOddSquare