data UTree a = Node a [UTree a] deriving (Show)

instance Functor UTree where
  -- fmap :: (a -> b) -> f a -> f b
  -- fmap :: (a -> b) -> UTree a -> UTree b
  fmap g (Node x xs) = Node (g x) (map (fmap g) xs)

t1 = Node 1 [Node 2 [Node 3 []], Node 4 [Node 5 []]]