-- bighead :: Ord a => [a] -> Int
bighead (x:xs) = length (filter (> x) xs)