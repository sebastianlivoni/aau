-- 5.1

-- ex1 :: (Ord a, Num a) => a -> a -> a -> (a, a)
ex1 a b c = if a >= 1 then (a, b) else (b,c)
-- This involves ad hoc polymorphism due to the constrained typeclass Ord and Num.

-- 5.2

-- ex2 :: [(Integer, p -> Char)]
ex2 = [(1, \a -> 'a')]
-- It involves parametric polymorphism on the type p

-- 5.3

-- ex3 :: (t1 -> Bool -> t2) -> t1 -> t2
ex3 arg1 arg2 = arg1 arg2 True

-- 5.4

-- ex4 :: (Num a, Enum a) => [a]
ex4 = [3..5]