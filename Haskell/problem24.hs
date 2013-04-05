import Data.List 
import EulerCommon as EC

perms [] _= []
perms xs n= x : perms (delete x xs) (mod n m)
  where m = EC.factorial $ length xs - 1
        y = div n m
        x = xs!!y
 
main = do
    print result
    where
        result = perms "0123456789" 999999