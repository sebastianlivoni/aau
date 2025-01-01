-- thesame [(1,2),(4,4),(6,7),(17,17)] should return [(4,4), (17,17)]

thesame :: Eq a => [(a,a)] -> [(a,a)]
thesame xs = filter (\(a,b) -> a == b) xs
