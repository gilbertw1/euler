import EulerCommon (isPrime)

minPercent = 0.10

execLvl :: Integer -> Integer -> (Integer,Integer)
execLvl val lvl = ((val + (step * 4)),getPrimeNum val step)
            where
                step = lvl * 2
                getPrimeNum x y = fromIntegral $ length $ filter isPrime [x+y,x+(y*2),x+(y*3),x+(y*4)]

getDiagPrimeCount :: Integer
getDiagPrimeCount = helper 1 1 0 1
                        where 
                            helper val lvl acc valAcc
                                | valAcc > 1 && percentage < minPercent = (lvl*2)+1
                                | otherwise                             = helper (fst lvlRes) (lvl+1) (acc + (snd lvlRes)) (valAcc+4)
                                where
                                    lvlRes = execLvl val lvl
                                    percentage = ((fromIntegral acc) / (fromIntegral valAcc))

main = do
    print result
    where
    result = getDiagPrimeCount
