-- data Tree a = Just (Tree a) | Nothing

data Tree a = Leaf a | Node (Maybe a) (Tree a) (Tree a)

-- 2.1

t1 = Node Nothing (Node Nothing (Leaf (Just 17)) (Leaf (Just 484000))) (Leaf (Just 1964))

t2 = Node (Just "bingo") (Leaf "plip") (Node (Just "plop") (Leaf "uhu") (Leaf "fedtmule"))

-- 2.2

-- isfull :: Tree a -> Bool
isfull (Leaf _) = True
isfull (Node (Just a) l r) = isfull l && isfull r
isfull (Node Nothing l r) = False

-- 2.3

-- preorder :: Tree a -> Maybe [a]

preorder (Leaf x) = Just [x]
preorder (Node (Nothing) _ _) = Nothing
preorder (Node (Just x) l r) = do
  l1 <- preorder l
  l2 <- preorder r
  return ((x) : (l1 ++ l2))

{-
preorder t = do
  let res = preorder' t
  case res of
    [] -> Nothing
    res -> Just res
  where
    preorder' (Leaf (Just a)) = [a]
    preorder' (Leaf Nothing) = []
    preorder' (Node (Just a) l r) = [a] ++ preorder' l ++ preorder' r
    preorder' (Node Nothing l r) = []
-}