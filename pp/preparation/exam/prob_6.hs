-- 6.1
naturals = naturals' 1
  where
    naturals' n = n : naturals' (n + 1)

-- 6.2
fac 0 = 1
fac n = n * fac (n - 1)

facs = map fac naturals
facs_ = map fac [0..]

facs' = 1 : zipWith (*) naturals facs'