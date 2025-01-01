-- exercise 1:

rotate [] = []
rotate (x : xs) = xs ++ [x]

-- the function is polymorphism parametric due not having a constrained parameter.
-- It is not ad hoc because it does not have a bounded paramter

-- exercise 2:

-- allrotates :: [a] -> [[a]]
allrotates [] = []
allrotates xs = take n (infront xs)
  where
    n = length xs
    infront xs = xs : allrotates (rotate xs)

allrotates_alt xs = xs : take n (allrotates_alt (rotate xs))
  where
    n = length xs - 1

-- exercise 3

-- allrotates' :: [a] -> [[a]]
allrotates' xs = foldr (\x (h : t) -> rotate h : (h : t)) [xs] xs