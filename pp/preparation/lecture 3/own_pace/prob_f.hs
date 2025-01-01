-- expr :: (Ord a1, Eq a2) => a2 −> a2 −> (a1, a1) −> a1

expr a b (c1, c2) = if a == b && c1 > c2 then c1 else c2