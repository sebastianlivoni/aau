-- improve :: [a] -> [a]
improve [] = []
improve (x:y:xs) = x : improve xs
improve xs = xs