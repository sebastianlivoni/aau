data UTree a = Node a [UTree a] deriving (Show)

instance Functor UTree where
  -- fmap :: (a -> b) -> UTree a -> UTree b
  fmap g (Node x []) = Node (g x) []
  fmap g (Node x xs) = Node (g x) (map (fmap g) xs)