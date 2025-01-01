-- [a] -> ([a], [a])
midtover xs = (take l xs, drop l xs)
    where
        l = length xs `div` 2