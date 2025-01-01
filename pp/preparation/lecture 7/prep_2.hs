data Tree a = Leaf a | Node (Tree a) a (Tree a)

-- least :: Tree -> Int
least (Leaf x) = x
least (Node l x r) = minimum [least l, x, least r]