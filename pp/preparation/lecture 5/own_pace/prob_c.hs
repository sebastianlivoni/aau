frequencies :: (Num b, Eq a) => [a] -> [(a, b)]
frequencies [] = []
frequencies (x:xs) = (x, count x (x:xs)) : frequencies (remove x xs)
  where
    -- count :: Eq a => a -> [a] -> Int
    count _ [] = 0
    count y (z:zs) 
      | y == z    = 1 + count y zs
      | otherwise = count y zs
    
    -- remove :: Eq a => a -> [a] -> [a]
    remove _ [] = []
    remove y (z:zs)
      | y == z    = remove y zs
      | otherwise = z : remove y zs