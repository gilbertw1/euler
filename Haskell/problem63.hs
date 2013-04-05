main = do
    print result
    where
    result = length [x^y|x<-[1..25],y<-[1..25],(length $ show $ x^y)==y]
