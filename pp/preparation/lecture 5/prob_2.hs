-- descending :: Ord a => [a] -> Bool
descending [] = True
descending [x] = True
descending (x:y:xs) = x >= y && descending (y : xs)