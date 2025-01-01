-- isolate :: Eq a => [a] -> a -> ([a], [a])
isolate xs x = (m1, m2)
    where
        m1 = filter (\k -> k /= x) xs
        m2 = filter (\k -> k == x) xs

isolate' [] _ = ([], [])
isolate' (x:xs) y
    | x == y = (m1, x:m2)
    | otherwise = (x:m1, m2)
    where
        (m1, m2) = isolate' xs y