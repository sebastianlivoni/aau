-- Exercise 3.1: List comprehenson
remove xs ys = [y | y <- ys, not (elem y xs)]

-- Exercise 3.2: Recursion
remove' [] ys = ys
remove' (x:xs) ys = remove' xs (filter (\y -> not (x == y)) ys)
