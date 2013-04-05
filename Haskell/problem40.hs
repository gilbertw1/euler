import EulerCommon as EC

specified_locations = [1,10,100,1000,10000,100000,1000000]

get_products_of_specified_locations :: Int
get_products_of_specified_locations = helper 0 1 1 specified_locations
                            where
                                helper curr num acc [] = acc
                                helper curr num acc loc | next_loc <= new_size = helper new_size (num+1) ((zs!!(next_loc - curr - 1))*acc) (tail loc) 
                                                        | otherwise            = helper new_size (num+1) acc loc 
                                                        where 
                                                            zs = EC.digits num
                                                            next_loc = head loc
                                                            new_size = curr + (length zs)
                                                        
main = do
    print result
    where
        result = get_products_of_specified_locations