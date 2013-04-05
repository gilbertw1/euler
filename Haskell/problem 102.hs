slope :: (Int,Int) -> (Int,Int) -> Ratio
slope (x1,y1) (x2,y2) = (y2-y1) % (x2-x1)

hasOrigin :: (Int,Int) -> (Int,Int) -> (Int,Int) -> Bool
hasOrigin (ax,ay) (bx,by) (cx,cy) | originSlope > bSlope && originSlope < cSlope = True
                                  | originSlope < bSlope && originSlope > cSlope = True
                                  | otherwise                                    = False
                                  where
                                    originSlope = slope (ax,ay) (0,0)
                                    bSlope = slope (ax,ay) (bx,by)
                                    cSlope = slope (ax,ay) (cx,cy)

main = do
  print (hasOrigin (-340,495) (-153,-910) (835,-947))