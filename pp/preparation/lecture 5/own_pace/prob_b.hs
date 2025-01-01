amy :: (a -> Bool) -> [a] -> Bool
amy _ [] = False
amy f (x:xs) = f x || amy f xs