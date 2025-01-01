data BinaryTree = Leaf | Node (BinaryTree) (BinaryTree)

balanced (Leaf) = True
balanced (Node l r)
    | abs (num_left - num_right) <= 1 = balanced l && balanced r
    | otherwise = False
    where
        num_left = numLeafs l
        num_right = numLeafs r

numLeafs (Leaf) = 1
numLeafs (Node l r) = numLeafs l + numLeafs r

t1 = Node (Node (Leaf) (Leaf)) (Leaf) -- true
t2 = Node (Node (Node (Leaf) (Leaf)) (Leaf)) (Leaf) -- false
t3 = Node (Node (Node (Leaf) (Leaf)) (Leaf)) (Node (Node (Leaf) (Leaf)) (Node (Node (Leaf) (Leaf)) (Leaf))) -- false