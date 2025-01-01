-- frequencies :: [a] -> [(a, Int)]
frequencies [] = []
frequencies (x:xs) = (x, count) : frequencies (filter (\y -> not (x == y)) xs)
    where
        count = length (filter (==x) (x:xs))