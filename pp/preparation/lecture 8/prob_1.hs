-- 1.1

-- e1 :: (Ord a, Num a) => a −> a −> [[Bool]] −> Bool
e1 a b cs = a * b == 0 && head (head cs)

-- 1.2

-- e2 :: Num a => (t -> a, t) -> a -> a
e2 (f, t) a = f a + f t

-- 1.2

-- e3 :: Fractional t1 => (t2 -> t1) -> (t2 -> t1) -> (t1 -> t3) -> t2 -> t3
e3 f1 f2 f3 x = f3 ((f1 x) / (f2 x))