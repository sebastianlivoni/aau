-- dbs :: Num a => [(a, a)] -> [(a,a)]
dbs xs
    | length xs == 0 = []
    | otherwise = filter (\(f, s) -> 2 * f == s) xs