-- (a)
partition_filter p xs = (filter p xs, filter (not . p) xs)

-- b)
partition_foldr p xs = (satisfied, unsatisfied)
    where
        satisfied = foldr (\y ys -> if p y then y : ys else ys) [] xs
        unsatisfied = foldr (\y ys -> if not (p y) then y : ys else ys) [] xs