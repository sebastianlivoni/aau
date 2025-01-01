data Tree a = Leaf a | Node (Tree a) (Tree a)

minmax (Leaf a) = (a, a)
minmax (Node a b) = (min min_l min_r, max max_l max_r)
    where
        (min_l, max_l) = minmax a
        (min_r, max_r) = minmax b

minorder t = do
    case t of
        Leaf a -> Just a
        Node a b -> do
            minorder_l <- minorder a
            minorder_r <- minorder b

            let (min_a, max_a) = minmax a
            let (min_b, _) = minmax b
            
            if (min_a <= min_b && max_a <= min_b) then Just (min minorder_l minorder_r) else Nothing

t1 = Node (Node (Leaf "aha") (Leaf "dingo")) (Leaf "plop")
t2 = Node (Node (Leaf "aha") (Leaf "plop")) (Leaf "dingo")
t3 = Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Leaf 4))
t4 = Node (Leaf 5) (Node (Leaf 7) (Leaf 6))
t5 = Node (Node (Leaf 1) (Leaf 3)) (Node (Leaf 2) (Leaf 4))
t6 = Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Leaf 4))