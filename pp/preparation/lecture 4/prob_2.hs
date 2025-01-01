-- pyt :: Num c, Ord c, Enum c => c -> [(c,c,c)]
pyt k = [(a,b,c) | a <- [0..k], b <- [0..k], c <- [0..k], a <= b && b < c, a^2 + b^2 == c^2]