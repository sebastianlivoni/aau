-- replicate' :: Num a, Eq a => a -> b -> [b]
replicate' 0 x = []
replicate' 1 x = [x]
replicate' n x = x : replicate' (n - 1) x