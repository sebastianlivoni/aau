data Encyclopedia a = Node String a [Encyclopedia a] deriving Show

--layered (Leaf _ val) = True
--layered (Node _ val xs) = if min_level > val then all (\x -> layered x) xs else False
--    where
--        min_level = minimum (map (\(x) -> encToVal x) xs)

layered (Node _ _ []) = True
layered (Node _ val xs) = all (val <) rooted && layered simpletree
    where
        rooted = map root xs
        root (Node _ val xs) = val
        subs (Node _ _ xs) = xs
        m = maximum rooted
        simpletree = (Node "" m (pullup xs))
        pullup trees = concat (map subs trees)

--encToVal :: Encyclopedia a -> a
--encToVal (Leaf _ a) = a
--encToVal (Node _ a _) = a

t2 = (Node "plonk" 1 [(Node "zap" 3 [(Node "ninka" 8 [])]), (Node "uhu" 4 [(Node "gif" 9 [])]), (Node "bingo" 5 [])])

t3 = (Node "plonk" 1 [(Node "zap" 3 [(Node "ninka" 8 [])]), (Node "uhu" 4 [(Node "gif" 9 [])]), (Node "bingo" 5 [])])

-- hvis alle på samme level er større end parent