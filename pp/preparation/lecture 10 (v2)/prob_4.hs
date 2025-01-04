prodthree xs ys zs = pure (*) <*> (pure (*) <*> xs <*> ys) <*> zs

prodthree' xs ys zs = [(*)] <*> (pure (*) <*> xs <*> ys) <*> zs