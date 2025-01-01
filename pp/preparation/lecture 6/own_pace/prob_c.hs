-- remove :: (Foldable t1, Foldable t2, Eq a) => t2 a -> t1 a -> [a]
remove xs ys = foldr (\y ys -> if elem y xs then ys else y : ys) [] ys