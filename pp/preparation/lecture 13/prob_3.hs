-- indflet :: a -> [a] -> [a]
indflet _ [] = []
indflet _ [x] = [x]
indflet e (x : y : ys) = x : e : indflet e (y : ys)