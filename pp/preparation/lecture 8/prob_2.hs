-- triples :: Num a => [(a,a,a) -> [a], [a], [a]]
triples [] = ([], [], [])
triples ((x,y,z):ls) = (x:xs, y:ys, z:zs)
    where
        (xs, ys, zs) = triples ls
