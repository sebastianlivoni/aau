prodthree xs ys zs = pure (*) <*> (pure (*) <*> xs <*> ys) <*> zs